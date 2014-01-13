# Copyright 2014 Miguel Zuniga ( miguel-zuniga at hotmail.com )
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#    http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.#
#
# Class: elasticsearch
#
# Deploys elastic search cluster
#
# Parameters:
#
# Requires:
#	None
#

class elasticsearch (

  $version                          = 'present',
  $enable                           = true,
  $start                            = true,
  $cluster_name                     = 'elasticsearch',
  $node_max_local_storage_nodes     = 1,
  $index_number_of_shards           = 5,
  $index_number_of_replicas         = 1,
  $discovery_zen_ping_unicast_hosts = '["127.0.0.1"]',
  $es_heap_size                     = 1024,
  $node_name                        = $::hostname,
  $network_host                     = $::ipaddress,
  $node_master                      = true,
  $node_data                        = true

) {

  case $::operatingsystem {
    'Redhat', 'CentOS': 	{ require elasticsearch::redhat::service }
    'Ubuntu':			{ require elasticsearch::ubuntu::service }
    default:			{ require elasticsearch::redhat::service }
  }

}

