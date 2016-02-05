# log 'message' do
#   message 'Create script/security directories...'
#   level :info
# end

directory node['windows_security_policy']['library_script_directory'] do
  recursive true
  action :create
end

directory node['windows_security_policy']['lsa_temp_directory'] do
  recursive true
  action :create
end

# Need to assemble hashes in the PowerShell format to handle within the script
sec_handler = '@{'
node['windows_security_policy']['local_security_authority_db']['config'].each do |sec_option, sec_value|
  sec_handler += "\"#{sec_option}\" = #{sec_value};"
end
sec_handler = sec_handler[0...-1] + '}' # Remove the last semicolon
# log 'message' do
#   message "Config Handler (sec_handler) to PowerShell: #{sec_handler}"
#   level :info
# end

# Need to assemble hashes in the PowerShell format to handle within the script
reg_handler = '@{'
node['windows_security_policy']['local_security_authority_db']['Registry'].each do |reg_option, reg_value|
  reg_handler += "\"#{reg_option}\" = #{reg_value};"
end
reg_handler = reg_handler[0...-1] + '}' # Remove the last semicolon
# log 'message' do
#   message "Registry Handler (reg_handler) to PowerShell: #{reg_handler}"
#   level :info
# end

# TODO: Some of these options require a server restart.  Need to determine how to handle intelligently.
# https://support.microsoft.com/en-us/kb/2573113
powershell_script 'set local security authority config parameters' do
  code <<-EOH
  function IsNumeric {
      param($Value)
    try
    {
      0 + $Value | Out-Null
      $IsNumeric = 1
    }
    catch
    {
      $IsNumeric = 0
    }

    if($IsNumeric){
      $IsNumeric = 1
      if($Boolean) { $Isnumeric = $True }
    }else{
      $IsNumeric = 0
      if($Boolean) { $IsNumeric = $False }
    }
    return $IsNumeric
  }
  # sleep 5
  $config_options = #{sec_handler}
  $reg_options = #{reg_handler}
  $temp = "#{node['windows_security_policy']['lsa_temp_directory']}"
  $newfile = "$temp\\new-pol.inf"
  $new_secdb = "$temp\\secedit.sdb"
  # Write-Eventlog -Logname 'Windows PowerShell' -Source PowerShell -EventID 601 -Entrytype Warning -Message "Local Security Authority SET.  Vars; Config Options: $config_options, Registry Options: $reg_options, Temp Directory: $temp"
  if (test-path $newfile){Remove-Item $newfile -Force}
  $EventAudit = @{}
  $SystemAccess = @{}

  foreach ($configSecOption in $config_options.GetEnumerator())
  {
  if ($configSecOption.Name.contains("Audit"))
  {
    $EventAudit.Add($configSecOption.Name, $configSecOption.Value)
  } else {
    $SystemAccess.Add($configSecOption.Name, $configSecOption.Value)
  }
  }
  "[Unicode]" | Out-File $newfile
  "Unicode=yes" | Out-File $newfile -Append
  "[System Access]" | Out-File $newfile -Append
  foreach ($configSecOption in $SystemAccess.GetEnumerator())
  {
    if (IsNumeric($configSecOption.Value))
    {"$($configSecOption.Name) = $($configSecOption.Value)" | Out-File $newfile -Append
    } else {"$($configSecOption.Name) = `"$($configSecOption.Value)`"" | Out-File $newfile -Append}
  }
  # Disabled this in favor of Advanced Audit Policies (use AuditPol.exe)
  "[Event Audit]" | Out-File $newfile -Append
  foreach ($configSecOption in $EventAudit.GetEnumerator()){"$($configSecOption.Name) = $($configSecOption.Value)" | Out-File $newfile -Append}
  "[Registry Values]" | Out-File $newfile -Append
  foreach ($configSecOption in $reg_options.GetEnumerator())
  {
      if ($configSecOption.Value[0] -eq 1)
      {"$($configSecOption.Name)=$($configSecOption.Value[0])" + "," + "`"$($configSecOption.Value[1])`"" | Out-File $newfile -Append
      } elseif (($configSecOption.Value[0] -eq 7) -and (($configSecOption.Name).substring($configSecOption.Name.length - 15, 15) -eq 'LegalNoticeText')) {"$($configSecOption.Name)=$($configSecOption.Value[0])" + "," + "`"$($configSecOption.Value[1])`"" | Out-File $newfile -Append
      } else {"$($configSecOption.Name)=$($configSecOption.Value[0])" + "," + "$($configSecOption.Value[1])" | Out-File $newfile -Append}
  }
  "[Version]" | Out-File $newfile -Append
  "signature=`"`$CHICAGO`$`"" | Out-File $newfile -Append
  "Revision=1" | Out-File $newfile -Append

  $process = [diagnostics.process]::Start("secedit.exe", "/configure /db $new_secdb /cfg $newfile /overwrite /quiet")
  $process.WaitForExit()
  # Remove-Item $newfile -Force
  EOH
  guard_interpreter :powershell_script
  only_if <<-EOH
  # sleep 5
  $config_options = #{sec_handler}
  $reg_options = #{reg_handler}
  $temp = "#{node['windows_security_policy']['lsa_temp_directory']}"
  # Write-Eventlog -Logname 'Windows PowerShell' -Source PowerShell -EventID 600 -Entrytype Warning -Message "Local Security Authority CHECK.  Vars; Config Options: $config_options, Registry Options: , Temp Directory: $temp"
  $file = "$temp\\pol.inf"
  [string] $readableNames
  $outHash = @{}

  $process = [diagnostics.process]::Start("secedit.exe", "/export /cfg $file /areas securitypolicy")
  $process.WaitForExit()
  $in = get-content $file
  Remove-Item $file -Force

  foreach ($line in $in)
  {
    if ($line.Contains("=") -and $line -notlike "Unicode*" -and $line -notlike "signature*" -and $line -notlike "Revision*" -and $line -notlike "Audit*")
    {
      if (!($line.Contains("MACHINE")))
      {
        $policy = $line.substring(0,$line.IndexOf("=") - 1)
        $values = ($line.substring($line.IndexOf("=") + 1,$line.Length - ($line.IndexOf("=") + 1))).trim()
        if ($values.Contains("`"")){
            $outHash.Add($policy,($values.Substring(1)).substring(0,$values.Length - 2))
        } else {
            $outHash.Add($policy,$values)
        }
      } else {
        if ($line.Contains("`""))
        {
            $policy = $line.split("=")[0]
            $values = $line.split("=")[1] -replace "`"", ""
            $outHash.Add($policy,$values)
        } else {
            $policy = $line.split("=")[0]
            $values = $line.split("=")[1]
            $outHash.Add($policy,$values)
        }
      }
    }
  }

  $diffFound = $false
  foreach ($configSecOption in $config_options.GetEnumerator())
  {
      foreach ($existConfig in $outHash.GetEnumerator())
      {
          if ($configSecOption.Name -eq $existConfig.Name)
          {
              if ($configSecOption.value -ne $existConfig.value)
              {
                  $diffFound = $true
              }
          }
      }
  }

  # There is special handling for only REGISTRY options here.
  foreach ($regSecOption in $reg_options.GetEnumerator())
  {
      # write-host "Reg Option: " $regSecOption.Name -BackgroundColor Blue
      foreach ($existConfig in $outHash.GetEnumerator())
      {
          # write-host "Existing Config Option: " $existConfig.Name -BackgroundColor Green
          if ($regSecOption.Name -eq $existConfig.Name)
          {
              $regSecOptionConcat = $regSecOption.Value[0].toString() + "," + $regSecOption.Value[1].ToString()
              if ($regSecOptionConcat -ne $existConfig.Value)
              {
                  $diffFound = $true
              }
          }
      }
  }
  # True signifies that there are differences and that they need to be reconfigured
  $diffFound
  EOH
end

# Only run this section of code if Advanced Policies is enabled.
# https://support.microsoft.com/en-us/kb/2573113
# puts "What is this? #{(node['windows_security_policy']['local_security_authority_db']['Registry']['MACHINE\System\CurrentControlSet\Control\Lsa\SCENoApplyLegacyAuditPolicy']).split(',')[1]}"
if (node['windows_security_policy']['local_security_authority_db']['Registry']['MACHINE\System\CurrentControlSet\Control\Lsa\SCENoApplyLegacyAuditPolicy']).split(',')[1] == '1'
  node['windows_security_policy']['local_security_authority_db']['advanced_auditing'].each do |audit_config, audit_value|
    # puts "\n \n Audit Policy Config: #{audit_config}, Audit Policy Value: #{audit_value} \n \n"
    audit_value.each do |audit_parameter|
      # puts "\n Audit Policy Parameter: #{audit_parameter}"
      powershell_script "set advanced auditing configuration - #{audit_parameter}" do
        code <<-EOH
        function Get-ConfigValue
        {
          param($pol_number)
          switch ($pol_number)
          {
            0 {return "/success:disable /failure:disable"}
            1 {return "/success:enable /failure:disable"}
            2 {return "/success:disable /failure:enable"}
            3 {return "/success:enable /failure:enable"}
          }
        }
        sleep 5
        $debug_script = $false
        $category = "#{audit_config}"
        $subcategory = "#{audit_parameter[0]}"
        $new_policy_setting = #{audit_parameter[1]}
        # Write-Eventlog -Logname 'Windows PowerShell' -Source PowerShell -EventID 601 -Entrytype Warning -Message "Advanced Auditing SET.  Vars; Category: $category, Subcategory: $subcategory, New Policy Setting: $new_policy_setting"

        $new_policy_value = Get-ConfigValue $new_policy_setting
        if ($debug_script){write-host "Value: " $new_policy_value}

        $process = [diagnostics.process]::Start("auditpol.exe", "/set /subcategory:`"$subcategory`" $new_policy_value")
        $process.WaitForExit()
        EOH
        guard_interpreter :powershell_script
        not_if <<-EOH
        function Get-ConfigValue
        {
          param($pol_number)
          switch ($pol_number)
          {
            0 {return "No Auditing"}
            1 {return "Success"}
            2 {return "Failure"}
            3 {return "Success and Failure"}
          }
        }
        # sleep 6
        $debug_script = $false
        $category = "#{audit_config}"
        $subcategory = "#{audit_parameter[0]}"
        $new_policy_setting = #{audit_parameter[1]}
        # Write-Eventlog -Logname 'Windows PowerShell' -Source PowerShell -EventID 600 -Entrytype Warning -Message "Advanced Auditing CHECK.  Vars; Category: $category, Subcategory: $subcategory, New Policy Setting: $new_policy_setting"

        $new_policy_value = Get-ConfigValue $new_policy_setting
        if ($debug_script){write-host "Value: " $new_policy_value}

        $curr_audit_pol_setting = auditpol /get /category:$category /r | Where-Object {$_.contains($subcategory)}
        if ($debug_script){write-host "Setting: " $curr_audit_pol_setting}
        $curr_value = $curr_audit_pol_setting.split(",")[4]
        if ($debug_script){write-host $curr_value}
        if ($new_policy_value -eq $curr_value)
        {
          # They match
          write-host $true
        } else {
          # They do not match
          write-host $false
        }
        EOH
      end
    end
  end

  # TODO: The guard is not working properly and it doesn't make sense.  It should be working fine, but there appears to be a timing issue
  node['windows_security_policy']['local_security_authority_db']['advanced_auditing_options'].each do |adv_pol_options|
    powershell_script "set advanced auditing options configuration - #{adv_pol_options}" do
      code <<-EOH
      # sleep 7
      $debug_script = $false
      $lsa_advaudit_option = '#{adv_pol_options[0]}'
      $lsa_advaudit_value = '#{adv_pol_options[1]}'
      # Write-Eventlog -Logname 'Windows PowerShell' -Source PowerShell -EventID 601 -Entrytype Warning -Message "Advanced Auditing Options SET.  Vars; Adv Option: $lsa_advaudit_option, Adv Option Setting: $lsa_advaudit_value"

      $lsa_advaudit_action = $lsa_advaudit_value.Substring(0,$lsa_advaudit_value.length - 1)

      $process = [diagnostics.process]::Start("auditpol.exe", "/set /option:$lsa_advaudit_option /value:$lsa_advaudit_action")
      $process.WaitForExit()
      EOH
      guard_interpreter :powershell_script
      not_if <<-EOH
      # sleep 8
      $debug_script = $false
      $lsa_advaudit_option = '#{adv_pol_options[0]}'
      $lsa_advaudit_value = '#{adv_pol_options[1]}'
      # Write-Eventlog -Logname 'Windows PowerShell' -Source PowerShell -EventID 600 -Entrytype Warning -Message "Advanced Auditing Options CHECK.  Vars; Adv Option: $lsa_advaudit_option, Adv Option Setting: $lsa_advaudit_value"
      $bolOutcome = $false

      $exitCode = [Diagnostics.Process]::Start('auditpol.exe','/get /option:$lsa_advaudit_option /r').WaitForExit('10')
      $curr_audit_option_setting = $exitCode | Where-Object {$_.contains($lsa_advaudit_option)}
      if ($debug_script){write-host "Setting: " $curr_audit_option_setting}
      $curr_value = $curr_audit_option_setting.split(",")[4]
      if ($debug_script){write-host $curr_value}
      if ($lsa_advaudit_value -eq $curr_value)
      {
        # They match
        $bolOutcome = $true
      } else {
        # They do not match
        $bolOutcome = $false
      }
      $bolOutcome
      EOH
    end
  end
end
