# Description

This repo defines infrastructure for running [nim-waku](github.com/status-im/nim-waku) nodes shards.

There are 2 kinds of nodes:

* `node` - `nim-waku` nodes
* `node-db` - PostgreSQL used by `node` nodes for envelope storage.

# Continious Integration

Jenkins CI builds can be used to build and deploy new Docker images:

* `waku.test`: https://ci.infra.status.im/job/nim-waku/job/deploy-waku-test/

# Repo Usage

For how to use this repo read the [Infra Repo Usage](https://github.com/status-im/infra-docs/blob/master/docs/general/infra_repo_usage.md) doc.
