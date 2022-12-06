#
# Cookbook:: ruby_devkit
# Recipe:: default
#

return unless platform?('windows')

ruby_devkit_ansidecl 'Relocate ansidecl' do
  action :nothing
end.run_action(:relocate)
