class MODNAME::config {
  file { $MODNAME::config_file:
    content => template("${module_name}/MODNAME_config.erb"),
    owner   => $MODNAME::user,
    group   => $MODNAME::group,
    mode    => '0444',
  }
}
