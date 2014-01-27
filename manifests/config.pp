# == Class: cgroups
#
# Full description of class cgroups is in the README.
#
class cgroups::config (
    $ensure   = $cgroups::config_ensure,
    $options  = $cgroups::config_options,
) {
  include cgroups::params
  file { $cgroups::params::config_file:
    ensure  => $ensure,
    mode    => '0440',
    content => template('cgroups/cgroups.conf.erb')
  }
}

