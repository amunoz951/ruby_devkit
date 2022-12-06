#
# Cookbook:: ruby_devkit
# Recipe:: default
#

return unless RubyDevkit::Helper.install_ruby_devkit?

devkit_version = node['ruby_devkit']['ruby_version']
devkit_filename = "rubyinstaller-devkit-#{devkit_version}-#{RubyDevkit::Helper.node_architecture}.exe"
devkit_source_url = node['ruby_devkit']['source_url']
devkit_destination = node['ruby_devkit']['destination']
embedded_dir_double_slashes = Chef::Config.embedded_dir.gsub('/') { '\\\\' }
devkit_destination_double_slashes = devkit_destination.gsub('\\') { '\\\\' }
existing_ruby_version = Dir.exist?(devkit_destination) ? shell_out("\"#{devkit_destination}/bin/ruby.exe\" -v").stdout : 'none'

package "Ruby w/DevKit #{devkit_version}-#{RubyDevkit::Helper.node_architecture}" do
  action :nothing
  source "#{devkit_source_url}/RubyInstaller-#{devkit_version}/#{devkit_filename}"
  options "/DIR=\"#{devkit_destination}\" /VERYSILENT /NORESTART"
  not_if { existing_ruby_version.include?(devkit_version.split('-').first) }
end.run_action(:install)

template "#{Chef::Config.embedded_dir}/lib/ruby/site_ruby/devkit.rb" do
  action :nothing
  source 'devkit.rb.erb'
  variables(
    chef_client_embedded_dir: embedded_dir_double_slashes,
    chef_client_bin_dir: "#{embedded_dir_double_slashes}\\\\bin",
    mingw_bin_dir: "#{devkit_destination_double_slashes}\\\\msys64\\\\mingw64\\\\bin"
  )
  only_if { node['ruby_devkit']['override_chef_client_devkit'] }
end.run_action(:create)
