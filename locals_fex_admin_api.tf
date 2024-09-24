data "aws_ssm_parameter" "ssm_fex_admin_api" {
  name = "/${local.environment_stage}/general/fex-admin-api/REPOSITORY_URL"
}

data "aws_secretsmanager_secret_version" "sm_fex_admin_api" {
  secret_id = "${local.environment_stage}-secret-fex-admin-api"
}

data "aws_ssm_parameter" "ssm_fasset-exchange-cron" {
  name = "/${local.environment_stage}/general/fasset-exchange-cron/REPOSITORY_URL"
}
locals {
  dynamic_schedulers_fex_admin_api = {
    dev = {
      CoinLiquidityHistoryCron = {
        cron_expressions = "cron(0 0/1 * * ? *)"
        payload = {
          url    = data.aws_ssm_parameter.ssm_fex_admin_api.value
          path   = "/api/v1/admin/dashboard/coinLiquidityHistoryCron/${jsondecode(data.aws_secretsmanager_secret_version.sm_fex_admin_api.secret_string)["DEPOSIT_EXPIRY_SECRET"]}" 
          method = "GET"
        }
      }
      
      CoinLiquidityAlertsCron = {
        cron_expressions = "cron(0 0/6 * * ? *)"
        payload = {
          url    = data.aws_ssm_parameter.ssm_fex_admin_api.value
          path   = "/api/v1/admin/dashboard/coinLiquidityAlertsCron/${jsondecode(data.aws_secretsmanager_secret_version.sm_fex_admin_api.secret_string)["DEPOSIT_EXPIRY_SECRET"]}"
          method = "GET"
        }
      }
    
      DepositsLimitCheck = {
        cron_expressions = "cron(0 */6 * * ? *)"
        payload = {
          url    = data.aws_ssm_parameter.ssm_fex_admin_api.value
          path   = "/api/v1/admin/depositsApprovalLimitCheck/${jsondecode(data.aws_secretsmanager_secret_version.sm_fex_admin_api.secret_string)["DEPOSIT_EXPIRY_SECRET"]}"
          method = "GET"
        }
      }
      
      ExpireDeposits = {
        cron_expressions = "cron(0 0 * * ? *)"
        payload = {
          url    = data.aws_ssm_parameter.ssm_fex_admin_api.value
          path   = "/api/v1/admin/expireDeposits/${jsondecode(data.aws_secretsmanager_secret_version.sm_fex_admin_api.secret_string)["DEPOSIT_EXPIRY_SECRET"]}"
          method = "GET"
        }
      }
      
      ReferenceCommissionCalculation = {
        cron_expressions = "cron(0 0 * * ? *)"
        payload = {
          url    = data.aws_ssm_parameter.ssm_fex_admin_api.value
          path   = "/api/v1/admin/referenceCommision/${jsondecode(data.aws_secretsmanager_secret_version.sm_fex_admin_api.secret_string)["DEPOSIT_EXPIRY_SECRET"]}"
          method = "GET"
        }
      }
      
      TradeAnalysisperDay = {
        cron_expressions = "cron(0 0 * * ? *)"
        payload = {
          url    = data.aws_ssm_parameter.ssm_fex_admin_api.value
          path   = "/api/v1/admin/tradeAnalysisPerDay?secret=${jsondecode(data.aws_secretsmanager_secret_version.sm_fex_admin_api.secret_string)["TRADEANALYSIS_SECRET"]}"
          method = "GET"
        }
      }
      
      ExpireCardDeposits = {
        cron_expressions = "cron(0 * * * ? *)"
        payload = {
          url    = data.aws_ssm_parameter.ssm_fex_admin_api.value
          path   = "/api/v1/admin/expireCardDeposits/${jsondecode(data.aws_secretsmanager_secret_version.sm_fex_admin_api.secret_string)["DEPOSIT_EXPIRY_SECRET"]}"
          method = "GET"
        }
      }
      
      CurrencyRateUpdate = {
        cron_expressions = "cron(0 0 * * ? *)"
        payload = {
          url    = data.aws_ssm_parameter.ssm_fex_admin_api.value
          path   = "/api/v1/admin/updateCurrenciesRate/${jsondecode(data.aws_secretsmanager_secret_version.sm_fex_admin_api.secret_string)["DEPOSIT_EXPIRY_SECRET"]}"
          method = "GET"
        }
      }

      cacheBinanceMarketInfo = {
        cron_expressions = "cron(*/5 * * * ? *)"
        payload = {
          url    = data.aws_ssm_parameter.ssm_fasset-exchange-cron.value
          path   = "/api/v1/cron/cacheBinanceMarketInfo"
          method = "GET"
        }
      }

      cacheBinanceTickerInfo = {
        cron_expressions = "cron(0/1 * * * ? *)"
        payload = {
          url    = data.aws_ssm_parameter.ssm_fasset-exchange-cron.value
          path   = "/api/v1/cron/cacheBinanceTickerInfo"
          method = "GET"
        }
      }
      
    }

    stg = {
    
      CoinLiquidityHistoryCron = {
        cron_expressions = "cron(0 0/1 * * ? *)"
        payload = {
          url    = data.aws_ssm_parameter.ssm_fex_admin_api.value
          path   = "/api/v1/admin/dashboard/coinLiquidityHistoryCron/${jsondecode(data.aws_secretsmanager_secret_version.sm_fex_admin_api.secret_string)["DEPOSIT_EXPIRY_SECRET"]}"
          method = "GET"
        }
      }
      
      CoinLiquidityAlertsCron = {
        cron_expressions = "cron(0 0/6 * * ? *)"
        payload = {
          url    = data.aws_ssm_parameter.ssm_fex_admin_api.value
          path   = "/api/v1/admin/dashboard/coinLiquidityAlertsCron/${jsondecode(data.aws_secretsmanager_secret_version.sm_fex_admin_api.secret_string)["DEPOSIT_EXPIRY_SECRET"]}"
          method = "GET"
        }
      }
    
      DepositsLimitCheck = {
        cron_expressions = "cron(0 */6 * * ? *)"
        payload = {
          url    = data.aws_ssm_parameter.ssm_fex_admin_api.value
          path   = "/api/v1/admin/depositsApprovalLimitCheck/${jsondecode(data.aws_secretsmanager_secret_version.sm_fex_admin_api.secret_string)["DEPOSIT_EXPIRY_SECRET"]}"
          method = "GET"
        }
      }
      
      ExpireDeposits = {
        cron_expressions = "cron(0 0 * * ? *)"
        payload = {
          url    = data.aws_ssm_parameter.ssm_fex_admin_api.value
          path   = "/api/v1/admin/expireDeposits/${jsondecode(data.aws_secretsmanager_secret_version.sm_fex_admin_api.secret_string)["DEPOSIT_EXPIRY_SECRET"]}"
          method = "GET"
        }
      }
      
      ReferenceCommissionCalculation = {
        cron_expressions = "cron(0 0 * * ? *)"
        payload = {
          url    = data.aws_ssm_parameter.ssm_fex_admin_api.value
          path   = "/api/v1/admin/referenceCommision/${jsondecode(data.aws_secretsmanager_secret_version.sm_fex_admin_api.secret_string)["DEPOSIT_EXPIRY_SECRET"]}"
          method = "GET"
        }
      }
      
      TradeAnalysisperDay = {
        cron_expressions = "cron(0 0 * * ? *)"
        payload = {
          url    = data.aws_ssm_parameter.ssm_fex_admin_api.value
          path   = "/api/v1/admin/tradeAnalysisPerDay?secret=${jsondecode(data.aws_secretsmanager_secret_version.sm_fex_admin_api.secret_string)["TRADEANALYSIS_SECRET"]}"
          method = "GET"
        }
      }
      
      ExpireCardDeposits = {
        cron_expressions = "cron(0 * * * ? *)"
        payload = {
          url    = data.aws_ssm_parameter.ssm_fex_admin_api.value
          path   = "/api/v1/admin/expireCardDeposits/${jsondecode(data.aws_secretsmanager_secret_version.sm_fex_admin_api.secret_string)["DEPOSIT_EXPIRY_SECRET"]}"
          method = "GET"
        }
      }
      
      CurrencyRateUpdate = {
        cron_expressions = "cron(0 0 * * ? *)"
        payload = {
          url    = data.aws_ssm_parameter.ssm_fex_admin_api.value
          path   = "/api/v1/admin/updateCurrenciesRate/${jsondecode(data.aws_secretsmanager_secret_version.sm_fex_admin_api.secret_string)["DEPOSIT_EXPIRY_SECRET"]}"
          method = "GET"
        }
      }

      cacheBinanceMarketInfo = {
        cron_expressions = "cron(*/5 * * * ? *)"
        payload = {
          url    = data.aws_ssm_parameter.ssm_fasset-exchange-cron.value
          path   = "/api/v1/cron/cacheBinanceMarketInfo"
          method = "GET"
        }
      }

      cacheBinanceTickerInfo = {
        cron_expressions = "cron(0/1 * * * ? *)"
        payload = {
          url    = data.aws_ssm_parameter.ssm_fasset-exchange-cron.value
          path   = "/api/v1/cron/cacheBinanceTickerInfo"
          method = "GET"
        }
      }
    
    }

    prod = {

      CoinLiquidityHistoryCron = {
        cron_expressions = "cron(0 0/1 * * ? *)"
        payload = {
          url    = data.aws_ssm_parameter.ssm_fex_admin_api.value
          path   = "/api/v1/admin/dashboard/coinLiquidityHistoryCron/${jsondecode(data.aws_secretsmanager_secret_version.sm_fex_admin_api.secret_string)["DEPOSIT_EXPIRY_SECRET"]}"
          method = "GET"
        }
      }
      
      CoinLiquidityAlertsCron = {
        cron_expressions = "cron(0 0/6 * * ? *)"
        payload = {
          url    = data.aws_ssm_parameter.ssm_fex_admin_api.value
          path   = "/api/v1/admin/dashboard/coinLiquidityAlertsCron/${jsondecode(data.aws_secretsmanager_secret_version.sm_fex_admin_api.secret_string)["DEPOSIT_EXPIRY_SECRET"]}"
          method = "GET"
        }
      }
    
      DepositsLimitCheck = {
        cron_expressions = "cron(0 */6 * * ? *)"
        payload = {
          url    = data.aws_ssm_parameter.ssm_fex_admin_api.value
          path   = "/api/v1/admin/depositsApprovalLimitCheck/${jsondecode(data.aws_secretsmanager_secret_version.sm_fex_admin_api.secret_string)["DEPOSIT_EXPIRY_SECRET"]}"
          method = "GET"
        }
      }
      
      ExpireDeposits = {
        cron_expressions = "cron(0 0 * * ? *)"
        payload = {
          url    = data.aws_ssm_parameter.ssm_fex_admin_api.value
          path   = "/api/v1/admin/expireDeposits/${jsondecode(data.aws_secretsmanager_secret_version.sm_fex_admin_api.secret_string)["DEPOSIT_EXPIRY_SECRET"]}"
          method = "GET"
        }
      }
      
      ReferenceCommissionCalculation = {
        cron_expressions = "cron(0 0 * * ? *)"
        payload = {
          url    = data.aws_ssm_parameter.ssm_fex_admin_api.value
          path   = "/api/v1/admin/referenceCommision/${jsondecode(data.aws_secretsmanager_secret_version.sm_fex_admin_api.secret_string)["DEPOSIT_EXPIRY_SECRET"]}"
          method = "GET"
        }
      }
      
      TradeAnalysisperDay = {
        cron_expressions = "cron(0 0 * * ? *)"
        payload = {
          url    = data.aws_ssm_parameter.ssm_fex_admin_api.value
          path   = "/api/v1/admin/tradeAnalysisPerDay?secret=${jsondecode(data.aws_secretsmanager_secret_version.sm_fex_admin_api.secret_string)["TRADEANALYSIS_SECRET"]}"
          method = "GET"
        }
      }
      
      ExpireCardDeposits = {
        cron_expressions = "cron(0 * * * ? *)"
        payload = {
          url    = data.aws_ssm_parameter.ssm_fex_admin_api.value
          path   = "/api/v1/admin/expireCardDeposits/${jsondecode(data.aws_secretsmanager_secret_version.sm_fex_admin_api.secret_string)["DEPOSIT_EXPIRY_SECRET"]}"
          method = "GET"
        }
      }
      
      CurrencyRateUpdate = {
        cron_expressions = "cron(0 0 * * ? *)"
        payload = {
          url    = data.aws_ssm_parameter.ssm_fex_admin_api.value
          path   = "/api/v1/admin/updateCurrenciesRate/${jsondecode(data.aws_secretsmanager_secret_version.sm_fex_admin_api.secret_string)["DEPOSIT_EXPIRY_SECRET"]}"
          method = "GET"
        }
      }

      cacheBinanceMarketInfo = {
        cron_expressions = "cron(*/5 * * * ? *)"
        payload = {
          url    = data.aws_ssm_parameter.ssm_fasset-exchange-cron.value
          path   = "/api/v1/cron/cacheBinanceMarketInfo"
          method = "GET"
        }
      }

      cacheBinanceTickerInfo = {
        cron_expressions = "cron(0/1 * * * ? *)"
        payload = {
          url    = data.aws_ssm_parameter.ssm_fasset-exchange-cron.value
          path   = "/api/v1/cron/cacheBinanceTickerInfo"
          method = "GET"
        }
      }
    
    }
  }
  schedulers_fex_admin_api        = local.dynamic_schedulers_fex_admin_api[local.environment_stage]
}
