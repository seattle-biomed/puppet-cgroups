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

}
