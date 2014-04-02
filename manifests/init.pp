class kibana(
  $elasticsearch_server,
  $version      = $kibana::params::version,
  $download_dir = $kibana::params::download_dir,
  ) inherits kibana::params {

  archive{ $install_dir:
    url      => $package_url,
    target   => $download_path,
    checksum => false
  }

  exec { "set-elasticsearch-server":
    command => "sed -i -r -e 's|elasticsearch:.+|elasticsearch: \"${elasticsearch_server}\"|' ${install_path}/config.js",
    path    => "/usr/bin:/usr/sbin:/bin:/usr/local/bin",
    unless  => "grep 'elasticsearch: \"${elasticsearch_server}\"' ${install_path}/config.js",
    require => Archive[$install_dir]
  }
}