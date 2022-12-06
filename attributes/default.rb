default['ruby_devkit']['ruby_version'] = '3.0.3-1'
default['ruby_devkit']['destination'] = "C:\\Ruby30-#{RubyDevkit::Helper.node_architecture}"
default['ruby_devkit']['override_chef_client_devkit'] = true
default['ruby_devkit']['source_url'] = 'https://github.com/oneclick/rubyinstaller2/releases/download'
default['ruby_devkit']['only_if']['chef-versions'] = %w(17.10.3) # specify versions where the specified devkit will be installed or set to nil for any version
