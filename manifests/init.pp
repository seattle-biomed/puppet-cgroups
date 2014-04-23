# == Class: cgroups
#
# Full description of class cgroups is in the README.
# https://help.ubuntu.com/lts/serverguide/cgroups.html
#
class cgroups (
  $config_ensure  = 'present',
  $config_options = [],
  $mount_location = '/sys/fs/cgroup',
  $package_ensure = 'installed',
  $rules_options  = [],
  $service_ensure = 'running',
  $service_enable = true,
) {
  anchor { '::cgroups::begin': } ->
  class  { '::cgroups::package': } ->
  class  { '::cgroups::config': } ~>
  class  { '::cgroups::service': } ->
  anchor { '::cgroups::end': }
}
