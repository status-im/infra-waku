module "node" {
  source = "github.com/status-im/infra-tf-multi-provider"

  /* node type */
  name   = "node"
  group  = "node"
  env    = "waku"
  stage  = terraform.workspace
  domain = var.domain
  cf_zone_id = var.cf_zone_id

  /* scaling */
  host_count = local.ws["hosts_count"]

  /* instance sizes */
  do_type = local.ws["do_type"] /* DigitalOcean */
  ac_type = local.ws["ac_type"] /* Alibaba Cloud */
  gc_type = local.ws["gc_type"] /* Google Cloud */

  /* data volumes */
  ac_data_vol_size = local.ws["node_data_vol_size"]
  do_data_vol_size = local.ws["node_data_vol_size"]
  gc_data_vol_size = local.ws["node_data_vol_size"]

  /* firewall */
  open_tcp_ports = [
    "80",    /* certbot */
    "8000",  /* p2p websocket */
    "30303", /* p2p main */
    /* only on node-01.gc-us-central1-a.wakuv2.prod */
    "9000",  /* chat2bridge */
  ]
  open_udp_ports = [
    "9000",  /* discovery v5 */
  ]
}
