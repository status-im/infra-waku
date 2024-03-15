module "node-db" {
  source = "github.com/status-im/infra-tf-multi-provider"

  /* node type */
  name   = "node-db"
  group  = "node-db"
  env    = "waku"
  stage  = terraform.workspace

  /* scaling */
  host_count = local.ws["hosts_count"]

  /* instance sizes */
  do_type = local.ws["do_type"] /* DigitalOcean */
  ac_type = local.ws["ac_type"] /* Alibaba Cloud */
  gc_type = local.ws["gc_type"] /* Google Cloud */

  /* data volumes */
  ac_data_vol_size = local.ws["node_db_data_vol_size"]
  do_data_vol_size = local.ws["node_db_data_vol_size"]
  gc_data_vol_size = local.ws["node_db_data_vol_size"]
}
