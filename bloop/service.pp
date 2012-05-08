class bloop::service {
  service { $bloop::service:
    ensure      => running,
    enable      => true,
    hasstatus   => true,
    hasrestart  => true,
  }
}
