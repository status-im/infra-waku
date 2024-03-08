/**
 * This is a hacky way of binding specific variable
 * values to different Terraform workspaces.
 *
 * Details:
 * https://github.com/hashicorp/terraform/issues/15966
 */

locals {
  env = {
    defaults = {
      /* Default settings for all fleets/workspaces. */

      hosts_count = 1 /* number of hosts in each DC */

      do_type = "s-1vcpu-2gb"        /* DigitalOcean */
      ac_type = "ecs.t5-lc1m2.small" /* Alibaba Cloud */
      gc_type = "g1-small"           /* Google Cloud */

      node_data_vol_size = 40
      node_db_data_vol_size = 50
    }

    # Inherits defaults.
    test = {
      /* Settings specific to the test fleet/workspace. */
      cf_zone_id = "14660d10344c9898521c4ba49789f563"
      domain = "statusim.net"
    }

    sandbox = {
      /* Settings specific to the test fleet/workspace. */
      cf_zone_id = "fd48f427e99bbe1b52105351260690d1"
      domain = "status.im"
    }
  }
}

locals {
  ws = merge(local.env["defaults"], local.env[terraform.workspace])
}
