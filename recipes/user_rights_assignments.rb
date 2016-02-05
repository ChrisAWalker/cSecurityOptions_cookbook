# ASSUMPTION:
# This recipe ASSUMES that the accounts (local or domain) are already created.
# The recipe WILL error if these are not created or are not available.

# Setup C:\Temp Folder if it's not already
directory 'C:\Temp' do
  rights :read_execute, 'Users', applies_to_children: true
  rights :full_control, 'Administrators', applies_to_children: true
  inherits true
end

directory node['windows_security_policy']['library_script_directory'] do
  rights :read_execute, 'Users', applies_to_children: true
  rights :full_control, 'Administrators', applies_to_children: true
  recursive true
  action :create
end

# https://gallery.technet.microsoft.com/scriptcenter/Grant-Revoke-Query-user-26e259b0/view/Reviews
cookbook_file(node['windows_security_policy']['library_script_directory'] + '\UserRights.psm1') do
  action :create
end

# Set all user rights assignments
node['windows_security_policy']['ura'].each do |privilege, identity|
  powershell_script 'check_grant_revoke privileges' do
    code <<-EOH
    #"Privilege #{privilege} with #{identity}" | out-file C:\\Temp\\impl-debug.txt -append
    # Logic to guard if we need to modify user rights
    # $false should be returned if user rights need to be updated
    # $true should be returned if user rights should not be updated (they are current)
    # Param($identity, $privilege)
    # Turns on debugging output to screen
    $debug_script = $false
    # sleep 5
    $privilege = '#{privilege}'
    [array]$identity = #{identity}

    # The $identity array is a fixed size, which cannot be changed.  Need to convert to something to be modified:
    [System.Collections.ArrayList]$arrListIdentity = $identity
    # Local Accounts need to have the prefix of the hostname provided, like 'WINSRV2012R2\\localuser', instead of just 'localuser'
    # Arrays cannot be changed while looping through them.  We need to track which need to be modified so that we can modify later
    $arrIDchanges = @()
    foreach ($id in $arrListIdentity)
    {
      $user = ""
      if (!($id.contains("\\")))
      {
        if ($debug_script){write-host "ID: " $id}
        $user = (gwmi -class Win32_UserAccount -Filter "LocalAccount = 'True' AND Name = '$id'").Caption
        if ($user)
        {
          $arrIDchanges += $user
        }
      }
    }

    # Now we know which need to be changed, so modify the source array list
    foreach ($userID in $arrIDchanges)
    {
      [void]$arrListIdentity.Remove($userID.split("\\")[1])
      [void]$arrListIdentity.Add($userID)
    }

    # Load the library file for querying user rights
    if (!(Get-Module -Name UserRights)){Import-Module #{(node['windows_security_policy']['library_script_directory'] + '\UserRights.psm1')}}
    if ($debug_script){write-host "Identity: " $identity}
    if ($debug_script){write-host "Privilege: " $privilege}

    $bolAllFound = $false
    [array]$members = (Get-AccountsWithUserRight $privilege).Account
    if ($debug_script){write-host "LSA Accounts: " $members}
    #"Within LSA: $members, With Priv: $privilege" | out-file C:\\Temp\\members.txt -append

    if (($arrListIdentity.count -eq 1) -and ($arrListIdentity[0].Length -eq 0))
    {
        [void]$arrListIdentity.Remove('')
    }

    # The following is the check to validate that each compare array has a value.
    if (($members -eq $null) -and ($arrListIdentity.count -gt 0))
    {
      foreach($account in $arrListIdentity)
      {
        Grant-UserRight -Account $account -Right $privilege
      }
    } elseif (($members.count -gt 0) -and ($arrListIdentity.count -eq 0)) {
      foreach($account in $members)
      {
        Revoke-UserRight -Account $account -Right $privilege
      }
    } else {
      $c = @(Compare-Object $members $arrListIdentity)
      if ($c.Length -ne 0)
      {
        foreach($account in $c)
        {
          switch ($account.SideIndicator)
          {
            "=>" {Grant-UserRight -Account $account.InputObject -Right $privilege}
            "<=" {Revoke-UserRight -Account $account.InputObject -Right $privilege}
          }
        }
      }
    }
    EOH
    guard_interpreter :powershell_script
    not_if <<-EOH
    # Logic to guard if we need to modify user rights
    # $false should be returned if user rights need to be updated
    # $true should be returned if user rights should not be updated (they are current)
    # Param($identity, $privilege)
    function Test-RegistryKeyValue
    {
      <#
      .SYNOPSIS
      Tests if a registry value exists.

      .DESCRIPTION
      The usual ways for checking if a registry value exists don't handle when a value simply has an empty or null value.  This function actually checks if a key has a value with a given name.

      .EXAMPLE
      Test-RegistryKeyValue -Path 'hklm:\\Software\\Carbon\\Test' -Name 'Title'

      Returns `True` if `hklm:\\Software\\Carbon\\Test` contains a value named 'Title'.  `False` otherwise.
      #>
      [CmdletBinding()]
      param(
          [Parameter(Mandatory=$true)]
          [string]
          # The path to the registry key where the value should be set.  Will be created if it doesn't exist.
          $Path,

          [Parameter(Mandatory=$true)]
          [string]
          # The name of the value being set.
          $Name
      )

      if( -not (Test-Path -Path $Path -PathType Container) ){return $false}

      $properties = Get-ItemProperty -Path $Path
      if( -not $properties ){return $false}

      $member = Get-Member -InputObject $properties -Name $Name
      if( $member )
      {
          return $true
      }
      else
      {
          return $false
      }
    }

    # Turns on debugging output to screen
    $debug_script = $false
    # sleep 10
    $privilege = '#{privilege}'
    [array]$identity = #{identity}

    # Due to Core not understanding these two privileges (not sure why), we can not run these now.
    if ((($privilege -eq 'SeChangeNotifyPrivilege') -or ($privilege -eq 'SeIncreaseWorkingSetPrivilege')) -and (!(Test-RegistryKeyValue -Path 'HKLM:\\Software\\Microsoft\\Windows NT\\CurrentVersion\\Server\\ServerLevels' -Name 'Server-Gui-Shell')))
    {
      $true
      exit
    }

    # The $identity array is a fixed size, which cannot be changed.  Need to convert to something to be modified:
    [System.Collections.ArrayList]$arrListIdentity = $identity
    # Local Accounts need to have the prefix of the hostname provided, like 'WINSRV2012R2\\localuser', instead of just 'localuser'
    # Arrays cannot be changed while looping through them.  We need to track which need to be modified so that we can modify later
    $arrIDchanges = @()
    foreach ($id in $arrListIdentity)
    {
      $user = ""
      if (!($id.contains("\\")))
      {
        if ($debug_script){write-host "ID: " $id}
        $user = (gwmi -class Win32_UserAccount -Filter "LocalAccount = 'True' AND Name = '$id'").Caption
        if ($user)
        {
          $arrIDchanges += $user
        }
      }
    }

    # Now we know which need to be changed, so modify the source array list
    foreach ($userID in $arrIDchanges)
    {
      [void]$arrListIdentity.Remove($userID.split("\\")[1])
      [void]$arrListIdentity.Add($userID)
    }

    # Load the library file for querying user rights
    if (!(Get-Module -Name UserRights)){Import-Module #{(node['windows_security_policy']['library_script_directory'] + '\UserRights.psm1')}}
    if ($debug_script){write-host "Identity: " $identity}
    if ($debug_script){write-host "Privilege: " $privilege}

    $bolAllFound = $false
    [array]$members = (Get-AccountsWithUserRight $privilege).Account
    if ($debug_script){write-host "LSA Accounts: " $members}
    #"Within LSA: $members, With Priv: $privilege" | out-file C:\\Temp\\members.txt -append

    # We are clearing any blank values that may exist
    if (($arrListIdentity.count -eq 1) -and ($arrListIdentity[0].Length -eq 0))
    {
        [void]$arrListIdentity.Remove('')
    }

    # The following is the check to validate that each compare array has a value.
    if ((($members -eq $null) -and ($arrListIdentity.count -gt 0)) -or (($members.count -gt 0) -and ($arrListIdentity.count -eq 0)))
    {
      $bolAllFound = $false
    } elseif (($members.count -eq 0) -and ($arrListIdentity.count -eq 0)) {
      $bolAllFound = $true
    } else {
      $c = @(Compare-Object $members $arrListIdentity)
      if ($c.Length -eq 0){$bolAllFound = $true}
    }
    if ($debug_script){write-host "Outcome (true=same, false=update): " $bolAllFound}
    $bolAllFound
    EOH
  end
end
