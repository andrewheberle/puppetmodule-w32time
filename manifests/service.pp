class w32time::service inherits w32time {
  service { $service_name:
    ensure => 'running',
    enable => true,
  }
}