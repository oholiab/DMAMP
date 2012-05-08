class bloop::params {
  case $::operatingsystem {
    'Debian':{
      case $::lsbdistcodename {
        'squeeze':{
          $package      = 'ssh'
          $service      = 'ssh'
          $config_dir   = '/etc/bloop'
          $config_file  = "$config_dir/bloop_config"
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
