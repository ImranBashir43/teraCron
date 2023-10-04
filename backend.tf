terraform {
  backend "s3" {
    key = "exchange/api-cron-scheduler.tfstate"
  }
}