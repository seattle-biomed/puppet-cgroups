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
  $location = $cgroups::mount_location
) {
  include cgroups::params

  $service = $cgroups::params::service_name

  $mount_ensure = $ensure ? {
    'running' => 'present',
    true      => 'present',
    default   => 'absent'
  }

  # Puppet doesn't recognize the special device 'cgroup' so we need to mount all.
  mount { $location:
    ensure  => $mount_ensure,
    device  => 'cgroup',
    fstype  => 'cgroup',
    options => 'defaults',
    dump    => '0',
    pass    => '0',
  } ~>
  exec { 'remount_all_for_cgroups':
    command => '/bin/mount -a',
    creates => "${location}/tasks"
  }

  service { $service:
    hasstatus   => true,
    hasrestart  => true,
  }

}
