data "aws_secretsmanager_secret_version" "sm_cash_app_api" {
  secret_id = "${local.environment_stage}-secret-cash-app-api"
}

data "aws_ssm_parameter" "ssm_cash_app_api" {
  name = "/${local.environment_stage}/general/cash-app-api/REPOSITORY_URL"
}

locals {
  risk_score_alerts_schedular = {
    dev = {
      riskScoringReminderAlerts = {
        cron_expressions = "cron(0 0 * * ? *)"
        payload = {
          url    = data.aws_ssm_parameter.ssm_cash_app_api.value
          path   = "/api/v1/users/riskScoringReminderAlerts"  
          method = "POST"
          header = {
            token = jsondecode(data.aws_secretsmanager_secret_version.sm_cash_app_api.secret_string)["AWS_RISK_SCORE_CALC_SECRETS"]
          }
        }
      }

      riskScoringReminderAlertsTest = {
        cron_expressions = "rate(10 minutes)"
        payload = {
          url    = data.aws_ssm_parameter.ssm_cash_app_api.value
          path   = "/api/v1/users/riskScoringReminderAlerts"  
          method = "POST"
          header = {
            token = jsondecode(data.aws_secretsmanager_secret_version.sm_cash_app_api.secret_string)["AWS_RISK_SCORE_CALC_SECRETS"]
          }
        }
      }
    }

    stg = {
      riskScoringReminderAlerts = {
        cron_expressions = "cron(0 0 * * ? *)"
        payload = {
          url    = data.aws_ssm_parameter.ssm_cash_app_api.value
          path   = "/api/v1/users/riskScoringReminderAlerts"
          method = "POST"
          header = {
            token = jsondecode(data.aws_secretsmanager_secret_version.sm_cash_app_api.secret_string)["AWS_RISK_SCORE_CALC_SECRETS"]
          }
        }
      }
      
       riskScoringReminderAlertsTest = {
        cron_expressions = "rate(10 minutes)"
        payload = {
          url    = data.aws_ssm_parameter.ssm_cash_app_api.value
          path   = "/api/v1/users/riskScoringReminderAlerts"  
          method = "POST"
          header = {
            token = jsondecode(data.aws_secretsmanager_secret_version.sm_cash_app_api.secret_string)["AWS_RISK_SCORE_CALC_SECRETS"]
          }
        }
      }
    }

    prod = {
      riskScoringReminderAlerts = {
        cron_expressions = "cron(0 0 * * ? *)"
        payload = {
          url    = data.aws_ssm_parameter.ssm_cash_app_api.value
          path   = "/api/v1/users/riskScoringReminderAlerts"
          method = "POST"
          header = {
            token = jsondecode(data.aws_secretsmanager_secret_version.sm_cash_app_api.secret_string)["AWS_RISK_SCORE_CALC_SECRETS"]
          }
        }
      }
    }
  }

  scheduler_risk_scoring_alerts  = local.risk_score_alerts_schedular[local.environment_stage]
}
