#
# Cookbook:: ruby_devkit
# Recipe:: default
#

ruby_devkit_ansidecl 'Relocate ansidecl' do
  action :nothing
end.run_action(:relocate)
