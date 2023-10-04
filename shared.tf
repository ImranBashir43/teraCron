data "terraform_remote_state" "shared" {
  backend   = "s3"
  workspace = terraform.workspace
  config = {
    bucket = local.environment.shared_bucket
    key    = "shared.tfstate"
    region = local.environment.aws_region
  }
}

data "terraform_remote_state" "cluster" {
  backend   = "s3"
  workspace = terraform.workspace
  config = {
    bucket = local.environment.shared_bucket
    key    = "common/cluster.tfstate"
    region = local.environment.aws_region
  }
}

data "terraform_remote_state" "iam_role" {
  backend   = "s3"
  workspace = terraform.workspace
  config = {
    bucket = local.environment.shared_bucket
    key    = "iam-role/terraform.tfstate"
    region = local.environment.aws_region
  }
}

data "terraform_remote_state" "kms" {
  backend   = "s3"
  workspace = terraform.workspace
  config = {
    bucket = local.environment.shared_bucket
    key    = "kms/terraform.tfstate"
    region = local.environment.aws_region
  }
}

data "aws_caller_identity" "this" {}
