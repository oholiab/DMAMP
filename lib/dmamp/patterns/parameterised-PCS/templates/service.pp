class MODNAME::service {
  service { $MODNAME::service:
    ensure      => running,
    enable      => true,
    hasstatus   => true,
    hasrestart  => true,
  }
}
