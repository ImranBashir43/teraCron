resource "aws_scheduler_schedule" "cron" {
  for_each   = local.schedulers
  name       = "${local.environment_stage}_${each.key}"
  group_name = "default"

  flexible_time_window {
    mode                      = "OFF"
  }

  schedule_expression          = each.value.cron_expressions
  schedule_expression_timezone = "Asia/Jakarta"

  target {
    arn      = "arn:aws:lambda:ap-southeast-3:${data.aws_caller_identity.this.account_id}:function:${local.environment_stage}-cron-api-call"
    role_arn = "arn:aws:iam::${data.aws_caller_identity.this.account_id}:role/${local.environment_stage}-ECSTaskExecutionRole-role"
    input = jsonencode(each.value.payload)

    retry_policy {
      maximum_retry_attempts = 0
    }
  }
}
