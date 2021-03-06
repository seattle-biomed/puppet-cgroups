# == Class: cgroups
#
# Full description of class cgroups is in the README.
#
class cgroups::config (
  $ensure   = $cgroups::config_ensure,
  $options  = $cgroups::config_options,
  $rules    = $cgroups::rules_options,
  $location = $cgroups::mount_location
) {
  include cgroups::params
  validate_array($options)
  validate_array($rules)

  $config_mounts = "
mount {
  cpu = ${location}/cpu;
  cpuacct = ${location}/cpuacct;
  cpuset = ${location}/cpuset;
  devices = ${location}/devices;
  memory = ${location}/memory;
  freezer = ${location}/freezer;
}"

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

