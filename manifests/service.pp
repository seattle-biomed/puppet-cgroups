# == Class: cgroups
#
# Cgroups doesn't have an actual service. It is enabled by mounting the special
# 'cgroup' file system. The upstart script reloads the configuration files.
#
# Full description of class cgroups is in the README.
#
class cgroups::service (
  $enable   = $cgroups::service_enable,
  $ensure   = $cgroups::service_ensure,
) {

  # Ubuntu precise has an upstart job for reconfiguring cgroups, trusty doesn't.
  case $::lsbdistcodename {
    'precise': {
      service { 'cgconfig':
        hasstatus   => true,
        hasrestart  => false,
      }
    }
    'trusty': {}
    default: {}
  }

}
