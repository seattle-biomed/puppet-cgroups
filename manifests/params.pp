# == Class: cgroups
#
# Full description of class cgroups is in the README.
#
class cgroups::params {
  $package_name = $::osfamily ? {
    'Debian' => ['cgroup-bin', 'libcgroup1', 'cpuset'],
    default  => fail('Unsupported Platform')
  }
  $config_file  = '/etc/cgconfig.conf'
  $rules_file   = '/etc/cgrules.conf'

  $config_preamble = 'mount {
    cpu = /sys/fs//cgroup/cpu;
    cpuacct = /sys/fs/cgroup/cpuacct;
    devices = /sys/fs/cgroup/devices;
    memory = /sys/fs/cgroup/memory;
    freezer = /sys/fs/cgroup/freezer;
  }
  '

  $service_name = $::osfamily ? {
    'Debian' => 'cgconfig',
    default  => fail('Unsupported Platform')
  }
}
