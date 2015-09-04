# == Class: cgroups
#
# Full description of class cgroups is in the README.
#
class cgroups::package (
  $ensure = hiera('cgroups::package::ensure', $cgroups::package_ensure)
) {
  include cgroups::params
  package { $cgroups::params::package_name:
    ensure => $ensure,
  }
}
