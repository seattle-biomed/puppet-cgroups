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
  include cgroups::params

  $service = $cgroups::params::service_name

  service { $service:
    hasstatus   => true,
    hasrestart  => false,
  }

}
