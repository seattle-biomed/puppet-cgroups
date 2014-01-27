# == Class: cgroups
#
# Full description of class cgroups is in the README.
#
class cgroups::config (
  $ensure   = $cgroups::config_ensure,
  $options  = $cgroups::config_options,
  $rules    = $cgroups::rules_options,
) {
  include cgroups::params
  validate_array($options)
  validate_array($rules)

  $config_preamble = $cgroups::params::config_preamble
  file { $cgroups::params::config_file:
    ensure  => $ensure,
    mode    => '0440',
    content => template('cgroups/cgconfig.conf.erb')
  }

  file { $cgroups::params::rules_file:
    ensure  => $ensure,
    mode    => '0440',
    content => template('cgroups/cgrules.conf.erb')
  }

}

