module "node" {
  source = "github.com/status-im/infra-tf-multi-provider"

  /* node type */
  name   = "node"
  group  = "node"
  env    = "waku"
  stage  = terraform.workspace

  /* scaling */
  ac_count = local.ws["ac_node_count"]
  do_count = local.ws["do_node_count"]
  gc_count = local.ws["gc_node_count"]

  /* instance sizes */
  do_type = local.ws["do_node_type"] /* DigitalOcean */
  ac_type = local.ws["ac_node_type"] /* Alibaba Cloud */
  gc_type = local.ws["gc_node_type"] /* Google Cloud */

  /* data volumes */
  ac_data_vol_size = local.ws["node_data_vol_size"]
  do_data_vol_size = local.ws["node_data_vol_size"]
  gc_data_vol_size = local.ws["node_data_vol_size"]

  /* firewall */
  open_tcp_ports = [
    "80",    /* certbot */
    "8000",  /* p2p websocket */
    "30303", /* libp2p main */
  ]
  open_udp_ports = [
    "9000",  /* discovery v5 */
  ]
}
