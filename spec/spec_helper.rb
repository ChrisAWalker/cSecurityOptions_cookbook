require 'chef/mixin/securable'

class Chef
  module Mixin
    #
    # Monkeypatch Chef to allow testing of WindowsSecurableAttributes on
    # non Windows systems
    #
    module Securable
      # In Chef, this module is only included if the RUBY_PLATFORM is
      # Windows-like. In ChefSpec, we want to include this, regardless of the
      # platform, becuase this module holds the `inherits` attribute, which is
      # critical in testing Windows resources.
      include WindowsSecurableAttributes

      def self.included(including_class)
        including_class.extend(WindowsMacros)
        including_class.rights_attribute(:rights)
        including_class.rights_attribute(:deny_rights)
      end
    end
  end
end

require 'chefspec'
require 'chefspec/berkshelf'

at_exit { ChefSpec::Coverage.report! }

# (***We had to create this custom function to get rspec tests to work against the below "known unsafe" registry types***)
# Notes from chef's registry_key.rb file:
# To avoid sending data that cannot be nicely converted for json, we have
# the values method return "safe" data if the data type is "unsafe". Known "unsafe"
# data types are :binary, :dword, :dword-big-endian, and :qword. If other
# criteria generate data that cannot reliably be sent as json, add that criteria
# to the needs_checksum? method. When unsafe data is detected, the values method
# returns an md5 checksum of the listed data.
#
# :unscrubbed_values returns the values exactly as provided in the resource (i.e.,
# data is not checksummed, regardless of the data type/"unsafe" criteria).
def registry_scrub(data)
  data_io = StringIO.new(data.to_s)
  Chef::Digester.instance.generate_md5_checksum(data_io)
end

# Stubs any include_recipe calls to avoid needing to stub things from another recipe's spec files
# This method only supports 'let' chef runs, not 'cached'
def stub_any_include_recipe
  # Test each recipe in isolation, regardless of includes
  @included_recipes = []
  allow_any_instance_of(Chef::RunContext).to receive(:loaded_recipe?).and_return(false)
  allow_any_instance_of(Chef::Recipe).to receive(:include_recipe) do |_recipe, included_recipe|
    allow_any_instance_of(Chef::RunContext).to receive(:loaded_recipe?).with(included_recipe).and_return(true)
    @included_recipes << included_recipe
  end
  allow_any_instance_of(Chef::RunContext).to receive(:loaded_recipes).and_return(@included_recipes)
end

# Stubs include_recipe calls for the specified recipes
# This method supports 'cached' and 'let' runs when all expected recipes are passed in via an array of strings
def stub_include_recipe(recipes)
  # Test each recipe in isolation, regardless of includes
  @included_recipes = recipes
  allow_any_instance_of(Chef::RunContext).to receive(:loaded_recipe?).and_return(false)
  allow_any_instance_of(Chef::Recipe).to receive(:include_recipe) do |_recipe, included_recipe|
    allow_any_instance_of(Chef::RunContext).to receive(:loaded_recipe?).with(included_recipe).and_return(true)
  end
  allow_any_instance_of(Chef::RunContext).to receive(:loaded_recipes).and_return(@included_recipes)
end
