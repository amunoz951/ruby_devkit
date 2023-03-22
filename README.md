# ruby_devkit Cookbook

[![Cookbook Version](https://img.shields.io/badge/cookbook-1.1.0-green.svg)](https://supermarket.chef.io/cookbooks/ruby_devkit)

Installs the Ruby DevKit and optionally uses the new ruby instance for Chef-Client. This is particularly useful to fix the defect in Chef17 that causes the building of native ruby gems to fail.

## Contents

- [Recipes](#recipes)

  - [default](#default)
  - [ansidecl](#ansidecl)

- [License and Author](#license-and-author)

## Requirements

### Platforms

- Windows Server 2012 (R2)+

### Chef

- Chef 14+

### Cookbooks

- no cookbook dependencies

## Recipes

### default

`Installs the ruby devkit based on the version and location specified in attributes. By default, installs 3.0.3-1 to C:\Ruby30-x64. It also optionally overrides the chef-client devkit path to the destination path.`

### ansidecl

`Runs the ruby_devkit_ansidecl resource to ensure the ansidecl.h file is in the correct location.`

## Resources
___
### ruby_devkit_ansidecl ###
    Description: Relocates the ansidecl.h file to the correct location if the file is missing.

Examples: <br />
```ruby
ruby_devkit_ansidecl 'Relocate ansidecl' do
  action :relocate
end
```

## License and Author

- Author:: Alex Munoz ([amunoz951@gmail.com](mailto:amunoz951@gmail.com))

```text
Copyright 2022-2022, Alex Munoz.

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
```
