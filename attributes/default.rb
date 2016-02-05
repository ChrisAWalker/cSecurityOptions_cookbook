# Attributes for User Rights Assignments
# Location of Library Shell
default['windows_security_policy']['library_script_directory'] = 'C:\Windows\MYCOMPANY\UserRightsAssignments'
# Read within the files/default/UserRights.ps1 file for detailed usage
# The values must be a string of strings.  It is how it gets translated through Chef to PowerShell.
default['windows_security_policy']['ura']['SeTrustedCredManAccessPrivilege'] = "''" # Access Credential Manager as a trusted caller
default['windows_security_policy']['ura']['SeNetworkLogonRight'] = "'Everyone', 'BUILTIN\\Administrators', 'BUILTIN\\Users', 'BUILTIN\\Backup Operators'" # Access this computer from the network
default['windows_security_policy']['ura']['SeTcbPrivilege'] = "''" # Act as part of the operating system
default['windows_security_policy']['ura']['SeMachineAccountPrivilege'] = "''" # Add workstations to domain
default['windows_security_policy']['ura']['SeIncreaseQuotaPrivilege'] = "'NT AUTHORITY\\LOCAL SERVICE', 'NT AUTHORITY\\NETWORK SERVICE', 'BUILTIN\\Administrators'" # Adjust memory quotas for a process
default['windows_security_policy']['ura']['SeInteractiveLogonRight'] = "'BUILTIN\\Administrators', 'BUILTIN\\Users', 'BUILTIN\\Backup Operators'" # Allow log on locally
default['windows_security_policy']['ura']['SeRemoteInteractiveLogonRight'] = "'BUILTIN\\Administrators', 'Remote Desktop Users'" # Allow log on through Remote Desktop Services
default['windows_security_policy']['ura']['SeBackupPrivilege'] = "'BUILTIN\\Administrators', 'BUILTIN\\Backup Operators'" # Back up files and directories
# SeChangeNotifyPrivilege - This is not working on Windows 2012R2 Core - It is coded to bypass this setting within the recipe
default['windows_security_policy']['ura']['SeChangeNotifyPrivilege'] = "'Everyone', 'NT AUTHORITY\\LOCAL SERVICE', 'NT AUTHORITY\\NETWORK SERVICE', 'BUILTIN\\Administrators', 'BUILTIN\\Users', 'BUILTIN\\Backup Operators', 'Window Manager\\Window Manager Group'" # Bypass traverse checking
default['windows_security_policy']['ura']['SeSystemtimePrivilege'] = "'NT AUTHORITY\\LOCAL SERVICE', 'BUILTIN\\Administrators'" # Change the system time
default['windows_security_policy']['ura']['SeTimeZonePrivilege'] = "'NT AUTHORITY\\LOCAL SERVICE', 'BUILTIN\\Administrators'" # Change the time zone
default['windows_security_policy']['ura']['SeCreatePagefilePrivilege'] = "'BUILTIN\\Administrators'" # Create a pagefile
default['windows_security_policy']['ura']['SeCreateTokenPrivilege'] = "''" # Create a token object
default['windows_security_policy']['ura']['SeCreateGlobalPrivilege'] = "'NT AUTHORITY\\LOCAL SERVICE', 'NT AUTHORITY\\NETWORK SERVICE', 'BUILTIN\\Administrators', 'NT AUTHORITY\\SERVICE'" # Create global objects
default['windows_security_policy']['ura']['SeCreatePermanentPrivilege'] = "''" # Create permanent shared objects
default['windows_security_policy']['ura']['SeCreateSymbolicLinkPrivilege'] = "'BUILTIN\\Administrators'" # Create symbolic links
default['windows_security_policy']['ura']['SeDebugPrivilege'] = "'BUILTIN\\Administrators'" # Debug programs
default['windows_security_policy']['ura']['SeDenyNetworkLogonRight'] = "''" # Deny access this computer from the network
default['windows_security_policy']['ura']['SeDenyBatchLogonRight'] = "''" # Deny log on as a batch job
default['windows_security_policy']['ura']['SeDenyServiceLogonRight'] = "''" # Deny log on as a service
default['windows_security_policy']['ura']['SeDenyInteractiveLogonRight'] = "''" # Deny log on locally
default['windows_security_policy']['ura']['SeDenyRemoteInteractiveLogonRight'] = "''" # Deny log on through Remote Desktop Services
default['windows_security_policy']['ura']['SeEnableDelegationPrivilege'] = "''" # Enable computer and user accounts to be trusted for delegation
default['windows_security_policy']['ura']['SeRemoteShutdownPrivilege'] = "'BUILTIN\\Administrators'" # Force shutdown from a remote system
default['windows_security_policy']['ura']['SeAuditPrivilege'] = "'NT AUTHORITY\\LOCAL SERVICE', 'NT AUTHORITY\\NETWORK SERVICE'" # Generate security audits
default['windows_security_policy']['ura']['SeImpersonatePrivilege'] = "'NT AUTHORITY\\LOCAL SERVICE', 'NT AUTHORITY\\NETWORK SERVICE', 'BUILTIN\\Administrators', 'NT AUTHORITY\\SERVICE'" # Impersonate a client after authentication
# SeIncreaseWorkingSetPrivilege - This is not working on Windows 2012R2 Core - It is coded to bypass this setting within the recipe
default['windows_security_policy']['ura']['SeIncreaseWorkingSetPrivilege'] = "'BUILTIN\\Users', 'Window Manager\\Window Manager Group'" # Increase a process working set
default['windows_security_policy']['ura']['SeIncreaseBasePriorityPrivilege'] = "'BUILTIN\\Administrators'" # Increase scheduling priority
default['windows_security_policy']['ura']['SeLoadDriverPrivilege'] = "'BUILTIN\\Administrators'" # Load and unload device drivers
default['windows_security_policy']['ura']['SeLockMemoryPrivilege'] = "''" # Lock pages in memory
default['windows_security_policy']['ura']['SeBatchLogonRight'] = "'BUILTIN\\Administrators', 'BUILTIN\\Backup Operators', 'Performance Log Users'" # Log on as a batch job
default['windows_security_policy']['ura']['SeServiceLogonRight'] = "'NT SERVICE\\ALL SERVICES'" # Log on as a service
default['windows_security_policy']['ura']['SeSecurityPrivilege'] = "'BUILTIN\\Administrators'" # Manage auditing and security log
default['windows_security_policy']['ura']['SeRelabelPrivilege'] = "''" # Modify an object label
default['windows_security_policy']['ura']['SeSystemEnvironmentPrivilege'] = "'BUILTIN\\Administrators'" # Modify firmware environment values
default['windows_security_policy']['ura']['SeManageVolumePrivilege'] = "'BUILTIN\\Administrators'" # Perform volume maintenance tasks
default['windows_security_policy']['ura']['SeProfileSingleProcessPrivilege'] = "'BUILTIN\\Administrators'" # Profile single process
default['windows_security_policy']['ura']['SeSystemProfilePrivilege'] = "'BUILTIN\\Administrators', 'NT SERVICE\\WdiServiceHost'" # Profile system performance
default['windows_security_policy']['ura']['SeUndockPrivilege'] = "'BUILTIN\\Administrators'" # Remove computer from docking station
default['windows_security_policy']['ura']['SeAssignPrimaryTokenPrivilege'] = "'NT AUTHORITY\\LOCAL SERVICE', 'NT AUTHORITY\\NETWORK SERVICE'" # Replace a process level token
default['windows_security_policy']['ura']['SeRestorePrivilege'] = "'BUILTIN\\Administrators', 'BUILTIN\\Backup Operators'" # Restore files and directories
default['windows_security_policy']['ura']['SeShutdownPrivilege'] = "'BUILTIN\\Administrators', 'BUILTIN\\Backup Operators'" # Shut down the system
default['windows_security_policy']['ura']['SeSyncAgentPrivilege'] = "''" # Synchronize directory service data
default['windows_security_policy']['ura']['SeTakeOwnershipPrivilege'] = "'BUILTIN\\Administrators'" # Take ownership of files or other objects

# The values must be a string of strings.  It is how it gets translated through Chef to PowerShell.
default['windows_security_policy']['dsc_ura']['SeTrustedCredManAccessPrivilege'] = [''] # Access Credential Manager as a trusted caller
default['windows_security_policy']['dsc_ura']['SeNetworkLogonRight'] = ['Everyone', 'Administrators', 'Users', 'Backup Operators'] # Access this computer from the network
default['windows_security_policy']['dsc_ura']['SeTcbPrivilege'] = [''] # Act as part of the operating system
default['windows_security_policy']['dsc_ura']['SeMachineAccountPrivilege'] = [''] # Add workstations to domain
default['windows_security_policy']['dsc_ura']['SeIncreaseQuotaPrivilege'] = ['LOCAL SERVICE', 'NETWORK SERVICE', 'Administrators'] # Adjust memory quotas for a process
default['windows_security_policy']['dsc_ura']['SeInteractiveLogonRight'] = ['Administrators', 'Users', 'Backup Operators'] # Allow log on locally
default['windows_security_policy']['dsc_ura']['SeRemoteInteractiveLogonRight'] = ['Administrators', 'Remote Desktop Users'] # Allow log on through Remote Desktop Services
default['windows_security_policy']['dsc_ura']['SeBackupPrivilege'] = ['Administrators', 'Backup Operators'] # Back up files and directories
# SeChangeNotifyPrivilege - This is not working on Windows 2012R2 Core - It is coded to bypass this setting within the recipe
default['windows_security_policy']['dsc_ura']['SeChangeNotifyPrivilege'] = ['Everyone', 'LOCAL SERVICE', 'NETWORK SERVICE', 'Administrators', 'Users', 'Backup Operators', 'Window Manager Group'] # Bypass traverse checking
default['windows_security_policy']['dsc_ura']['SeSystemtimePrivilege'] = ['LOCAL SERVICE', 'Administrators'] # Change the system time
default['windows_security_policy']['dsc_ura']['SeTimeZonePrivilege'] = ['LOCAL SERVICE', 'Administrators'] # Change the time zone
default['windows_security_policy']['dsc_ura']['SeCreatePagefilePrivilege'] = ['Administrators'] # Create a pagefile
default['windows_security_policy']['dsc_ura']['SeCreateTokenPrivilege'] = [''] # Create a token object
default['windows_security_policy']['dsc_ura']['SeCreateGlobalPrivilege'] = ['LOCAL SERVICE', 'NETWORK SERVICE', 'Administrators', 'SERVICE'] # Create global objects
default['windows_security_policy']['dsc_ura']['SeCreatePermanentPrivilege'] = [''] # Create permanent shared objects
default['windows_security_policy']['dsc_ura']['SeCreateSymbolicLinkPrivilege'] = ['Administrators'] # Create symbolic links
default['windows_security_policy']['dsc_ura']['SeDebugPrivilege'] = ['Administrators'] # Debug programs
default['windows_security_policy']['dsc_ura']['SeDenyNetworkLogonRight'] = [''] # Deny access this computer from the network
default['windows_security_policy']['dsc_ura']['SeDenyBatchLogonRight'] = [''] # Deny log on as a batch job
default['windows_security_policy']['dsc_ura']['SeDenyServiceLogonRight'] = [''] # Deny log on as a service
default['windows_security_policy']['dsc_ura']['SeDenyInteractiveLogonRight'] = [''] # Deny log on locally
default['windows_security_policy']['dsc_ura']['SeDenyRemoteInteractiveLogonRight'] = [''] # Deny log on through Remote Desktop Services
default['windows_security_policy']['dsc_ura']['SeEnableDelegationPrivilege'] = [''] # Enable computer and user accounts to be trusted for delegation
default['windows_security_policy']['dsc_ura']['SeRemoteShutdownPrivilege'] = ['Administrators'] # Force shutdown from a remote system
default['windows_security_policy']['dsc_ura']['SeAuditPrivilege'] = ['LOCAL SERVICE', 'NETWORK SERVICE'] # Generate security audits
default['windows_security_policy']['dsc_ura']['SeImpersonatePrivilege'] = ['LOCAL SERVICE', 'NETWORK SERVICE', 'Administrators', 'SERVICE'] # Impersonate a client after authentication
# # SeIncreaseWorkingSetPrivilege - This is not working on Windows 2012R2 Core - It is coded to bypass this setting within the recipe
default['windows_security_policy']['dsc_ura']['SeIncreaseWorkingSetPrivilege'] = ['Users', 'Window Manager Group'] # Increase a process working set
default['windows_security_policy']['dsc_ura']['SeIncreaseBasePriorityPrivilege'] = ['Administrators'] # Increase scheduling priority
default['windows_security_policy']['dsc_ura']['SeLoadDriverPrivilege'] = ['Administrators'] # Load and unload device drivers
default['windows_security_policy']['dsc_ura']['SeLockMemoryPrivilege'] = [''] # Lock pages in memory
default['windows_security_policy']['dsc_ura']['SeBatchLogonRight'] = ['Administrators', 'Backup Operators', 'Performance Log Users'] # Log on as a batch job
default['windows_security_policy']['dsc_ura']['SeServiceLogonRight'] = ['ALL SERVICES'] # Log on as a service
default['windows_security_policy']['dsc_ura']['SeSecurityPrivilege'] = ['Administrators'] # Manage auditing and security log
default['windows_security_policy']['dsc_ura']['SeRelabelPrivilege'] = [''] # Modify an object label
default['windows_security_policy']['dsc_ura']['SeSystemEnvironmentPrivilege'] = ['Administrators'] # Modify firmware environment values
default['windows_security_policy']['dsc_ura']['SeManageVolumePrivilege'] = ['Administrators'] # Perform volume maintenance tasks
default['windows_security_policy']['dsc_ura']['SeProfileSingleProcessPrivilege'] = ['Administrators'] # Profile single process
default['windows_security_policy']['dsc_ura']['SeSystemProfilePrivilege'] = ['Administrators', 'WdiServiceHost'] # Profile system performance
default['windows_security_policy']['dsc_ura']['SeUndockPrivilege'] = ['Administrators'] # Remove computer from docking station
default['windows_security_policy']['dsc_ura']['SeAssignPrimaryTokenPrivilege'] = ['LOCAL SERVICE', 'NETWORK SERVICE'] # Replace a process level token
default['windows_security_policy']['dsc_ura']['SeRestorePrivilege'] = ['Administrators', 'Backup Operators'] # Restore files and directories
default['windows_security_policy']['dsc_ura']['SeShutdownPrivilege'] = ['Administrators', 'Backup Operators'] # Shut down the system
default['windows_security_policy']['dsc_ura']['SeSyncAgentPrivilege'] = [''] # Synchronize directory service data
default['windows_security_policy']['dsc_ura']['SeTakeOwnershipPrivilege'] = ['Administrators'] # Take ownership of files or other objects

# Attributes for Advanced Auditing
# To use Advanced Audit Policies, you must ENABLE SCENoApplyLegacyAuditPolicy in the security options below
# 0 = No Auditing
# 1 = Audit Success
# 2 = Audit Failure
# 3 = Audit Success and Failure
default['windows_security_policy']['local_security_authority_db']['advanced_auditing']['System']['IPsec Driver'] = 0
default['windows_security_policy']['local_security_authority_db']['advanced_auditing']['System']['System Integrity'] = 3
default['windows_security_policy']['local_security_authority_db']['advanced_auditing']['System']['Security System Extension'] = 3
default['windows_security_policy']['local_security_authority_db']['advanced_auditing']['System']['Security State Change'] = 3
default['windows_security_policy']['local_security_authority_db']['advanced_auditing']['System']['Other System Events'] = 2
default['windows_security_policy']['local_security_authority_db']['advanced_auditing']['Logon/Logoff']['Network Policy Server'] = 3
default['windows_security_policy']['local_security_authority_db']['advanced_auditing']['Logon/Logoff']['Other Logon/Logoff Events'] = 3
default['windows_security_policy']['local_security_authority_db']['advanced_auditing']['Logon/Logoff']['Special Logon'] = 3
default['windows_security_policy']['local_security_authority_db']['advanced_auditing']['Logon/Logoff']['IPsec Extended Mode'] = 0
default['windows_security_policy']['local_security_authority_db']['advanced_auditing']['Logon/Logoff']['IPsec Quick Mode'] = 0
default['windows_security_policy']['local_security_authority_db']['advanced_auditing']['Logon/Logoff']['IPsec Main Mode'] = 0
default['windows_security_policy']['local_security_authority_db']['advanced_auditing']['Logon/Logoff']['Account Lockout'] = 3
default['windows_security_policy']['local_security_authority_db']['advanced_auditing']['Logon/Logoff']['Logoff'] = 3
default['windows_security_policy']['local_security_authority_db']['advanced_auditing']['Logon/Logoff']['Logon'] = 3
default['windows_security_policy']['local_security_authority_db']['advanced_auditing']['Logon/Logoff']['User / Device Claims'] = 0
default['windows_security_policy']['local_security_authority_db']['advanced_auditing']['Object Access']['SAM'] = 0
default['windows_security_policy']['local_security_authority_db']['advanced_auditing']['Object Access']['Kernel Object'] = 3
default['windows_security_policy']['local_security_authority_db']['advanced_auditing']['Object Access']['Registry'] = 3
default['windows_security_policy']['local_security_authority_db']['advanced_auditing']['Object Access']['Application Generated'] = 3
default['windows_security_policy']['local_security_authority_db']['advanced_auditing']['Object Access']['Handle Manipulation'] = 0
default['windows_security_policy']['local_security_authority_db']['advanced_auditing']['Object Access']['File Share'] = 3
default['windows_security_policy']['local_security_authority_db']['advanced_auditing']['Object Access']['Filtering Platform Packet Drop'] = 0
default['windows_security_policy']['local_security_authority_db']['advanced_auditing']['Object Access']['Filtering Platform Connection'] = 0
default['windows_security_policy']['local_security_authority_db']['advanced_auditing']['Object Access']['Other Object Access Events'] = 0
default['windows_security_policy']['local_security_authority_db']['advanced_auditing']['Object Access']['Detailed File Share'] = 0
default['windows_security_policy']['local_security_authority_db']['advanced_auditing']['Object Access']['Removable Storage'] = 0
default['windows_security_policy']['local_security_authority_db']['advanced_auditing']['Object Access']['Central Policy Staging'] = 0
default['windows_security_policy']['local_security_authority_db']['advanced_auditing']['Object Access']['Certification Services'] = 0
default['windows_security_policy']['local_security_authority_db']['advanced_auditing']['Object Access']['File System'] = 3
default['windows_security_policy']['local_security_authority_db']['advanced_auditing']['Privilege Use']['Other Privilege Use Events'] = 0
default['windows_security_policy']['local_security_authority_db']['advanced_auditing']['Privilege Use']['Non Sensitive Privilege Use'] = 0
default['windows_security_policy']['local_security_authority_db']['advanced_auditing']['Privilege Use']['Sensitive Privilege Use'] = 0
default['windows_security_policy']['local_security_authority_db']['advanced_auditing']['Detailed Tracking']['RPC Events'] = 3
default['windows_security_policy']['local_security_authority_db']['advanced_auditing']['Detailed Tracking']['DPAPI Activity'] = 0
default['windows_security_policy']['local_security_authority_db']['advanced_auditing']['Detailed Tracking']['Process Termination'] = 0
default['windows_security_policy']['local_security_authority_db']['advanced_auditing']['Detailed Tracking']['Process Creation'] = 0
default['windows_security_policy']['local_security_authority_db']['advanced_auditing']['Policy Change']['Audit Policy Change'] = 3
default['windows_security_policy']['local_security_authority_db']['advanced_auditing']['Policy Change']['MPSSVC Rule-Level Policy Change'] = 0
default['windows_security_policy']['local_security_authority_db']['advanced_auditing']['Policy Change']['Filtering Platform Policy Change'] = 0
default['windows_security_policy']['local_security_authority_db']['advanced_auditing']['Policy Change']['Authorization Policy Change'] = 3
default['windows_security_policy']['local_security_authority_db']['advanced_auditing']['Policy Change']['Authentication Policy Change'] = 3
default['windows_security_policy']['local_security_authority_db']['advanced_auditing']['Policy Change']['Other Policy Change Events'] = 2
default['windows_security_policy']['local_security_authority_db']['advanced_auditing']['Account Management']['Security Group Management'] = 3
default['windows_security_policy']['local_security_authority_db']['advanced_auditing']['Account Management']['Distribution Group Management'] = 3
default['windows_security_policy']['local_security_authority_db']['advanced_auditing']['Account Management']['Other Account Management Events'] = 3
default['windows_security_policy']['local_security_authority_db']['advanced_auditing']['Account Management']['Application Group Management'] = 3
default['windows_security_policy']['local_security_authority_db']['advanced_auditing']['Account Management']['Computer Account Management'] = 3
default['windows_security_policy']['local_security_authority_db']['advanced_auditing']['Account Management']['User Account Management'] = 3
default['windows_security_policy']['local_security_authority_db']['advanced_auditing']['DS Access']['Directory Service Changes'] = 3
default['windows_security_policy']['local_security_authority_db']['advanced_auditing']['DS Access']['Directory Service Replication'] = 0
default['windows_security_policy']['local_security_authority_db']['advanced_auditing']['DS Access']['Directory Service Access'] = 3
default['windows_security_policy']['local_security_authority_db']['advanced_auditing']['DS Access']['Detailed Directory Service Replication'] = 0
default['windows_security_policy']['local_security_authority_db']['advanced_auditing']['Account Logon']['Other Account Logon Events'] = 3
default['windows_security_policy']['local_security_authority_db']['advanced_auditing']['Account Logon']['Kerberos Service Ticket Operations'] = 3
default['windows_security_policy']['local_security_authority_db']['advanced_auditing']['Account Logon']['Credential Validation'] = 3
default['windows_security_policy']['local_security_authority_db']['advanced_auditing']['Account Logon']['Kerberos Authentication Service'] = 3
# These can take only two values:  'Disabled' or 'Enabled' (case-sensitive), all other values will not be used
default['windows_security_policy']['local_security_authority_db']['advanced_auditing_options']['CrashOnAuditFail'] = 'Disabled'
default['windows_security_policy']['local_security_authority_db']['advanced_auditing_options']['FullPrivilegeAuditing'] = 'Disabled'
default['windows_security_policy']['local_security_authority_db']['advanced_auditing_options']['AuditBaseObjects'] = 'Disabled'
default['windows_security_policy']['local_security_authority_db']['advanced_auditing_options']['AuditBaseDirectories'] = 'Disabled'

# Attributes for Advanced Auditing
# To use Advanced Audit Policies, you must ENABLE SCENoApplyLegacyAuditPolicy in the security options below
# 0 = No Auditing
# 1 = Success
# 2 = Failure
# 3 = Success and Failure
default['windows_security_policy']['local_security_authority_db']['advanced_auditing_dsc']['System;IPsec Driver'] = 'No Auditing'
default['windows_security_policy']['local_security_authority_db']['advanced_auditing_dsc']['System;System Integrity'] = 'Success and Failure'
default['windows_security_policy']['local_security_authority_db']['advanced_auditing_dsc']['System;Security System Extension'] = 'Success and Failure'
default['windows_security_policy']['local_security_authority_db']['advanced_auditing_dsc']['System;Security State Change'] = 'Success and Failure'
default['windows_security_policy']['local_security_authority_db']['advanced_auditing_dsc']['System;Other System Events'] = 'Failure'
default['windows_security_policy']['local_security_authority_db']['advanced_auditing_dsc']['Logon/Logoff;Network Policy Server'] = 'Success and Failure'
default['windows_security_policy']['local_security_authority_db']['advanced_auditing_dsc']['Logon/Logoff;Other Logon/Logoff Events'] = 'Success and Failure'
default['windows_security_policy']['local_security_authority_db']['advanced_auditing_dsc']['Logon/Logoff;Special Logon'] = 'Success and Failure'
default['windows_security_policy']['local_security_authority_db']['advanced_auditing_dsc']['Logon/Logoff;IPsec Extended Mode'] = 'No Auditing'
default['windows_security_policy']['local_security_authority_db']['advanced_auditing_dsc']['Logon/Logoff;IPsec Quick Mode'] = 'No Auditing'
default['windows_security_policy']['local_security_authority_db']['advanced_auditing_dsc']['Logon/Logoff;IPsec Main Mode'] = 'No Auditing'
default['windows_security_policy']['local_security_authority_db']['advanced_auditing_dsc']['Logon/Logoff;Account Lockout'] = 'Success and Failure'
default['windows_security_policy']['local_security_authority_db']['advanced_auditing_dsc']['Logon/Logoff;Logoff'] = 'Success and Failure'
default['windows_security_policy']['local_security_authority_db']['advanced_auditing_dsc']['Logon/Logoff;Logon'] = 'Success and Failure'
default['windows_security_policy']['local_security_authority_db']['advanced_auditing_dsc']['Logon/Logoff;User / Device Claims'] = 'No Auditing'
default['windows_security_policy']['local_security_authority_db']['advanced_auditing_dsc']['Object Access;SAM'] = 'No Auditing'
default['windows_security_policy']['local_security_authority_db']['advanced_auditing_dsc']['Object Access;Kernel Object'] = 'Success and Failure'
default['windows_security_policy']['local_security_authority_db']['advanced_auditing_dsc']['Object Access;Registry'] = 'Success and Failure'
default['windows_security_policy']['local_security_authority_db']['advanced_auditing_dsc']['Object Access;Application Generated'] = 'Success and Failure'
default['windows_security_policy']['local_security_authority_db']['advanced_auditing_dsc']['Object Access;Handle Manipulation'] = 'No Auditing'
default['windows_security_policy']['local_security_authority_db']['advanced_auditing_dsc']['Object Access;File Share'] = 'Success and Failure'
default['windows_security_policy']['local_security_authority_db']['advanced_auditing_dsc']['Object Access;Filtering Platform Packet Drop'] = 'No Auditing'
default['windows_security_policy']['local_security_authority_db']['advanced_auditing_dsc']['Object Access;Filtering Platform Connection'] = 'No Auditing'
default['windows_security_policy']['local_security_authority_db']['advanced_auditing_dsc']['Object Access;Other Object Access Events'] = 'No Auditing'
default['windows_security_policy']['local_security_authority_db']['advanced_auditing_dsc']['Object Access;Detailed File Share'] = 'No Auditing'
default['windows_security_policy']['local_security_authority_db']['advanced_auditing_dsc']['Object Access;Removable Storage'] = 'No Auditing'
default['windows_security_policy']['local_security_authority_db']['advanced_auditing_dsc']['Object Access;Central Policy Staging'] = 'No Auditing'
default['windows_security_policy']['local_security_authority_db']['advanced_auditing_dsc']['Object Access;Certification Services'] = 'No Auditing'
default['windows_security_policy']['local_security_authority_db']['advanced_auditing_dsc']['Object Access;File System'] = 'Success and Failure'
default['windows_security_policy']['local_security_authority_db']['advanced_auditing_dsc']['Privilege Use;Other Privilege Use Events'] = 'No Auditing'
default['windows_security_policy']['local_security_authority_db']['advanced_auditing_dsc']['Privilege Use;Non Sensitive Privilege Use'] = 'No Auditing'
default['windows_security_policy']['local_security_authority_db']['advanced_auditing_dsc']['Privilege Use;Sensitive Privilege Use'] = 'No Auditing'
default['windows_security_policy']['local_security_authority_db']['advanced_auditing_dsc']['Detailed Tracking;RPC Events'] = 'Success and Failure'
default['windows_security_policy']['local_security_authority_db']['advanced_auditing_dsc']['Detailed Tracking;DPAPI Activity'] = 'No Auditing'
default['windows_security_policy']['local_security_authority_db']['advanced_auditing_dsc']['Detailed Tracking;Process Termination'] = 'No Auditing'
default['windows_security_policy']['local_security_authority_db']['advanced_auditing_dsc']['Detailed Tracking;Process Creation'] = 'No Auditing'
default['windows_security_policy']['local_security_authority_db']['advanced_auditing_dsc']['Policy Change;Audit Policy Change'] = 'Success and Failure'
default['windows_security_policy']['local_security_authority_db']['advanced_auditing_dsc']['Policy Change;MPSSVC Rule-Level Policy Change'] = 'No Auditing'
default['windows_security_policy']['local_security_authority_db']['advanced_auditing_dsc']['Policy Change;Filtering Platform Policy Change'] = 'No Auditing'
default['windows_security_policy']['local_security_authority_db']['advanced_auditing_dsc']['Policy Change;Authorization Policy Change'] = 'Success and Failure'
default['windows_security_policy']['local_security_authority_db']['advanced_auditing_dsc']['Policy Change;Authentication Policy Change'] = 'Success and Failure'
default['windows_security_policy']['local_security_authority_db']['advanced_auditing_dsc']['Policy Change;Other Policy Change Events'] = 'Failure'
default['windows_security_policy']['local_security_authority_db']['advanced_auditing_dsc']['Account Management;Security Group Management'] = 'Success and Failure'
default['windows_security_policy']['local_security_authority_db']['advanced_auditing_dsc']['Account Management;Distribution Group Management'] = 'Success and Failure'
default['windows_security_policy']['local_security_authority_db']['advanced_auditing_dsc']['Account Management;Other Account Management Events'] = 'Success and Failure'
default['windows_security_policy']['local_security_authority_db']['advanced_auditing_dsc']['Account Management;Application Group Management'] = 'Success and Failure'
default['windows_security_policy']['local_security_authority_db']['advanced_auditing_dsc']['Account Management;Computer Account Management'] = 'Success and Failure'
default['windows_security_policy']['local_security_authority_db']['advanced_auditing_dsc']['Account Management;User Account Management'] = 'Success and Failure'
default['windows_security_policy']['local_security_authority_db']['advanced_auditing_dsc']['DS Access;Directory Service Changes'] = 'Success and Failure'
default['windows_security_policy']['local_security_authority_db']['advanced_auditing_dsc']['DS Access;Directory Service Replication'] = 'No Auditing'
default['windows_security_policy']['local_security_authority_db']['advanced_auditing_dsc']['DS Access;Directory Service Access'] = 'Success and Failure'
default['windows_security_policy']['local_security_authority_db']['advanced_auditing_dsc']['DS Access;Detailed Directory Service Replication'] = 'No Auditing'
default['windows_security_policy']['local_security_authority_db']['advanced_auditing_dsc']['Account Logon;Other Account Logon Events'] = 'Success and Failure'
default['windows_security_policy']['local_security_authority_db']['advanced_auditing_dsc']['Account Logon;Kerberos Service Ticket Operations'] = 'Success and Failure'
default['windows_security_policy']['local_security_authority_db']['advanced_auditing_dsc']['Account Logon;Credential Validation'] = 'Success and Failure'
default['windows_security_policy']['local_security_authority_db']['advanced_auditing_dsc']['Account Logon;Kerberos Authentication Service'] = 'Success and Failure'
# These can take only two values:  'Disabled' or 'Enabled' (case-sensitive), all other values will not be used
default['windows_security_policy']['local_security_authority_db']['advanced_auditing_options_dsc']['CrashOnAuditFail'] = 'Disabled'
default['windows_security_policy']['local_security_authority_db']['advanced_auditing_options_dsc']['FullPrivilegeAuditing'] = 'Disabled'
default['windows_security_policy']['local_security_authority_db']['advanced_auditing_options_dsc']['AuditBaseObjects'] = 'Disabled'
default['windows_security_policy']['local_security_authority_db']['advanced_auditing_options_dsc']['AuditBaseDirectories'] = 'Disabled'

# Location of Library Shell
default['windows_security_policy']['lsa_temp_directory'] = 'C:\Windows\MYCOMPANY\SecurityOptions'
# Attributes for Security Options:  System Access
# https://msdn.microsoft.com/en-us/library/cc232772.aspx
default['windows_security_policy']['local_security_authority_db']['config']['MinimumPasswordAge'] = 1 # Minimum Password Age (Number of Days)
default['windows_security_policy']['local_security_authority_db']['config']['MaximumPasswordAge'] = 90 # Maximum Password Age (Number of Days)
default['windows_security_policy']['local_security_authority_db']['config']['MinimumPasswordLength'] = 14 # Minimum Password Length (Number of Characters)
default['windows_security_policy']['local_security_authority_db']['config']['PasswordComplexity'] = 1 # Password must meet complexity requirements (1 = Complex Password, 0 = Not Complex)
default['windows_security_policy']['local_security_authority_db']['config']['PasswordHistorySize'] = 24 # Enforce Password Policy (Number of passwords to remember)
default['windows_security_policy']['local_security_authority_db']['config']['LockoutBadCount'] = 6 # Account Lockout Threshold (Number of times bad password before it locks)
default['windows_security_policy']['local_security_authority_db']['config']['ResetLockoutCount'] = 1 # Reset Account Lockout Counter After (Number of Minutes)
default['windows_security_policy']['local_security_authority_db']['config']['LockoutDuration'] = 30 # Account Lockout Duration (Number of Minutes)
default['windows_security_policy']['local_security_authority_db']['config']['ClearTextPassword'] = 0 # Store Passwords Using Reversible Encryption (0 = Do NOT store as reversible, 1 = Reversible)

# https://msdn.microsoft.com/en-us/library/cc232773.aspx
# https://msdn.microsoft.com/en-us/library/hh128296.aspx
default['windows_security_policy']['local_security_authority_db']['config']['RequireLogonToChangePassword'] = 0 # Setting is ignored.
default['windows_security_policy']['local_security_authority_db']['config']['ForceLogoffWhenHourExpire'] = 1 # SMB client sessions will be forcibly disconnected when the client's logon hours expire
default['windows_security_policy']['local_security_authority_db']['config']['NewAdministratorName'] = '"Administrator"' # name of the Administrator account on the local computer
default['windows_security_policy']['local_security_authority_db']['config']['NewGuestName'] = '"Disabled_Guest"' # name of the Guest account on the local computer
default['windows_security_policy']['local_security_authority_db']['config']['LSAAnonymousNameLookup'] = 0 # allows an anonymous user to query the local LSA policy
default['windows_security_policy']['local_security_authority_db']['config']['EnableAdminAccount'] = 1 # determines whether the Administrator account on the local computer is enabled
default['windows_security_policy']['local_security_authority_db']['config']['EnableGuestAccount'] = 0 # determines whether the Guest account on the local computer is enabled

# Attributes for Security Options:  Event Audit
# https://msdn.microsoft.com/en-us/library/cc232776.aspx
# 0 = No Auditing
# 1 = Audit Success
# 2 = Audit Failure
# 3 = Audit Success and Failure
default['windows_security_policy']['local_security_authority_db']['config']['AuditSystemEvents'] = 2
default['windows_security_policy']['local_security_authority_db']['config']['AuditLogonEvents'] = 0
default['windows_security_policy']['local_security_authority_db']['config']['AuditObjectAccess'] = 0
default['windows_security_policy']['local_security_authority_db']['config']['AuditPrivilegeUse'] = 0
default['windows_security_policy']['local_security_authority_db']['config']['AuditPolicyChange'] = 2
default['windows_security_policy']['local_security_authority_db']['config']['AuditAccountManage'] = 3
default['windows_security_policy']['local_security_authority_db']['config']['AuditProcessTracking'] = 0
default['windows_security_policy']['local_security_authority_db']['config']['AuditDSAccess'] = 3
default['windows_security_policy']['local_security_authority_db']['config']['AuditAccountLogon'] = 0

# Attributes for Security Options:  Custom Parameters
# WARNING:  These values are HIGHLY sensitive.  If you have the wrong format, you could corrupt the Windows Security Database.  Ensure that these values are TESTED prior to implemented.
# All values that begin with 7 must have quotes around them with appropriate escape characters.
default['windows_security_policy']['local_security_authority_db']['Registry']['MACHINE\Software\Microsoft\Windows NT\CurrentVersion\Setup\RecoveryConsole\SecurityLevel'] = '4,0'
default['windows_security_policy']['local_security_authority_db']['Registry']['MACHINE\Software\Microsoft\Windows NT\CurrentVersion\Setup\RecoveryConsole\SetCommand'] = '4,1'
default['windows_security_policy']['local_security_authority_db']['Registry']['MACHINE\Software\Microsoft\Windows NT\CurrentVersion\Winlogon\AllocateCDRoms'] = '1,1' # must be wrapped by quotes because it is a reg_sz (string)
default['windows_security_policy']['local_security_authority_db']['Registry']['MACHINE\Software\Microsoft\Windows NT\CurrentVersion\Winlogon\AllocateDASD'] = '1,0' # must be wrapped by quotes because it is a reg_sz (string)
default['windows_security_policy']['local_security_authority_db']['Registry']['MACHINE\Software\Microsoft\Windows NT\CurrentVersion\Winlogon\AllocateFloppies'] = '1,1' # must be wrapped by quotes because it is a reg_sz (string)
default['windows_security_policy']['local_security_authority_db']['Registry']['MACHINE\Software\Microsoft\Windows NT\CurrentVersion\Winlogon\CachedLogonsCount'] = '1,4' # must be wrapped by quotes because it is a reg_sz (string)
default['windows_security_policy']['local_security_authority_db']['Registry']['MACHINE\Software\Microsoft\Windows NT\CurrentVersion\Winlogon\ForceUnlockLogon'] = '4,0'
default['windows_security_policy']['local_security_authority_db']['Registry']['MACHINE\Software\Microsoft\Windows NT\CurrentVersion\Winlogon\PasswordExpiryWarning'] = '4,14'
default['windows_security_policy']['local_security_authority_db']['Registry']['MACHINE\Software\Microsoft\Windows NT\CurrentVersion\Winlogon\ScRemoveOption'] = '1,1' # must be wrapped by quotes because it is a reg_sz (string)
default['windows_security_policy']['local_security_authority_db']['Registry']['MACHINE\Software\Microsoft\Windows\CurrentVersion\Policies\System\ConsentPromptBehaviorAdmin'] = '4,0'
default['windows_security_policy']['local_security_authority_db']['Registry']['MACHINE\Software\Microsoft\Windows\CurrentVersion\Policies\System\ConsentPromptBehaviorUser'] = '4,1'
default['windows_security_policy']['local_security_authority_db']['Registry']['MACHINE\Software\Microsoft\Windows\CurrentVersion\Policies\System\DisableCAD'] = '4,0'
default['windows_security_policy']['local_security_authority_db']['Registry']['MACHINE\Software\Microsoft\Windows\CurrentVersion\Policies\System\DontDisplayLastUserName'] = '4,1'
default['windows_security_policy']['local_security_authority_db']['Registry']['MACHINE\Software\Microsoft\Windows\CurrentVersion\Policies\System\EnableInstallerDetection'] = '4,1'
default['windows_security_policy']['local_security_authority_db']['Registry']['MACHINE\Software\Microsoft\Windows\CurrentVersion\Policies\System\EnableLUA'] = '4,1'
default['windows_security_policy']['local_security_authority_db']['Registry']['MACHINE\Software\Microsoft\Windows\CurrentVersion\Policies\System\EnableSecureUIAPaths'] = '4,1'
default['windows_security_policy']['local_security_authority_db']['Registry']['MACHINE\Software\Microsoft\Windows\CurrentVersion\Policies\System\EnableUIADesktopToggle'] = '4,0'
default['windows_security_policy']['local_security_authority_db']['Registry']['MACHINE\Software\Microsoft\Windows\CurrentVersion\Policies\System\EnableVirtualization'] = '4,1'
default['windows_security_policy']['local_security_authority_db']['Registry']['MACHINE\Software\Microsoft\Windows\CurrentVersion\Policies\System\FilterAdministratorToken'] = '4,1'
default['windows_security_policy']['local_security_authority_db']['Registry']['MACHINE\Software\Microsoft\Windows\CurrentVersion\Policies\System\InactivityTimeoutSecs'] = '4,900'
default['windows_security_policy']['local_security_authority_db']['Registry']['MACHINE\Software\Microsoft\Windows\CurrentVersion\Policies\System\LegalNoticeCaption'] = "1,\"MYCOMPANY\"" # must be wrapped by quotes because it is a reg_sz (string)
default['windows_security_policy']['local_security_authority_db']['Registry']['MACHINE\Software\Microsoft\Windows\CurrentVersion\Policies\System\LegalNoticeText'] = "7,\"This computer system is the property of MYCOMPANY and is to be used for business purposes. All information, messages, software and hardware created, stored, accessed, received, or used by you through this system is considered to be the sole property of MYCOMPANY and can and may be monitored, reviewed, and retained at any time. You should have no expectation that any such information, messages or material will be private. By accessing and using this computer, you acknowledge and consent to such monitoring and information retrieval. By accessing and using this computer, you also agree to comply with all of MYCOMPANY policies and standards.\"" # must be wrapped by quotes because it is a reg_sz (string)
default['windows_security_policy']['local_security_authority_db']['Registry']['MACHINE\Software\Microsoft\Windows\CurrentVersion\Policies\System\MaxDevicePasswordFailedAttempts'] = '4,10'
default['windows_security_policy']['local_security_authority_db']['Registry']['MACHINE\Software\Microsoft\Windows\CurrentVersion\Policies\System\NoConnectedUser'] = '4,3'
default['windows_security_policy']['local_security_authority_db']['Registry']['MACHINE\Software\Microsoft\Windows\CurrentVersion\Policies\System\PromptOnSecureDesktop'] = '4,1'
default['windows_security_policy']['local_security_authority_db']['Registry']['MACHINE\Software\Microsoft\Windows\CurrentVersion\Policies\System\ScForceOption'] = '4,0'
default['windows_security_policy']['local_security_authority_db']['Registry']['MACHINE\Software\Microsoft\Windows\CurrentVersion\Policies\System\ShutdownWithoutLogon'] = '4,0'
default['windows_security_policy']['local_security_authority_db']['Registry']['MACHINE\Software\Microsoft\Windows\CurrentVersion\Policies\System\UndockWithoutLogon'] = '4,1'
default['windows_security_policy']['local_security_authority_db']['Registry']['MACHINE\Software\Microsoft\Windows\CurrentVersion\Policies\System\ValidateAdminCodeSignatures'] = '4,0'
default['windows_security_policy']['local_security_authority_db']['Registry']['MACHINE\Software\Policies\Microsoft\Cryptography\ForceKeyProtection'] = '4,2'
default['windows_security_policy']['local_security_authority_db']['Registry']['MACHINE\Software\Policies\Microsoft\Windows\Safer\CodeIdentifiers\AuthenticodeEnabled'] = '4,1'
default['windows_security_policy']['local_security_authority_db']['Registry']['MACHINE\System\CurrentControlSet\Control\Lsa\AuditBaseObjects'] = '4,0'
default['windows_security_policy']['local_security_authority_db']['Registry']['MACHINE\System\CurrentControlSet\Control\Lsa\CrashOnAuditFail'] = '4,0'
default['windows_security_policy']['local_security_authority_db']['Registry']['MACHINE\System\CurrentControlSet\Control\Lsa\DisableDomainCreds'] = '4,0'
default['windows_security_policy']['local_security_authority_db']['Registry']['MACHINE\System\CurrentControlSet\Control\Lsa\EveryoneIncludesAnonymous'] = '4,0'
default['windows_security_policy']['local_security_authority_db']['Registry']['MACHINE\System\CurrentControlSet\Control\Lsa\FIPSAlgorithmPolicy\Enabled'] = '4,0'
default['windows_security_policy']['local_security_authority_db']['Registry']['MACHINE\System\CurrentControlSet\Control\Lsa\ForceGuest'] = '4,0'
default['windows_security_policy']['local_security_authority_db']['Registry']['MACHINE\System\CurrentControlSet\Control\Lsa\FullPrivilegeAuditing'] = '3,0'
default['windows_security_policy']['local_security_authority_db']['Registry']['MACHINE\System\CurrentControlSet\Control\Lsa\LimitBlankPasswordUse'] = '4,1'
default['windows_security_policy']['local_security_authority_db']['Registry']['MACHINE\System\CurrentControlSet\Control\Lsa\LmCompatibilityLevel'] = '4,5'
default['windows_security_policy']['local_security_authority_db']['Registry']['MACHINE\System\CurrentControlSet\Control\Lsa\MSV1_0\NTLMMinClientSec'] = '4,537395200'
default['windows_security_policy']['local_security_authority_db']['Registry']['MACHINE\System\CurrentControlSet\Control\Lsa\MSV1_0\NTLMMinServerSec'] = '4,537395200'
default['windows_security_policy']['local_security_authority_db']['Registry']['MACHINE\System\CurrentControlSet\Control\Lsa\NoLMHash'] = '4,1'
default['windows_security_policy']['local_security_authority_db']['Registry']['MACHINE\System\CurrentControlSet\Control\Lsa\RestrictAnonymous'] = '4,1'
default['windows_security_policy']['local_security_authority_db']['Registry']['MACHINE\System\CurrentControlSet\Control\Lsa\RestrictAnonymousSAM'] = '4,1'
# This setting will render the Base/Basic Audit Policy Settings disabled.  The GUI/MMC will not implement the Audit policy settings defined above.
# 1 = Enable Advanced Audit Policies, 0 = Disable (only apply basic audit policies)
# https://support.microsoft.com/en-us/kb/2573113
default['windows_security_policy']['local_security_authority_db']['Registry']['MACHINE\System\CurrentControlSet\Control\Lsa\SCENoApplyLegacyAuditPolicy'] = '4,1'
default['windows_security_policy']['local_security_authority_db']['Registry']['MACHINE\System\CurrentControlSet\Control\Print\Providers\LanMan Print Services\Servers\AddPrinterDrivers'] = '4,1'
default['windows_security_policy']['local_security_authority_db']['Registry']['MACHINE\System\CurrentControlSet\Control\SecurePipeServers\Winreg\AllowedExactPaths\Machine'] = "7,\"System\\CurrentControlSet\\Control\\ProductOptions,System\\CurrentControlSet\\Control\\Server Applications,Software\\Microsoft\\Windows NT\\CurrentVersion\""
default['windows_security_policy']['local_security_authority_db']['Registry']['MACHINE\System\CurrentControlSet\Control\SecurePipeServers\Winreg\AllowedPaths\Machine'] = "7,\"Software\\Microsoft\\Windows NT\\CurrentVersion\\Print,Software\\Microsoft\\Windows NT\\CurrentVersion\\Windows,System\\CurrentControlSet\\Control\\Print\\Printers,System\\CurrentControlSet\\Services\\Eventlog,Software\\Microsoft\\OLAP Server,System\\CurrentControlSet\\Control\\ContentIndex,System\\CurrentControlSet\\Control\\Terminal Server,System\\CurrentControlSet\\Control\\Terminal Server\\UserConfig,System\\CurrentControlSet\\Control\\Terminal Server\\DefaultUserConfiguration,Software\\Microsoft\\Windows NT\\CurrentVersion\\Perflib,System\\CurrentControlSet\\Services\\SysmonLog\""
default['windows_security_policy']['local_security_authority_db']['Registry']['MACHINE\System\CurrentControlSet\Control\Session Manager\Kernel\ObCaseInsensitive'] = '4,1'
default['windows_security_policy']['local_security_authority_db']['Registry']['MACHINE\System\CurrentControlSet\Control\Session Manager\Memory Management\ClearPageFileAtShutdown'] = '4,0'
default['windows_security_policy']['local_security_authority_db']['Registry']['MACHINE\System\CurrentControlSet\Control\Session Manager\ProtectionMode'] = '4,1'
default['windows_security_policy']['local_security_authority_db']['Registry']['MACHINE\System\CurrentControlSet\Control\Session Manager\SubSystems\optional'] = "7,\"Posix\""
default['windows_security_policy']['local_security_authority_db']['Registry']['MACHINE\System\CurrentControlSet\Services\LanManServer\Parameters\AutoDisconnect'] = '4,15'
default['windows_security_policy']['local_security_authority_db']['Registry']['MACHINE\System\CurrentControlSet\Services\LanManServer\Parameters\EnableForcedLogOff'] = '4,1'
default['windows_security_policy']['local_security_authority_db']['Registry']['MACHINE\System\CurrentControlSet\Services\LanManServer\Parameters\EnableSecuritySignature'] = '4,1'
default['windows_security_policy']['local_security_authority_db']['Registry']['MACHINE\System\CurrentControlSet\Services\LanManServer\Parameters\NullSessionPipes'] = "7,\"\""
default['windows_security_policy']['local_security_authority_db']['Registry']['MACHINE\System\CurrentControlSet\Services\LanManServer\Parameters\NullSessionShares'] = "7,\"\""
default['windows_security_policy']['local_security_authority_db']['Registry']['MACHINE\System\CurrentControlSet\Services\LanManServer\Parameters\RequireSecuritySignature'] = '4,1'
default['windows_security_policy']['local_security_authority_db']['Registry']['MACHINE\System\CurrentControlSet\Services\LanManServer\Parameters\RestrictNullSessAccess'] = '4,1'
default['windows_security_policy']['local_security_authority_db']['Registry']['MACHINE\System\CurrentControlSet\Services\LanmanWorkstation\Parameters\EnablePlainTextPassword'] = '4,0'
default['windows_security_policy']['local_security_authority_db']['Registry']['MACHINE\System\CurrentControlSet\Services\LanmanWorkstation\Parameters\EnableSecuritySignature'] = '4,1'
default['windows_security_policy']['local_security_authority_db']['Registry']['MACHINE\System\CurrentControlSet\Services\LanmanWorkstation\Parameters\RequireSecuritySignature'] = '4,1'
default['windows_security_policy']['local_security_authority_db']['Registry']['MACHINE\System\CurrentControlSet\Services\LDAP\LDAPClientIntegrity'] = '4,1'
default['windows_security_policy']['local_security_authority_db']['Registry']['MACHINE\System\CurrentControlSet\Services\Netlogon\Parameters\DisablePasswordChange'] = '4,0'
default['windows_security_policy']['local_security_authority_db']['Registry']['MACHINE\System\CurrentControlSet\Services\Netlogon\Parameters\MaximumPasswordAge'] = '4,30'
default['windows_security_policy']['local_security_authority_db']['Registry']['MACHINE\System\CurrentControlSet\Services\Netlogon\Parameters\RequireSignOrSeal'] = '4,1'
default['windows_security_policy']['local_security_authority_db']['Registry']['MACHINE\System\CurrentControlSet\Services\Netlogon\Parameters\RequireStrongKey'] = '4,1'
default['windows_security_policy']['local_security_authority_db']['Registry']['MACHINE\System\CurrentControlSet\Services\Netlogon\Parameters\SealSecureChannel'] = '4,1'
default['windows_security_policy']['local_security_authority_db']['Registry']['MACHINE\System\CurrentControlSet\Services\Netlogon\Parameters\SignSecureChannel'] = '4,1'

# Attributes for Security Options:  System Access
# https://msdn.microsoft.com/en-us/library/cc232772.aspx
default['windows_security_policy']['local_security_authority_db']['config_dsc']['MinimumPasswordAge'] = '1' # Minimum Password Age (Number of Days)
default['windows_security_policy']['local_security_authority_db']['config_dsc']['MaximumPasswordAge'] = '90' # Maximum Password Age (Number of Days)
default['windows_security_policy']['local_security_authority_db']['config_dsc']['MinimumPasswordLength'] = '14' # Minimum Password Length (Number of Characters)
default['windows_security_policy']['local_security_authority_db']['config_dsc']['PasswordComplexity'] = '1' # Password must meet complexity requirements (1 = Complex Password, 0 = Not Complex)
default['windows_security_policy']['local_security_authority_db']['config_dsc']['PasswordHistorySize'] = '24' # Enforce Password Policy (Number of passwords to remember)
default['windows_security_policy']['local_security_authority_db']['config_dsc']['LockoutBadCount'] = '6' # Account Lockout Threshold (Number of times bad password before it locks)
default['windows_security_policy']['local_security_authority_db']['config_dsc']['ResetLockoutCount'] = '1' # Reset Account Lockout Counter After (Number of Minutes)
default['windows_security_policy']['local_security_authority_db']['config_dsc']['LockoutDuration'] = '30' # Account Lockout Duration (Number of Minutes)
default['windows_security_policy']['local_security_authority_db']['config_dsc']['ClearTextPassword'] = '0' # Store Passwords Using Reversible Encryption (0 = Do NOT store as reversible, 1 = Reversible)

# https://msdn.microsoft.com/en-us/library/cc232773.aspx
# https://msdn.microsoft.com/en-us/library/hh128296.aspx
default['windows_security_policy']['local_security_authority_db']['config_dsc']['RequireLogonToChangePassword'] = '0' # Setting is ignored.
default['windows_security_policy']['local_security_authority_db']['config_dsc']['ForceLogoffWhenHourExpire'] = '1' # SMB client sessions will be forcibly disconnected when the client's logon hours expire
default['windows_security_policy']['local_security_authority_db']['config_dsc']['NewAdministratorName'] = '"Administrator"' # name of the Administrator account on the local computer
default['windows_security_policy']['local_security_authority_db']['config_dsc']['NewGuestName'] = '"Disabled_Guest"' # name of the Guest account on the local computer
default['windows_security_policy']['local_security_authority_db']['config_dsc']['LSAAnonymousNameLookup'] = '0' # allows an anonymous user to query the local LSA policy
default['windows_security_policy']['local_security_authority_db']['config_dsc']['EnableAdminAccount'] = '1' # determines whether the Administrator account on the local computer is enabled
default['windows_security_policy']['local_security_authority_db']['config_dsc']['EnableGuestAccount'] = '0' # determines whether the Guest account on the local computer is enabled

# Attributes for Security Options:  Event Audit
# https://msdn.microsoft.com/en-us/library/cc232776.aspx
# 0 = No Auditing
# 1 = Audit Success
# 2 = Audit Failure
# 3 = Audit Success and Failure
default['windows_security_policy']['local_security_authority_db']['config_dsc']['AuditSystemEvents'] = '2'
default['windows_security_policy']['local_security_authority_db']['config_dsc']['AuditLogonEvents'] = '0'
default['windows_security_policy']['local_security_authority_db']['config_dsc']['AuditObjectAccess'] = '0'
default['windows_security_policy']['local_security_authority_db']['config_dsc']['AuditPrivilegeUse'] = '0'
default['windows_security_policy']['local_security_authority_db']['config_dsc']['AuditPolicyChange'] = '2'
default['windows_security_policy']['local_security_authority_db']['config_dsc']['AuditAccountManage'] = '3'
default['windows_security_policy']['local_security_authority_db']['config_dsc']['AuditProcessTracking'] = '0'
default['windows_security_policy']['local_security_authority_db']['config_dsc']['AuditDSAccess'] = '3'
default['windows_security_policy']['local_security_authority_db']['config_dsc']['AuditAccountLogon'] = '0'


# Attributes for Security Options:  Custom Parameters
# WARNING:  These values are HIGHLY sensitive.  If you have the wrong format, you could corrupt the Windows Security Database.  Ensure that these values are TESTED prior to implemented.
# All values that begin with 7 must have quotes around them with appropriate escape characters.
default['windows_security_policy']['local_security_authority_db']['registry_dsc']['\"MACHINE\Software\Microsoft\Windows NT\CurrentVersion\Setup\RecoveryConsole\SecurityLevel\"'] = '4,0'
default['windows_security_policy']['local_security_authority_db']['registry_dsc']['\"MACHINE\Software\Microsoft\Windows NT\CurrentVersion\Setup\RecoveryConsole\SetCommand\"'] = '4,1'
default['windows_security_policy']['local_security_authority_db']['registry_dsc']['\"MACHINE\Software\Microsoft\Windows NT\CurrentVersion\Winlogon\AllocateCDRoms\"'] = '1,1' # must be wrapped by quotes because it is a reg_sz (string)
default['windows_security_policy']['local_security_authority_db']['registry_dsc']['\"MACHINE\Software\Microsoft\Windows NT\CurrentVersion\Winlogon\AllocateDASD\"'] = '1,0' # must be wrapped by quotes because it is a reg_sz (string)
default['windows_security_policy']['local_security_authority_db']['registry_dsc']['\"MACHINE\Software\Microsoft\Windows NT\CurrentVersion\Winlogon\AllocateFloppies\"'] = '1,1' # must be wrapped by quotes because it is a reg_sz (string)
default['windows_security_policy']['local_security_authority_db']['registry_dsc']['\"MACHINE\Software\Microsoft\Windows NT\CurrentVersion\Winlogon\CachedLogonsCount\"'] = '1,4' # must be wrapped by quotes because it is a reg_sz (string)
default['windows_security_policy']['local_security_authority_db']['registry_dsc']['\"MACHINE\Software\Microsoft\Windows NT\CurrentVersion\Winlogon\ForceUnlockLogon\"'] = '4,0'
default['windows_security_policy']['local_security_authority_db']['registry_dsc']['\"MACHINE\Software\Microsoft\Windows NT\CurrentVersion\Winlogon\PasswordExpiryWarning\"'] = '4,14'
default['windows_security_policy']['local_security_authority_db']['registry_dsc']['\"MACHINE\Software\Microsoft\Windows NT\CurrentVersion\Winlogon\ScRemoveOption\"'] = '1,1' # must be wrapped by quotes because it is a reg_sz (string)
default['windows_security_policy']['local_security_authority_db']['registry_dsc']['\"MACHINE\Software\Microsoft\Windows\CurrentVersion\Policies\System\ConsentPromptBehaviorAdmin\"'] = '4,0'
default['windows_security_policy']['local_security_authority_db']['registry_dsc']['\"MACHINE\Software\Microsoft\Windows\CurrentVersion\Policies\System\ConsentPromptBehaviorUser\"'] = '4,1'
default['windows_security_policy']['local_security_authority_db']['registry_dsc']['\"MACHINE\Software\Microsoft\Windows\CurrentVersion\Policies\System\DisableCAD\"'] = '4,0'
default['windows_security_policy']['local_security_authority_db']['registry_dsc']['\"MACHINE\Software\Microsoft\Windows\CurrentVersion\Policies\System\DontDisplayLastUserName\"'] = '4,1'
default['windows_security_policy']['local_security_authority_db']['registry_dsc']['\"MACHINE\Software\Microsoft\Windows\CurrentVersion\Policies\System\EnableInstallerDetection\"'] = '4,1'
default['windows_security_policy']['local_security_authority_db']['registry_dsc']['\"MACHINE\Software\Microsoft\Windows\CurrentVersion\Policies\System\EnableLUA\"'] = '4,1'
default['windows_security_policy']['local_security_authority_db']['registry_dsc']['\"MACHINE\Software\Microsoft\Windows\CurrentVersion\Policies\System\EnableSecureUIAPaths\"'] = '4,1'
default['windows_security_policy']['local_security_authority_db']['registry_dsc']['\"MACHINE\Software\Microsoft\Windows\CurrentVersion\Policies\System\EnableUIADesktopToggle\"'] = '4,0'
default['windows_security_policy']['local_security_authority_db']['registry_dsc']['\"MACHINE\Software\Microsoft\Windows\CurrentVersion\Policies\System\EnableVirtualization\"'] = '4,1'
default['windows_security_policy']['local_security_authority_db']['registry_dsc']['\"MACHINE\Software\Microsoft\Windows\CurrentVersion\Policies\System\FilterAdministratorToken\"'] = '4,1'
default['windows_security_policy']['local_security_authority_db']['registry_dsc']['\"MACHINE\Software\Microsoft\Windows\CurrentVersion\Policies\System\InactivityTimeoutSecs\"'] = '4,900'
default['windows_security_policy']['local_security_authority_db']['registry_dsc']['\"MACHINE\Software\Microsoft\Windows\CurrentVersion\Policies\System\LegalNoticeCaption\"'] = '1,MYCOMPANY' # must be wrapped by quotes because it is a reg_sz (string)
default['windows_security_policy']['local_security_authority_db']['registry_dsc']['\"MACHINE\Software\Microsoft\Windows\CurrentVersion\Policies\System\LegalNoticeText\"'] = '7,This computer system is the property of MYCOMPANY and is to be used for business purposes. All information, messages, software and hardware created, stored, accessed, received, or used by you through this system is considered to be the sole property of MYCOMPANY and can and may be monitored, reviewed, and retained at any time. You should have no expectation that any such information, messages or material will be private. By accessing and using this computer, you acknowledge and consent to such monitoring and information retrieval. By accessing and using this computer, you also agree to comply with all of MYCOMPANY policies and standards.' # must be wrapped by quotes because it is a reg_sz (string)
default['windows_security_policy']['local_security_authority_db']['registry_dsc']['\"MACHINE\Software\Microsoft\Windows\CurrentVersion\Policies\System\MaxDevicePasswordFailedAttempts\"'] = '4,10'
default['windows_security_policy']['local_security_authority_db']['registry_dsc']['\"MACHINE\Software\Microsoft\Windows\CurrentVersion\Policies\System\NoConnectedUser\"'] = '4,3'
default['windows_security_policy']['local_security_authority_db']['registry_dsc']['\"MACHINE\Software\Microsoft\Windows\CurrentVersion\Policies\System\PromptOnSecureDesktop\"'] = '4,1'
default['windows_security_policy']['local_security_authority_db']['registry_dsc']['\"MACHINE\Software\Microsoft\Windows\CurrentVersion\Policies\System\ScForceOption\"'] = '4,0'
default['windows_security_policy']['local_security_authority_db']['registry_dsc']['\"MACHINE\Software\Microsoft\Windows\CurrentVersion\Policies\System\ShutdownWithoutLogon\"'] = '4,0'
default['windows_security_policy']['local_security_authority_db']['registry_dsc']['\"MACHINE\Software\Microsoft\Windows\CurrentVersion\Policies\System\UndockWithoutLogon\"'] = '4,1'
default['windows_security_policy']['local_security_authority_db']['registry_dsc']['\"MACHINE\Software\Microsoft\Windows\CurrentVersion\Policies\System\ValidateAdminCodeSignatures\"'] = '4,0'
default['windows_security_policy']['local_security_authority_db']['registry_dsc']['\"MACHINE\Software\Policies\Microsoft\Cryptography\ForceKeyProtection\"'] = '4,2'
default['windows_security_policy']['local_security_authority_db']['registry_dsc']['\"MACHINE\Software\Policies\Microsoft\Windows\Safer\CodeIdentifiers\AuthenticodeEnabled\"'] = '4,1'
default['windows_security_policy']['local_security_authority_db']['registry_dsc']['\"MACHINE\System\CurrentControlSet\Control\Lsa\AuditBaseObjects\"'] = '4,0'
default['windows_security_policy']['local_security_authority_db']['registry_dsc']['\"MACHINE\System\CurrentControlSet\Control\Lsa\CrashOnAuditFail\"'] = '4,0'
default['windows_security_policy']['local_security_authority_db']['registry_dsc']['\"MACHINE\System\CurrentControlSet\Control\Lsa\DisableDomainCreds\"'] = '4,0'
default['windows_security_policy']['local_security_authority_db']['registry_dsc']['\"MACHINE\System\CurrentControlSet\Control\Lsa\EveryoneIncludesAnonymous\"'] = '4,0'
default['windows_security_policy']['local_security_authority_db']['registry_dsc']['\"MACHINE\System\CurrentControlSet\Control\Lsa\FIPSAlgorithmPolicy\Enabled\"'] = '4,0'
default['windows_security_policy']['local_security_authority_db']['registry_dsc']['\"MACHINE\System\CurrentControlSet\Control\Lsa\ForceGuest\"'] = '4,0'
default['windows_security_policy']['local_security_authority_db']['registry_dsc']['\"MACHINE\System\CurrentControlSet\Control\Lsa\FullPrivilegeAuditing\"'] = '3,0'
default['windows_security_policy']['local_security_authority_db']['registry_dsc']['\"MACHINE\System\CurrentControlSet\Control\Lsa\LimitBlankPasswordUse\"'] = '4,1'
default['windows_security_policy']['local_security_authority_db']['registry_dsc']['\"MACHINE\System\CurrentControlSet\Control\Lsa\LmCompatibilityLevel\"'] = '4,5'
default['windows_security_policy']['local_security_authority_db']['registry_dsc']['\"MACHINE\System\CurrentControlSet\Control\Lsa\MSV1_0\NTLMMinClientSec\"'] = '4,537395200'
default['windows_security_policy']['local_security_authority_db']['registry_dsc']['\"MACHINE\System\CurrentControlSet\Control\Lsa\MSV1_0\NTLMMinServerSec\"'] = '4,537395200'
default['windows_security_policy']['local_security_authority_db']['registry_dsc']['\"MACHINE\System\CurrentControlSet\Control\Lsa\NoLMHash\"'] = '4,1'
default['windows_security_policy']['local_security_authority_db']['registry_dsc']['\"MACHINE\System\CurrentControlSet\Control\Lsa\RestrictAnonymous\"'] = '4,1'
default['windows_security_policy']['local_security_authority_db']['registry_dsc']['\"MACHINE\System\CurrentControlSet\Control\Lsa\RestrictAnonymousSAM\"'] = '4,1'
# # This setting will render the Base/Basic Audit Policy Settings disabled.  The GUI/MMC will not implement the Audit policy settings defined above.
# # 1 = Enable Advanced Audit Policies, 0 = Disable (only apply basic audit policies)
# # https://support.microsoft.com/en-us/kb/2573113
default['windows_security_policy']['local_security_authority_db']['registry_dsc']['\"MACHINE\System\CurrentControlSet\Control\Lsa\SCENoApplyLegacyAuditPolicy\"'] = '4,1'
default['windows_security_policy']['local_security_authority_db']['registry_dsc']['\"MACHINE\System\CurrentControlSet\Control\Print\Providers\LanMan Print Services\Servers\AddPrinterDrivers\"'] = '4,1'
default['windows_security_policy']['local_security_authority_db']['registry_dsc']['\"MACHINE\System\CurrentControlSet\Control\SecurePipeServers\Winreg\AllowedExactPaths\Machine\"'] = '7,System\CurrentControlSet\Control\ProductOptions,System\CurrentControlSet\Control\Server Applications,Software\Microsoft\Windows NT\CurrentVersion'
default['windows_security_policy']['local_security_authority_db']['registry_dsc']['\"MACHINE\System\CurrentControlSet\Control\SecurePipeServers\Winreg\AllowedPaths\Machine\"'] = '7,Software\Microsoft\Windows NT\CurrentVersion\Print,Software\Microsoft\Windows NT\CurrentVersion\Windows,System\CurrentControlSet\Control\Print\Printers,System\CurrentControlSet\Services\Eventlog,Software\Microsoft\OLAP Server,System\CurrentControlSet\Control\ContentIndex,System\CurrentControlSet\Control\Terminal Server,System\CurrentControlSet\Control\Terminal Server\UserConfig,System\CurrentControlSet\Control\Terminal Server\DefaultUserConfiguration,Software\Microsoft\Windows NT\CurrentVersion\Perflib,System\CurrentControlSet\Services\SysmonLog'
default['windows_security_policy']['local_security_authority_db']['registry_dsc']['\"MACHINE\System\CurrentControlSet\Control\Session Manager\Kernel\ObCaseInsensitive\"'] = '4,1'
default['windows_security_policy']['local_security_authority_db']['registry_dsc']['\"MACHINE\System\CurrentControlSet\Control\Session Manager\Memory Management\ClearPageFileAtShutdown\"'] = '4,0'
default['windows_security_policy']['local_security_authority_db']['registry_dsc']['\"MACHINE\System\CurrentControlSet\Control\Session Manager\ProtectionMode\"'] = '4,1'
default['windows_security_policy']['local_security_authority_db']['registry_dsc']['\"MACHINE\System\CurrentControlSet\Control\Session Manager\SubSystems\optional\"'] = "7,\"Posix\""
default['windows_security_policy']['local_security_authority_db']['registry_dsc']['\"MACHINE\System\CurrentControlSet\Services\LanManServer\Parameters\AutoDisconnect\"'] = '4,15'
default['windows_security_policy']['local_security_authority_db']['registry_dsc']['\"MACHINE\System\CurrentControlSet\Services\LanManServer\Parameters\EnableForcedLogOff\"'] = '4,1'
default['windows_security_policy']['local_security_authority_db']['registry_dsc']['\"MACHINE\System\CurrentControlSet\Services\LanManServer\Parameters\EnableSecuritySignature\"'] = '4,1'
default['windows_security_policy']['local_security_authority_db']['registry_dsc']['\"MACHINE\System\CurrentControlSet\Services\LanManServer\Parameters\NullSessionPipes\"'] = "7,\"\""
default['windows_security_policy']['local_security_authority_db']['registry_dsc']['\"MACHINE\System\CurrentControlSet\Services\LanManServer\Parameters\NullSessionShares\"'] = "7,\"\""
default['windows_security_policy']['local_security_authority_db']['registry_dsc']['\"MACHINE\System\CurrentControlSet\Services\LanManServer\Parameters\RequireSecuritySignature\"'] = '4,1'
default['windows_security_policy']['local_security_authority_db']['registry_dsc']['\"MACHINE\System\CurrentControlSet\Services\LanManServer\Parameters\RestrictNullSessAccess\"'] = '4,1'
default['windows_security_policy']['local_security_authority_db']['registry_dsc']['\"MACHINE\System\CurrentControlSet\Services\LanmanWorkstation\Parameters\EnablePlainTextPassword\"'] = '4,0'
default['windows_security_policy']['local_security_authority_db']['registry_dsc']['\"MACHINE\System\CurrentControlSet\Services\LanmanWorkstation\Parameters\EnableSecuritySignature\"'] = '4,1'
default['windows_security_policy']['local_security_authority_db']['registry_dsc']['\"MACHINE\System\CurrentControlSet\Services\LanmanWorkstation\Parameters\RequireSecuritySignature\"'] = '4,1'
default['windows_security_policy']['local_security_authority_db']['registry_dsc']['\"MACHINE\System\CurrentControlSet\Services\LDAP\LDAPClientIntegrity\"'] = '4,1'
default['windows_security_policy']['local_security_authority_db']['registry_dsc']['\"MACHINE\System\CurrentControlSet\Services\Netlogon\Parameters\DisablePasswordChange\"'] = '4,0'
default['windows_security_policy']['local_security_authority_db']['registry_dsc']['\"MACHINE\System\CurrentControlSet\Services\Netlogon\Parameters\MaximumPasswordAge\"'] = '4,30'
default['windows_security_policy']['local_security_authority_db']['registry_dsc']['\"MACHINE\System\CurrentControlSet\Services\Netlogon\Parameters\RequireSignOrSeal\"'] = '4,1'
default['windows_security_policy']['local_security_authority_db']['registry_dsc']['\"MACHINE\System\CurrentControlSet\Services\Netlogon\Parameters\RequireStrongKey\"'] = '4,1'
default['windows_security_policy']['local_security_authority_db']['registry_dsc']['\"MACHINE\System\CurrentControlSet\Services\Netlogon\Parameters\SealSecureChannel\"'] = '4,1'
default['windows_security_policy']['local_security_authority_db']['registry_dsc']['\"MACHINE\System\CurrentControlSet\Services\Netlogon\Parameters\SignSecureChannel\"'] = '4,1'
