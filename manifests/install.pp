# == Class cgroups::intall
# This class is meant to be called from cgroups
# It install requires packages
class cgroups::install {
  include cgroups::params
  package { $cgroups::params::pkgname:
    ensure => present,
  }
}
