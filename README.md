# cSecurityOptions_cookbook (windows_security_policy)
This cookbook was built to implement Windows Local Security Policy (normally only available via MMC).  There are two methods to achieving that:  PowerShell Scripts and DSC Module.

The attributes are separated based on the method they are implemented.  It is ugly when using the PowerShell script method.  It is advisable to use the DSC method; however, dependencies are required (as listed below).

Currently supports:  
- Windows 2012 R2
- Chef 12 (12.4.1+) clients

Contribution
------------
This cookbook is an EXAMPLE cookbook that implements the LSA within Windows.  This is being published to help people understand how to implement this complex componet of windows.

This cookbook will be periodically (not regularly) updated.  Please email me if there are questions about this cookbook.  We can discuss "going forward" approaches.

Dependencies
------------
This is not a fully functional cookbook.  I'll give some hints here to get it working, but it will require a little work on your part to get it there.

- Need a Windows 2012R2 server [Full GUI or Core] (it will probably work on any Windows 2008+ or Windows 7+, but I did not test it)
- Need to get PowerShell v5.0 installed - this is required for dsc_resource.  You could use the straight powershell_script recipes without that resource
    Preview: https://www.microsoft.com/en-us/download/details.aspx?id=48729
    Production (was pulled due to bug): https://www.microsoft.com/en-us/download/details.aspx?id=50395
- Need to disable LCM:
```
# create a configuration command to generate a meta.mof to set
# Local Configuration Manager settings
Configuration LCMSettings {
    Node localhost {
    LocalConfigurationManager {
        RefreshMode = 'Disabled'
    }
    }
}
# Run the configuration command and generate the meta.mof to configure
# a local configuration manager
LCMSettings
# Apply the local configuration manager settings found in the LCMSettings
# folder (by default configurations are generated to a folder in the current
# working directory named for the configuration command name
Set-DscLocalConfigurationManager -path ./LCMSettings
```
- Need to import-module for cSecurityOptions from PowerShell Gallery (http://www.powershellgallery.com/packages/cSecurityOptions)
- Some security options require a reboot after it is set.  This is *not* implemented within the recipes.  There is a guide that shows which options require a reboot:
    https://www.microsoft.com/en-us/download/details.aspx?id=25250

After these dependencies are satisfied, then this cookbook should converge for each of these recipes.

Requirements
------------
Please see metadata.rb for specific details.

This cookbook (using Vagrant) requires that the vagrant-winrm plugin be installed:
```
vagrant plugin install vagrant-winrm --plugin-source http://rubygems.org
```

For vagrant VMs to work behind a proxy you will also need the vagrant-proxyconf plugin:  
**Note:** If you have already created a box prior to installing the plugin, you will need destroy and then re-create it to get things to work.
```
vagrant plugin install vagrant-proxyconf --plugin-source http://rubygems.org
```

[optional] For vagrant VMs to join the domain, you will also need vagrant-domain-join plugin:  
**Note:** If you have already created a box prior to installing the plugin, you will need destroy and then re-create it to get things to work.
```
vagrant plugin install vagrant-windows-domain --plugin-source http://rubygems.org
```

[optional] For Domain Join to work properly, follow this procedure:
 1. Set this environment variable (this is required due to a bug in the destroy operation:  https://github.com/mitchellh/vagrant/issues/6026):
 ```
 export VAGRANT_DETECTED_OS=cygwin
 ```
 2. Get appropriate credentials to join the OU location
 3. Modify parameters within 'Vagrantfile-ad_join.rb' for the User and Password

NOTES:  If using chefdk 1.10.0, then you may have gem conflicts.  Please read this:  https://github.com/chef/chef-dk/issues/542
There are a bunch of other errors, which hasn't been solved.  It is recommended that ChefDK version is 0.7.0.

License and Authors
-------------------
Authors: ChrisA.Walker (chriswalker8@gmail.com)
Please see LICENSE file for details