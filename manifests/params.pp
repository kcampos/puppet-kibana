class kibana::params {
  $version       = "3.0.0"
  $package_url   = "https://download.elasticsearch.org/kibana/kibana/kibana-${version}.tar.gz"
  $download_path = "/usr/share"
  $install_dir   = "kibana-${version}"
  $install_path  = "${download_path}/${install_dir}"
}