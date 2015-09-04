# == Class: cgroups
#
# Full description of class cgroups is in the README.
#
class cgroups::config (
  $ensure   = hiera('cgroups::config::ensure', $cgroups::config_ensure),
  $options  = hiera('cgroups::config::options', $cgroups::config_options),
  $rules    = hiera('cgroups::config::rules', $cgroups::rules_options),
  $location = hiera('cgroups::config::location', $cgroups::mount_location),
) {
  include cgroups::params
  validate_hash($options)
  validate_array($rules)

  $config_mounts = {
    'cpu'     => "${location}/cpu;",
    'cpuacct' => "${location}/cpuacct;",
    'cpuset' => "${location}/cpuset;",
    'devices' => "${location}/devices;",
    'memory' => "${location}/memory;",
    'freezer' => "${location}/freezer;",
  }

  file { $cgroups::params::config_file:
    ensure  => $ensure,
    mode    => '0444',
    content => template('cgroups/cgconfig.conf.erb')
  }

  file { $cgroups::params::rules_file:
    ensure  => $ensure,
    mode    => '0444',
    content => template('cgroups/cgrules.conf.erb')
  }

}

