class elasticsearch::redhat::service {

  require elasticsearch::redhat::config

  $ensure = $elasticsearch::start ? {true    => running, default => stopped}

  service {'elasticsearch':
    ensure => $ensure,
    enable => $elasticsearch::enable,
  }
}
