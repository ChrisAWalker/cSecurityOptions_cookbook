# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = '2'
Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  # Run Windows Domain Provisioner
  config.vm.provision :windows_domain do |domain|
    # The Windows Domain to join.
    # Setting this will result in an additional restart.
    domain.domain = 'labs.mycompany.com'

    # The new Computer Name to use when joining the domain.
    # Uses the Rename-Computer PowerShell command. ORRRR -NewName flag??
    # Specifies a new name for the computer in the new domain.
    # domain.computer_name = 'z031272-vagrant-devbox'

    # The Username to use when authenticating against the Domain.
    # Specifies a user account that has permission to join the computers to a new domain.
    domain.username = '<domain>\<user>'

    # The Password to use when authenticating against the Domain.
    # Specifies the password of a user account that has permission to
    # join the computers to a new domain.
    domain.password = ''

    # An array of advanced options to pass when joining the Domain.
    # See (https://technet.microsoft.com/en-us/library/hh849798.aspx) for detail.
    # NOTE: If we user :computer_name from above this needs to be merged!!
    # domain.join_options = ['Win9xUpgrade']

    # Organisational Unit path in AD.
    # Specifies an organizational unit (OU) for the domain account.
    # Enter the full distinguished name of the OU in quotation marks.
    # The default value is the default OU for machine objects in the domain.
    domain.ou_path = 'OU=<no policies>,OU=<ou location>,OU=Servers-Windows-2012,DC=labs,DC=mycompany,DC=com'

    # Performs an unsecure join to the specified domain.
    # When this option is used username/password are not required
    domain.unsecure = false
  end
end
