class elasticsearch::redhat::config (

  $cluster_name                     = $elasticsearch::cluster_name,
  $node_max_local_storage_nodes     = $elasticsearch::node_max_local_storage_nodes,
  $index_number_of_shards           = $elasticsearch::index_number_of_shards,
  $index_number_of_replicas         = $elasticsearch::index_number_of_replicas,
  $discovery_zen_ping_unicast_hosts = $elasticsearch::discovery_zen_ping_unicast_hosts,
  $node_name                        = $elasticsearch::node_name,
  $network_host                     = $elasticsearch::network_host,
  $node_master                      = $elasticsearch::node_master,
  $node_data                        = $elasticsearch::node_data,
  $es_heap_size                     = $elasticsearch::es_heap_size

) {

  require elasticsearch::redhat::install

  file { 

    '/etc/init.d/elasticsearch':
      ensure  => present,
      owner   => root,
      group   => root,
      mode    => '0755',
      source  => 'puppet:///modules/elasticsearch/init-elasticsearch',

    '/etc/sysconfig/elasticsearch':
      owner   => root,
      group   => root,
      mode    => '0644',
      content => template('elasticsearch/sysconfig-elasticsearch.erb'),

    '/etc/elasticsearch/elasticsearch.yml':
      owner   => elasticsearch,
      group   => elasticsearch,
      mode    => '0644',
      content => template('elasticsearch/elasticsearch_yaml.erb'),
    
    '/etc/elasticsearch/logging.yml':
      owner   => elasticsearch,
      group   => elasticsearch,
      mode    => '0644',
      source  => 'puppet:///modules/elasticsearch/logging.yml',

  }
}
