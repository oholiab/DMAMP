class MODNAME::params {
  case $::operatingsystem {
    'Debian':{
      case $::lsbdistcodename {
        'squeeze':{
          $package      = 'ssh'
          $service      = 'ssh'
          $config_dir   = '/etc/MODNAME'
          $config_file  = "$config_dir/MODNAME_config"
          $user         = 'root'
          $group        = 'root'
          #ADDITIONALPARAMS
        }
        default:{
          fail("Release $::lsbdistcodename not supported")
        }
      }
    }
    default:{
      fail("Unknown OS: $::operatingsystem")
    }
  }
}