terraform {
  backend "s3" {
    bucket = "terraform-settings"
    key    = "global/terraform.tfstate"
    region = "ap-northeast-1"
  }

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "3.75.1"
    }
  }
}

data "aws_caller_identity" "current" {}


# S3
module "s3" {
  source = "../../modules/s3"
  account_id = data.aws_caller_identity.current.account_id
}

# CloudTrail
module "cloudtrail" {
  source = "../../modules/cloudtrail"

  bucket = module.s3.bucket
  account_id = data.aws_caller_identity.current.account_id

#  prefix = local.default_prefix
#  region = "ap-northeast-1"
}
