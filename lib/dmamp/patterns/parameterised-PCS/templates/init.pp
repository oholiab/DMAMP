class MODNAME (
  $package     = $MODNAME::params::package,
  $service     = $MODNAME::params::service,
  $config_dir  = $MODNAME::params::config_dir,
  $config_file = $MODNAME::params::config_file,
  $user        = $MODNAME::params::user,
  $group       = $MODNAME::params::group,
  #ADDITIONALPARAMS
  #$PARAM       = $MODNAME::params::PARAM,
) inherits MODNAME::params {
  anchor {'MODNAME::start':}->
  class { 'MODNAME::package':}~>
  class { 'MODNAME::config':}~>
  class { 'MODNAME::service':}~>
  anchor {'MODNAME::end':}
}


