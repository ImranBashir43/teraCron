data "aws_ssm_parameter" "ssm_fex_admin_api" {
  name = "/${local.environment_stage}/general/fex-admin-api/REPOSITORY_URL"
}

locals {
  dynamic_schedulers_fex_admin_api = {
    dev = {
      DepositsLimitCheck = {
        cron_expressions = "cron(0 */6 * * ? *)"
        payload = {
          url    = data.aws_ssm_parameter.ssm_fex_admin_api.value
          path   = "/api/v1/admin/depositsApprovalLimitCheck/gBGVGvMJWDjPnf9rkYtUP3nVFnCDKYef"
          method = "GET"
        }
      }
      
      ExpireDeposits = {
        cron_expressions = "cron(0 0 * * ? *)"
        payload = {
          url    = data.aws_ssm_parameter.ssm_fex_admin_api.value
          path   = "/api/v1/admin/expireDeposits/gBGVGvMJWDjPnf9rkYtUP3nVFnCDKYef"
          method = "GET"
        }
      }
      
      ReferenceCommissionCalculation = {
        cron_expressions = "cron(0 0 * * ? *)"
        payload = {
          url    = data.aws_ssm_parameter.ssm_fex_admin_api.value
          path   = "/api/v1/admin/referenceCommision/gBGVGvMJWDjPnf9rkYtUP3nVFnCDKYef"
          method = "GET"
        }
      }
      
      TradeAnalysisperDay = {
        cron_expressions = "cron(0 0 * * ? *)"
        payload = {
          url    = data.aws_ssm_parameter.ssm_fex_admin_api.value
          path   = "/api/v1/admin/tradeAnalysisPerDay?secret=afHkhhDZhZ62xQyfDNrHXnd4t2AD4v5D"
          method = "GET"
        }
      }
      
      CoinAvailabilityCheck = {
        cron_expressions = "cron(0/5 * * * ? *)"
        payload = {
          url    = data.aws_ssm_parameter.ssm_fex_admin_api.value
          path   = "/api/v1/admin/dashboard/coinAvailabilityCheck?secret=gBGVGvMJWDjPnf9rkYtUP3nVFnCDKYef"
          method = "GET"
        }
      }
      
      ExpireCardDeposits = {
        cron_expressions = "cron(0/60 * * * ? *)"
        payload = {
          url    = data.aws_ssm_parameter.ssm_fex_admin_api.value
          path   = "/api/v1/admin/expireCardDeposits/gBGVGvMJWDjPnf9rkYtUP3nVFnCDKYef"
          method = "GET"
        }
      }
      
      CurrencyRateUpdate = {
        cron_expressions = "cron(0 0 * * ? *)"
        payload = {
          url    = data.aws_ssm_parameter.ssm_fex_admin_api.value
          path   = "/api/v1/admin/updateCurrenciesRate/gBGVGvMJWDjPnf9rkYtUP3nVFnCDKYef"
          method = "GET"
        }
      }
      
    }

    stg = {
    
      DepositsLimitCheck = {
        cron_expressions = "cron(0 */6 * * ? *)"
        payload = {
          url    = data.aws_ssm_parameter.ssm_fex_admin_api.value
          path   = "/api/v1/admin/depositsApprovalLimitCheck/gBGVGvMJWDjPnf9rkYtUP3nVFnCDKYef"
          method = "GET"
        }
      }
      
      ExpireDeposits = {
        cron_expressions = "cron(0 0 * * ? *)"
        payload = {
          url    = data.aws_ssm_parameter.ssm_fex_admin_api.value
          path   = "/api/v1/admin/expireDeposits/gBGVGvMJWDjPnf9rkYtUP3nVFnCDKYef"
          method = "GET"
        }
      }
      
      ReferenceCommissionCalculation = {
        cron_expressions = "cron(0 0 * * ? *)"
        payload = {
          url    = data.aws_ssm_parameter.ssm_fex_admin_api.value
          path   = "/api/v1/admin/referenceCommision/gBGVGvMJWDjPnf9rkYtUP3nVFnCDKYef"
          method = "GET"
        }
      }
      
      TradeAnalysisperDay = {
        cron_expressions = "cron(0 0 * * ? *)"
        payload = {
          url    = data.aws_ssm_parameter.ssm_fex_admin_api.value
          path   = "/api/v1/admin/tradeAnalysisPerDay?secret=afHkhhDZhZ62xQyfDNrHXnd4t2AD4v5D"
          method = "GET"
        }
      }
      
      CoinAvailabilityCheck = {
        cron_expressions = "cron(0/5 * * * ? *)"
        payload = {
          url    = data.aws_ssm_parameter.ssm_fex_admin_api.value
          path   = "/api/v1/admin/dashboard/coinAvailabilityCheck?secret=gBGVGvMJWDjPnf9rkYtUP3nVFnCDKYef"
          method = "GET"
        }
      }
      
      ExpireCardDeposits = {
        cron_expressions = "cron(0/60 * * * ? *)"
        payload = {
          url    = data.aws_ssm_parameter.ssm_fex_admin_api.value
          path   = "/api/v1/admin/expireCardDeposits/gBGVGvMJWDjPnf9rkYtUP3nVFnCDKYef"
          method = "GET"
        }
      }
      
      CurrencyRateUpdate = {
        cron_expressions = "cron(0 0 * * ? *)"
        payload = {
          url    = data.aws_ssm_parameter.ssm_fex_admin_api.value
          path   = "/api/v1/admin/updateCurrenciesRate/gBGVGvMJWDjPnf9rkYtUP3nVFnCDKYef"
          method = "GET"
        }
      }
    
    }

    prod = {
    
      DepositsLimitCheck = {
        cron_expressions = "cron(0 */6 * * ? *)"
        payload = {
          url    = data.aws_ssm_parameter.ssm_fex_admin_api.value
          path   = "/api/v1/admin/depositsApprovalLimitCheck/gBGVGvMJWDjPnf9rkYtUP3nVFnCDKYef"
          method = "GET"
        }
      }
      
      ExpireDeposits = {
        cron_expressions = "cron(0 0 * * ? *)"
        payload = {
          url    = data.aws_ssm_parameter.ssm_fex_admin_api.value
          path   = "/api/v1/admin/expireDeposits/gBGVGvMJWDjPnf9rkYtUP3nVFnCDKYef"
          method = "GET"
        }
      }
      
      ReferenceCommissionCalculation = {
        cron_expressions = "cron(0 0 * * ? *)"
        payload = {
          url    = data.aws_ssm_parameter.ssm_fex_admin_api.value
          path   = "/api/v1/admin/referenceCommision/gBGVGvMJWDjPnf9rkYtUP3nVFnCDKYef"
          method = "GET"
        }
      }
      
      TradeAnalysisperDay = {
        cron_expressions = "cron(0 0 * * ? *)"
        payload = {
          url    = data.aws_ssm_parameter.ssm_fex_admin_api.value
          path   = "/api/v1/admin/tradeAnalysisPerDay?secret=afHkhhDZhZ62xQyfDNrHXnd4t2AD4v5D"
          method = "GET"
        }
      }
      
      CoinAvailabilityCheck = {
        cron_expressions = "cron(0/5 * * * ? *)"
        payload = {
          url    = data.aws_ssm_parameter.ssm_fex_admin_api.value
          path   = "/api/v1/admin/dashboard/coinAvailabilityCheck?secret=gBGVGvMJWDjPnf9rkYtUP3nVFnCDKYef"
          method = "GET"
        }
      }
      
      ExpireCardDeposits = {
        cron_expressions = "cron(0/60 * * * ? *)"
        payload = {
          url    = data.aws_ssm_parameter.ssm_fex_admin_api.value
          path   = "/api/v1/admin/expireCardDeposits/gBGVGvMJWDjPnf9rkYtUP3nVFnCDKYef"
          method = "GET"
        }
      }
      
      CurrencyRateUpdate = {
        cron_expressions = "cron(0 0 * * ? *)"
        payload = {
          url    = data.aws_ssm_parameter.ssm_fex_admin_api.value
          path   = "/api/v1/admin/updateCurrenciesRate/gBGVGvMJWDjPnf9rkYtUP3nVFnCDKYef"
          method = "GET"
        }
      }
    
    }
  }
  schedulers_fex_admin_api        = local.dynamic_schedulers_fex_admin_api[local.environment_stage]
}
