#
# Cookbook:: ruby_devkit
# Recipe:: default
#

devkit_version = node['ruby_devkit']['ruby_version']
devkit_architecture = _64_bit? ? 'x64' : 'x86'
devkit_filename = "rubyinstaller-devkit-#{devkit_version}-#{devkit_architecture}.exe"
devkit_destination = node['ruby_devkit']['destination']
embedded_dir_double_slashes = Chef::Config.embedded_dir.gsub('/') { '\\\\' }
devkit_destination_double_slashes = devkit_destination.gsub('\\') { '\\\\' }
existing_ruby_version = Dir.exist?(devkit_destination) ? shell_out("\"#{devkit_destination}/bin/ruby.exe\" -v").stdout : 'none'

windows_package "Ruby w/DevKit #{devkit_version}-#{devkit_architecture}" do
  action :nothing
  source "https://github.com/oneclick/rubyinstaller2/releases/download/RubyInstaller-#{devkit_version}/#{devkit_filename}"
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
