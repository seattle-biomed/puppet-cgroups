# == Class: cgroups
#
# Full description of class cgroups is in the README.
#
class cgroups (
  $config_ensure  = 'present',
  $config_options = hash([]),
  $package_ensure = true,
  $service_ensure = 'running',
  $service_enable = true,
) {
  anchor { "${module_name}::begin": } ->
  class {"${module_name}::package": } ->
  class {"${module_name}::config": } ~>
  class {"${module_name}::service": } ~>
  anchor { "${module_name}::end": }
}
