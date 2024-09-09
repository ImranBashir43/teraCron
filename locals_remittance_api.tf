data "aws_secretsmanager_secret_version" "sm_remittance_api" {
  secret_id = "${local.environment_stage}-secret-remittance-api"
}

data "aws_ssm_parameter" "ssm_remittance_api" {
  name = "/${local.environment_stage}/general/remittance-api/REPOSITORY_URL"
}

locals {
  dynamic_schedulers_remittance_api = {

    dev = {
      updateTransactionStatusCron = {
        cron_expressions = "cron(0 * * * *)"
        payload = {
          url    = data.aws_ssm_parameter.ssm_remittance_api.value
          path   = "/api/v1/remittance/updateTransactionsStatusCron"
          method = "GET"
          header = {
            x-api-key = jsondecode(data.aws_secretsmanager_secret_version.sm_remittance_api.secret_string)["REMITTANCE_API_KEY"]
          }
        }
      }
    }

    # stg = {
    #   updateTransactionStatusCron = {
    #     cron_expressions = "cron(0 * * * *)"
    #     payload = {
    #       url    = data.aws_ssm_parameter.ssm_remittance_api.value
    #       path   = "/api/v1/remittance/updateTransactionsStatusCron"
    #       method = "GET"
    #       header = {
    #         x-api-key = jsondecode(data.aws_secretsmanager_secret_version.sm_remittance_api.secret_string)["REMITTANCE_API_KEY"]
    #       }
    #     }
    #   }
    # }

    # prod = {
    #   updateTransactionStatusCron = {
    #     cron_expressions = "cron(0 * * * *)"
    #     payload = {
    #       url    = data.aws_ssm_parameter.ssm_remittance_api.value
    #       path   = "/api/v1/remittance/updateTransactionsStatusCron"
    #       method = "GET"
    #       header = {
    #         x-api-key = jsondecode(data.aws_secretsmanager_secret_version.sm_remittance_api.secret_string)["REMITTANCE_API_KEY"]
    #       }
    #     }
    #   }
    # }

  }

  schedulers_remittance_api  = local.dynamic_schedulers_remittance_api[local.environment_stage]
}
