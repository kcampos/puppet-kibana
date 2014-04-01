class kibana(
  $version      = $kibana::params::version,
  $download_dir = $kibana::params::download_dir,
  ) inherits kibana::params {
	
  file { $download_dir: ensure => directory }

  archive{"kibana-${version}":
    url      => $package_url,
    target   => $download_dir,
    checksum => false,
    require  => File[$download_dir]
  }
}