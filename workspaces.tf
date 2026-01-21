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

      /* Number of node hosts in each data center. */
      ac_node_count = 1
      do_node_count = 1
      gc_node_count = 1

      /* Node host size in each data center */
      do_node_type = "s-1vcpu-2gb"
      ac_node_type = "ecs.t5-lc1m2.small"
      gc_node_type = "g1-small"

      /* Number of DB hosts in each data center. */
      ac_db_count = 1
      do_db_count = 1
      gc_db_count = 1

      /* DB host size in each data center */
      do_db_type = "s-1vcpu-2gb"
      ac_db_type = "ecs.t5-lc1m2.small"
      gc_db_type = "g1-small"

      node_data_vol_size = 40
      node_db_data_vol_size = 70
    }

    # Inherits defaults.
    test = {
      /* Settings specific to the test fleet/workspace. */
      do_db_type = "s-2vcpu-4gb"
      ac_db_type = "ecs.t5-lc1m2.large"
      gc_db_type = "t2d-standard-1"
    }

    sandbox = {
      /* Settings specific to the test fleet/workspace. */
      node_db_data_vol_size = 100

      do_db_type = "s-4vcpu-8gb"
      ac_db_type = "ecs.t5-lc1m4.large"
      gc_db_type = "e2-standard-2"
    }
  }
}

locals {
  ws = merge(local.env["defaults"], local.env[terraform.workspace])
}
