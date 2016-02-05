#Use attributes to install all packages/modules etc
# puts '====================================================================='
# log 'message' do
#   message "Full Hash:  #{node['windows_security_policy']['dsc_ura']}"
#   level :error
# end

node['windows_security_policy']['dsc_ura'].each do |key, value|
  log 'message' do
    message "Key:  #{key} | Value: #{value}"
    level :warn
  end
  
  if value == [""]
    dsc_resource "Windows Security - User Rights Assignments - Clear Rights - #{key}" do
      resource :UserRightsAssignment
      property :Privilege, key
      property :Ensure, 'Absent'
    end
  else
    se_identity = value.to_a
    dsc_resource "Windows Security - User Rights Assignments - Map Rights - #{key}" do
      resource :UserRightsAssignment
      property :Privilege, key
      property :Ensure, 'Present'
      property :Identity, se_identity
    end
  end
end
