# cgroups

This is the cgroups module.

# Requirements

* Puppetlabs/stdlib

# Installation

  puppet module install seattle-biomed/cgroups

# Synopsis

  Install and manage cgroups service.

# Parameters

- *config_ensure* (Default: 'present')
- *config_options* (Default: Empty)
- *package_ensure* (Default: 'true')
- *service_ensure* (Default: 'running')
- *service_enable* (Default: 'true')

# Examples

Basic Installation

  include '::cgroups'

Parameterized Installation

  $config_options = {
    option => value
  }

  class { '::cgroups':
    config_ensure  => 'present',
    config_options => $config_options,
    package_ensure => 'true',
    service_ensure => 'running',
    service_enable => 'true',
  }

Installation with Hiera

  ---
  class:  - cgroups
  cgroups::config::ensure:  'present'
  cgroups::config::options:
    option: value
  cgroups::package::ensure:  'true'
  cgroups::service::ensure:  'running'
  cgroups::service::enable:  'true'

# License

  See LICENSE

# Contact


# Support

Please log tickets and issues at our [Projects site](https://github.com/seattle-biomed/cgroups)
