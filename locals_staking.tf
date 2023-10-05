data "aws_secretsmanager_secret_version" "sm_cash_app_api" {
  secret_id = "${local.environment_stage}-secret-cash-app-api"
}

data "aws_ssm_parameter" "ssm_cash_app_api" {
  name = "/${local.environment_stage}/general/cash-app-api/STAKING_SERVICE_URL"
}

locals {
  dynamic_schedulers_staking = {
    dev = {
      get_staking_products_sol = {
        cron_expressions = "rate(2 minutes)"
        payload = {
          url    = data.aws_ssm_parameter.ssm_cash_app_api.value
          path   = "/staking/products/SOL"
          method = "GET"
          header = {
            token = jsondecode(data.aws_secretsmanager_secret_version.sm_cash_app_api.secret_string)["STAKING_COMMUNICATION_KEY"]
          }
        }
      }
    }

    stg = {
      get_staking_products_sol = {
        cron_expressions = "rate(2 minutes)"
        payload = {
          url    = data.aws_ssm_parameter.ssm_cash_app_api.value
          path   = "/staking/products/SOL"
          method = "GET"
          header = {
            token = jsondecode(data.aws_secretsmanager_secret_version.sm_cash_app_api.secret_string)["STAKING_COMMUNICATION_KEY"]
          }
        }
      }
    }

    prod = {
      get_staking_products_sol = {
        cron_expressions = "rate(2 minutes)"
        payload = {
          url    = data.aws_ssm_parameter.ssm_cash_app_api.value
          path   = "/staking/products/SOL"
          method = "GET"
          header = {
            token = jsondecode(data.aws_secretsmanager_secret_version.sm_cash_app_api.secret_string)["STAKING_COMMUNICATION_KEY"]
          }
        }
      }
    }
  }
  
  environment_stage = terraform.workspace
  environment       = var.environments[local.environment_stage]
  schedulers_staking        = local.dynamic_schedulers_staking[local.environment_stage]

  mandatory_tags = {
    Environment = local.environment_stage
    App         = "exchange"
    Terraform   = "true"
    Github      = "IaaC"
  }
}
