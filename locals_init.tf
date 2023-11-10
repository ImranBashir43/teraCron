locals {
  environment_stage = terraform.workspace
  environment       = var.environments[local.environment_stage]
  mandatory_tags = {
    Environment = local.environment_stage
    App         = "exchange"
    Terraform   = "true"
    Github      = "IaaC"
  }
}
