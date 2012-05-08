class bloop::config {
  file { $bloop::config_file:
    content => template("${module_name}/bloop_config.erb"),
    owner   => $bloop::user,
    group   => $bloop::group,
    mode    => '0444',
  }
}
