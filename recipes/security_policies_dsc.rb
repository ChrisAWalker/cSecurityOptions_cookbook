dsc_resource "Windows Security - Account and Basic Auditing Policies" do
    resource :AccountAndBasicAuditing
    property :Enable, 'True'
    property :AccountAndBasicAuditing, node['windows_security_policy']['local_security_authority_db']['config_dsc'].to_hash
end

dsc_resource "Windows Security - Local Security Policies" do
    resource :LSA_SecurityOptions
    property :Enable, 'True'
    property :LSA_SecurityOptions , node['windows_security_policy']['local_security_authority_db']['registry_dsc'].to_hash
end

# Only run this section of code if Advanced Policies is enabled.
# https://support.microsoft.com/en-us/kb/2573113
if (node['windows_security_policy']['local_security_authority_db']['registry_dsc']['\"MACHINE\System\CurrentControlSet\Control\Lsa\SCENoApplyLegacyAuditPolicy\"']).split(',')[1] == '1'
  node['windows_security_policy']['local_security_authority_db']['advanced_auditing_dsc'].each do |audit_config, audit_value|
    dsc_resource "Windows Security - Advanced Auditing - #{audit_config} - #{audit_value}" do
      resource :AdvancedAuditing
      property :Category, audit_config
      property :AuditLevel, audit_value
    end
  end

  node['windows_security_policy']['local_security_authority_db']['advanced_auditing_options_dsc'].each do |adv_pol_option, adv_pol_value|
    dsc_resource "Windows Security - Advanced Auditing Options - #{adv_pol_option} - #{adv_pol_value}" do
      resource :AdvancedAuditOptions
      property :AdvancedAuditOption, adv_pol_option
      property :Ensure, adv_pol_value
    end
  end
end
