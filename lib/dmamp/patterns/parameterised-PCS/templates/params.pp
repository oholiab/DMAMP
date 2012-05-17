class MODNAME::params {
  case $::operatingsystem {
    'Debian':{
      case $::lsbdistcodename {
        'squeeze':{
          $package      = 'MODNAME'
          $service      = 'MODNAME'
          $config_dir   = '/etc/MODNAME'
          $config_file  = "$config_dir/MODNAME_config"
          $user         = 'root'
          $group        = 'root'
          #ADDITIONALPARAMS
          #$PARAM       = 'value'
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
