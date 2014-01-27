# == Class: cgroups
#
# Full description of class cgroups is in the README.
#
class cgroups::params {
  $package_name = 'cgroups'
  $config_file  = 'cgroups/etc/cgroups.conf'
  $service_name = $::osfamily ? {
    'Debian' => 'cgroups',
    'RedHat' => 'cgroups',
    default  => fail('unsupported platform')
  }
}
