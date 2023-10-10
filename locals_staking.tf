data "aws_secretsmanager_secret_version" "sm_staking_worker" {
  secret_id = "${local.environment_stage}-secret-staking-worker"
}

data "aws_ssm_parameter" "ssm_staking_worker" {
  name = "/${local.environment_stage}/general/staking-worker/REPOSITORY_URL"
}

locals {
  dynamic_schedulers_staking = {
    dev = {
      reStakeForBrokenQueue = {
        cron_expressions = "rate(2 minutes)"
        payload = {
          url    = data.aws_ssm_parameter.ssm_staking_worker.value
          path   = "/api/v1/crons/reStakeForBrokenQueue"
          method = "POST"
          header = {
            token = jsondecode(data.aws_secretsmanager_secret_version.sm_staking_worker.secret_string)["REPOSITORY_KEY"]
          }
        }
      }
      reUnstakeForBrokenQueue = {
        cron_expressions = "rate(2 minutes)"
        payload = {
          url    = data.aws_ssm_parameter.ssm_staking_worker.value
          path   = "/api/v1/crons/reUnstakeForBrokenQueue"
          method = "POST"
          header = {
            token = jsondecode(data.aws_secretsmanager_secret_version.sm_staking_worker.secret_string)["REPOSITORY_KEY"]
          }
        }
      }
      reStake = {
        cron_expressions = "rate(1 hour)"
        payload = {
          url    = data.aws_ssm_parameter.ssm_staking_worker.value
          path   = "/api/v1/crons/reStake"
          method = "POST"
          header = {
            token = jsondecode(data.aws_secretsmanager_secret_version.sm_staking_worker.secret_string)["REPOSITORY_KEY"]
          }
        }
      }
      updateLockedUpStakesAsCompleted = {
        cron_expressions = "rate(1 hour)"
        payload = {
          url    = data.aws_ssm_parameter.ssm_staking_worker.value
          path   = "/api/v1/crons/updateLockedUpStakesAsCompleted"
          method = "POST"
          header = {
            token = jsondecode(data.aws_secretsmanager_secret_version.sm_staking_worker.secret_string)["REPOSITORY_KEY"]
          }
        }
      }
      calculateDailyReward = {
        cron_expressions = "rate(1 hour)"
        payload = {
          url    = data.aws_ssm_parameter.ssm_staking_worker.value
          path   = "/api/v1/crons/calculateDailyReward"
          method = "POST"
          header = {
            token = jsondecode(data.aws_secretsmanager_secret_version.sm_staking_worker.secret_string)["REPOSITORY_KEY"]
          }
        }
      }
      updateLockedUpToInRedemption = {
        cron_expressions = "rate(1 hour)"
        payload = {
          url    = data.aws_ssm_parameter.ssm_staking_worker.value
          path   = "/api/v1/crons/updateLockedUpToInRedemption"
          method = "POST"
          header = {
            token = jsondecode(data.aws_secretsmanager_secret_version.sm_staking_worker.secret_string)["REPOSITORY_KEY"]
          }
        }
      }
      updateUnstakeInRedemptionToReedemed = {
        cron_expressions = "rate(1 hour)"
        payload = {
          url    = data.aws_ssm_parameter.ssm_staking_worker.value
          path   = "/api/v1/crons/updateUnstakeInRedemptionToReedemed"
          method = "POST"
          header = {
            token = jsondecode(data.aws_secretsmanager_secret_version.sm_staking_worker.secret_string)["REPOSITORY_KEY"]
          }
        }
      }
      withdrawalDeactivatedStakes = {
        cron_expressions = "rate(1 hour)"
        payload = {
          url    = data.aws_ssm_parameter.ssm_staking_worker.value
          path   = "/api/v1/crons/withdrawalDeactivatedStakes"
          method = "POST"
          header = {
            token = jsondecode(data.aws_secretsmanager_secret_version.sm_staking_worker.secret_string)["REPOSITORY_KEY"]
          }
        }
      }
      updateTransactionFee = {
        cron_expressions = "rate(1 hour)"
        payload = {
          url    = data.aws_ssm_parameter.ssm_staking_worker.value
          path   = "/api/v1/crons/updateTransactionFee"
          method = "POST"
          header = {
            token = jsondecode(data.aws_secretsmanager_secret_version.sm_staking_worker.secret_string)["REPOSITORY_KEY"]
          }
        }
      }
    }

    stg = {
      reStakeForBrokenQueue = {
        cron_expressions = "rate(2 minutes)"
        payload = {
          url    = data.aws_ssm_parameter.ssm_staking_worker.value
          path   = "/api/v1/crons/reStakeForBrokenQueue"
          method = "POST"
          header = {
            token = jsondecode(data.aws_secretsmanager_secret_version.sm_staking_worker.secret_string)["REPOSITORY_KEY"]
          }
        }
      }
      reUnstakeForBrokenQueue = {
        cron_expressions = "rate(2 minutes)"
        payload = {
          url    = data.aws_ssm_parameter.ssm_staking_worker.value
          path   = "/api/v1/crons/reUnstakeForBrokenQueue"
          method = "POST"
          header = {
            token = jsondecode(data.aws_secretsmanager_secret_version.sm_staking_worker.secret_string)["REPOSITORY_KEY"]
          }
        }
      }
      reStake = {
        cron_expressions = "rate(1 hour)"
        payload = {
          url    = data.aws_ssm_parameter.ssm_staking_worker.value
          path   = "/api/v1/crons/reStake"
          method = "POST"
          header = {
            token = jsondecode(data.aws_secretsmanager_secret_version.sm_staking_worker.secret_string)["REPOSITORY_KEY"]
          }
        }
      }
      updateLockedUpStakesAsCompleted = {
        cron_expressions = "rate(1 hour)"
        payload = {
          url    = data.aws_ssm_parameter.ssm_staking_worker.value
          path   = "/api/v1/crons/updateLockedUpStakesAsCompleted"
          method = "POST"
          header = {
            token = jsondecode(data.aws_secretsmanager_secret_version.sm_staking_worker.secret_string)["REPOSITORY_KEY"]
          }
        }
      }
      calculateDailyReward = {
        cron_expressions = "rate(1 hour)"
        payload = {
          url    = data.aws_ssm_parameter.ssm_staking_worker.value
          path   = "/api/v1/crons/calculateDailyReward"
          method = "POST"
          header = {
            token = jsondecode(data.aws_secretsmanager_secret_version.sm_staking_worker.secret_string)["REPOSITORY_KEY"]
          }
        }
      }
      updateLockedUpToInRedemption = {
        cron_expressions = "rate(1 hour)"
        payload = {
          url    = data.aws_ssm_parameter.ssm_staking_worker.value
          path   = "/api/v1/crons/updateLockedUpToInRedemption"
          method = "POST"
          header = {
            token = jsondecode(data.aws_secretsmanager_secret_version.sm_staking_worker.secret_string)["REPOSITORY_KEY"]
          }
        }
      }
      updateUnstakeInRedemptionToReedemed = {
        cron_expressions = "rate(1 hour)"
        payload = {
          url    = data.aws_ssm_parameter.ssm_staking_worker.value
          path   = "/api/v1/crons/updateUnstakeInRedemptionToReedemed"
          method = "POST"
          header = {
            token = jsondecode(data.aws_secretsmanager_secret_version.sm_staking_worker.secret_string)["REPOSITORY_KEY"]
          }
        }
      }
      withdrawalDeactivatedStakes = {
        cron_expressions = "rate(1 hour)"
        payload = {
          url    = data.aws_ssm_parameter.ssm_staking_worker.value
          path   = "/api/v1/crons/withdrawalDeactivatedStakes"
          method = "POST"
          header = {
            token = jsondecode(data.aws_secretsmanager_secret_version.sm_staking_worker.secret_string)["REPOSITORY_KEY"]
          }
        }
      }
      updateTransactionFee = {
        cron_expressions = "rate(1 hour)"
        payload = {
          url    = data.aws_ssm_parameter.ssm_staking_worker.value
          path   = "/api/v1/crons/updateTransactionFee"
          method = "POST"
          header = {
            token = jsondecode(data.aws_secretsmanager_secret_version.sm_staking_worker.secret_string)["REPOSITORY_KEY"]
          }
        }
      }
    }

    prod = {
      reStakeForBrokenQueue = {
        cron_expressions = "rate(2 minutes)"
        payload = {
          url    = data.aws_ssm_parameter.ssm_staking_worker.value
          path   = "/api/v1/crons/reStakeForBrokenQueue"
          method = "POST"
          header = {
            token = jsondecode(data.aws_secretsmanager_secret_version.sm_staking_worker.secret_string)["REPOSITORY_KEY"]
          }
        }
      }
      reUnstakeForBrokenQueue = {
        cron_expressions = "rate(2 minutes)"
        payload = {
          url    = data.aws_ssm_parameter.ssm_staking_worker.value
          path   = "/api/v1/crons/reUnstakeForBrokenQueue"
          method = "POST"
          header = {
            token = jsondecode(data.aws_secretsmanager_secret_version.sm_staking_worker.secret_string)["REPOSITORY_KEY"]
          }
        }
      }
      reStake = {
        cron_expressions = "rate(1 hour)"
        payload = {
          url    = data.aws_ssm_parameter.ssm_staking_worker.value
          path   = "/api/v1/crons/reStake"
          method = "POST"
          header = {
            token = jsondecode(data.aws_secretsmanager_secret_version.sm_staking_worker.secret_string)["REPOSITORY_KEY"]
          }
        }
      }
      updateLockedUpStakesAsCompleted = {
        cron_expressions = "rate(1 hour)"
        payload = {
          url    = data.aws_ssm_parameter.ssm_staking_worker.value
          path   = "/api/v1/crons/updateLockedUpStakesAsCompleted"
          method = "POST"
          header = {
            token = jsondecode(data.aws_secretsmanager_secret_version.sm_staking_worker.secret_string)["REPOSITORY_KEY"]
          }
        }
      }
      calculateDailyReward = {
        cron_expressions = "rate(1 hour)"
        payload = {
          url    = data.aws_ssm_parameter.ssm_staking_worker.value
          path   = "/api/v1/crons/calculateDailyReward"
          method = "POST"
          header = {
            token = jsondecode(data.aws_secretsmanager_secret_version.sm_staking_worker.secret_string)["REPOSITORY_KEY"]
          }
        }
      }
      updateLockedUpToInRedemption = {
        cron_expressions = "rate(1 hour)"
        payload = {
          url    = data.aws_ssm_parameter.ssm_staking_worker.value
          path   = "/api/v1/crons/updateLockedUpToInRedemption"
          method = "POST"
          header = {
            token = jsondecode(data.aws_secretsmanager_secret_version.sm_staking_worker.secret_string)["REPOSITORY_KEY"]
          }
        }
      }
      updateUnstakeInRedemptionToReedemed = {
        cron_expressions = "rate(1 hour)"
        payload = {
          url    = data.aws_ssm_parameter.ssm_staking_worker.value
          path   = "/api/v1/crons/updateUnstakeInRedemptionToReedemed"
          method = "POST"
          header = {
            token = jsondecode(data.aws_secretsmanager_secret_version.sm_staking_worker.secret_string)["REPOSITORY_KEY"]
          }
        }
      }
      withdrawalDeactivatedStakes = {
        cron_expressions = "rate(1 hour)"
        payload = {
          url    = data.aws_ssm_parameter.ssm_staking_worker.value
          path   = "/api/v1/crons/withdrawalDeactivatedStakes"
          method = "POST"
          header = {
            token = jsondecode(data.aws_secretsmanager_secret_version.sm_staking_worker.secret_string)["REPOSITORY_KEY"]
          }
        }
      }
      updateTransactionFee = {
        cron_expressions = "rate(1 hour)"
        payload = {
          url    = data.aws_ssm_parameter.ssm_staking_worker.value
          path   = "/api/v1/crons/updateTransactionFee"
          method = "POST"
          header = {
            token = jsondecode(data.aws_secretsmanager_secret_version.sm_staking_worker.secret_string)["REPOSITORY_KEY"]
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
