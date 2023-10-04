locals {
  dynamic_schedulers = {
  
    dev = {
      check_solana = {
        cron_expressions = "rate(2 minutes)"
        payload = {
          url    = "https://dev-staking-pvt.fasset.tech"
          path   = "/api/v1/staking/products/SOL"
          method = "GET"
          header = {
            token = "9d8bef2f955b7aea865f1cecd827d93b673df4bd976f10c6b604cb21cec3d1ba78487ffacd3cc39860471d2e921f858045441c35c13d2465d1ef48834d737d71"
          }
        }
      }
    }
    
    stg = {
      check_solana = {
        cron_expressions = "rate(2 minutes)"
        payload = {
          url    = "https://stg-staking-pvt.fasset.tech"
          path   = "/api/v1/staking/products/SOL"
          method = "GET"
          header = {
            token = "9d8bef2f955b7aea865f1cecd827d93b673df4bd976f10c6b604cb21cec3d1ba78487ffacd3cc39860471d2e921f858045441c35c13d2465d1ef48834d737d71"
          }
        }
      }
    }
    
    prod = {
      check_solana = {
        cron_expressions = "rate(2 minutes)"
        payload = {
          url    = "https://staking-pvt.fasset.com"
          path   = "/api/v1/staking/products/SOL"
          method = "GET"
          header = {
            token = "9d8bef2f955b7aea865f1cecd827d93b673df4bd976f10c6b604cb21cec3d1ba78487ffacd3cc39860471d2e921f858045441c35c13d2465d1ef48834d737d71"
          }
        }
      }
    }
    
  }
  
  environment_stage = terraform.workspace
  environment       = var.environments[local.environment_stage]
  schedulers        = local.dynamic_schedulers[local.environment_stage]

  mandatory_tags = {
    Environment = local.environment_stage
    App         = "exchange"
    Terraform   = "true"
    Github      = "IaaC"
  }
}
