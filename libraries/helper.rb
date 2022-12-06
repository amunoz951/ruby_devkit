module RubyDevkit
  module Helper
    def self.install_ruby_devkit?
      node ||= ::Chef.run_context.node
      return false unless node.platform?('windows')
      return false unless node['ruby_devkit']['only_if']['chef-versions'].nil? || node['ruby_devkit']['only_if']['chef-versions'].include?(Chef::VERSION)
      true
    end

    def self.node_architecture
      ['a'].pack('P').length > 4 ? 'x64' : 'x32'
    end
  end
end
