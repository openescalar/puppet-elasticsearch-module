class elasticsearch::redhat::install ( 
) {

  package {'elasticsearch.noarch':
    ensure => $elasticsearch::version,
  }

  file { '/etc/security/limits.d/50-elasticsearch.conf':
    ensure  => present,
    path    => '/etc/security/limits.d/50-elasticsearch.conf',
    owner   => root,
    group   => root,
    mode    => '0644',
    replace => true,
    source  => 'puppet:///modules/elasticsearch/limits_d-elasticsearch.conf',
  }
}
