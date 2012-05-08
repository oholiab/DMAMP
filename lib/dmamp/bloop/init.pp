class bloop (
  $package     = $bloop::params::package,
  $service     = $bloop::params::service,
  $config_dir  = $bloop::params::config_dir,
  $config_file = $bloop::params::config_file,
  $user        = $bloop::params::user,
  $group       = $bloop::params::group,
  #ADDITIONALPARAMS
) inherits bloop::params {
  anchor {'bloop::start':}->
  class { 'bloop::package':}~>
  class { 'bloop::config':}~>
  class { 'bloop::service':}~>
  anchor {'bloop::end':}
}


