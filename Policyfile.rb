name 'kitchen_ruby_devkit'

default_source :supermarket, 'https://supermarket.chef.io'

run_list [
  'ruby_devkit::default',
  'ruby_devkit::ansidecl',
]

cookbook 'ruby_devkit', path: '.'
