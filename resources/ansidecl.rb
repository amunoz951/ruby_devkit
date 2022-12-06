unified_mode true if respond_to?(:unified_mode)

provides :ruby_devkit_ansidecl
default_action :relocate

action :relocate do
  ansidecl_path = Pathname.new("#{Chef::Config.embedded_dir}/mingw/include/ansidecl.h")
  ansidecl_destination = "#{ansidecl_path.parent.parent.realpath}/x86_64-w64-mingw32/include"
  return if ::File.exist?("#{ansidecl_destination}/ansidecl.h")

  converge_if_changed do
    FileUtils.cp_r ansidecl_path.realpath, ansidecl_destination
  end
end
