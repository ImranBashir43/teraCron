data "aws_secretsmanager_secret_version" "sm_yield_product_api" {
  secret_id = "${local.environment_stage}-secret-yield-product-api"
}

data "aws_ssm_parameter" "ssm_yield_product_api" {
  name = "/${local.environment_stage}/general/yield-product-api/REPOSITORY_URL"
}

locals {
  dynamic_schedulers_yield_product_api = {
    dev = {
      runAutoRenewalsAndProfitDisbursements = {
        cron_expressions = "cron(0 0 * * ? *)"
        payload = {
          url    = data.aws_ssm_parameter.ssm_yield_product_api.value
          path   = "/api/v1/yield/runAutoRenewalsAndProfitDisbursements"
          method = "POST"
          header = {
            token = jsondecode(data.aws_secretsmanager_secret_version.sm_yield_product_api.secret_string)["AWS_SCHEDULAR_SECRETS"]
          }
        }
      }


      runAutoRenewalsAndProfitDisbursementsForTestUsers = {
        cron_expressions = "rate(10 minutes)"
        payload = {
          url    = data.aws_ssm_parameter.ssm_yield_product_api.value
          path   = "/api/v1/yield/runAutoRenewalsAndProfitDisbursements"
          method = "POST"
          header = {
            token = jsondecode(data.aws_secretsmanager_secret_version.sm_yield_product_api.secret_string)["AWS_SCHEDULAR_SECRETS"]
          }
        }
      }

      runFailedAutoRenewalsAndProfitDisbursements = {
        cron_expressions = "cron(10 0 * * ? *)"
        payload = {
          url    = data.aws_ssm_parameter.ssm_yield_product_api.value
          path   = "/api/v1/yield/runAutoRenewalsAndProfitDisbursements"
          method = "POST"
          header = {
            token = jsondecode(data.aws_secretsmanager_secret_version.sm_yield_product_api.secret_string)["AWS_SCHEDULAR_SECRETS"]
          }
        }
      }
    }

    stg = {
      runAutoRenewalsAndProfitDisbursements = {
        cron_expressions = "cron(0 0 * * ? *)"
        payload = {
          url    = data.aws_ssm_parameter.ssm_yield_product_api.value
          path   = "/api/v1/yield/runAutoRenewalsAndProfitDisbursements"
          method = "POST"
          header = {
            token = jsondecode(data.aws_secretsmanager_secret_version.sm_yield_product_api.secret_string)["AWS_SCHEDULAR_SECRETS"]
          }
        }
      }

      runFailedAutoRenewalsAndProfitDisbursements = {
        cron_expressions = "cron(10 0 * * ? *)"
        payload = {
          url    = data.aws_ssm_parameter.ssm_yield_product_api.value
          path   = "/api/v1/yield/runAutoRenewalsAndProfitDisbursements"
          method = "POST"
          header = {
            token = jsondecode(data.aws_secretsmanager_secret_version.sm_yield_product_api.secret_string)["AWS_SCHEDULAR_SECRETS"]
          }
        }
      }
    }

    prod = {
      runAutoRenewalsAndProfitDisbursements = {
        cron_expressions = "cron(0 0 * * ? *)"
        payload = {
          url    = data.aws_ssm_parameter.ssm_yield_product_api.value
          path   = "/api/v1/yield/runAutoRenewalsAndProfitDisbursements"
          method = "POST"
          header = {
            token = jsondecode(data.aws_secretsmanager_secret_version.sm_yield_product_api.secret_string)["AWS_SCHEDULAR_SECRETS"]
          }
        }
      }

      runFailedAutoRenewalsAndProfitDisbursements = {
        cron_expressions = "cron(10 0 * * ? *)"
        payload = {
          url    = data.aws_ssm_parameter.ssm_yield_product_api.value
          path   = "/api/v1/yield/runAutoRenewalsAndProfitDisbursements"
          method = "POST"
          header = {
            token = jsondecode(data.aws_secretsmanager_secret_version.sm_yield_product_api.secret_string)["AWS_SCHEDULAR_SECRETS"]
          }
        }
      }
    }
  }

  schedulers_yield_product_api  = local.dynamic_schedulers_yield_product_api[local.environment_stage]
}
