terraform {
  backend "s3" {
    bucket = "sample-ecs-todo-app-settings"
    key    = "terraform/prod/terraform.tfstate"
    region = "ap-northeast-1"
  }

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "3.75.1"
    }
  }
}
