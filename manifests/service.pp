# == Class: cgroups
#
# Full description of class cgroups is in the README.
#
class cgroups::service (
  $ensure = $cgroups::service_ensure,
  $enable = $cgroups::service_enable
) {
  include cgroups::params
  service { $cgroups::params::service_name:
    ensure => $ensure,
    enable => $enable,
  }
}
