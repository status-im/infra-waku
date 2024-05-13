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
      node_db_data_vol_size = 70
    }

    # Inherits defaults.
    test = {
      /* Settings specific to the test fleet/workspace. */
    }

    sandbox = {
      /* Settings specific to the test fleet/workspace. */
    }
  }
}

locals {
  ws = merge(local.env["defaults"], local.env[terraform.workspace])
}
