resource "aws_iam_role" "config" {
  name = "config-role"

  assume_role_policy = <<POLICY
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": "config.amazonaws.com"
      },
      "Effect": "Allow",
      "Sid": ""
    }
  ]
}
POLICY
}

resource "aws_iam_role_policy_attachment" "config" {
  role       = aws_iam_role.config.name
  policy_arn = "arn:aws:iam::aws:policy/service-role/AWSConfigRole"
}

resource "aws_iam_role_policy" "config" {
  name = "config-role-policy"
  role = aws_iam_role.config.id

  policy = <<POLICY
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": [
        "s3:*"
      ],
      "Effect": "Allow",
      "Resource": [
        "${module.s3.bucket.arn}",
        "${module.s3.bucket.arn}/*"
      ]
    }
  ]
}
POLICY
}

module "config_virginia" {
  source = "../../modules/config"

  bucket = module.s3.bucket
  iam_role = aws_iam_role.config
  is_main_region = false

  providers = {
    aws = aws.us-east-1
  }
}

module "config_ohio" {
  source = "../../modules/config"

  bucket = module.s3.bucket
  iam_role = aws_iam_role.config
  is_main_region = false

  providers = {
    aws = aws.us-east-2
  }
}

module "config_california" {
  source = "../../modules/config"

  bucket = module.s3.bucket
  iam_role = aws_iam_role.config
  is_main_region = false

  providers = {
    aws = aws.us-west-1
  }
}

module "config_oregon" {
  source = "../../modules/config"

  bucket = module.s3.bucket
  iam_role = aws_iam_role.config
  is_main_region = false

  providers = {
    aws = aws.us-west-2
  }
}

module "config_mumbai" {
  source = "../../modules/config"

  bucket = module.s3.bucket
  iam_role = aws_iam_role.config
  is_main_region = false

  providers = {
    aws = aws.ap-south-1
  }
}

module "config_tokyo" {
  source = "../../modules/config"

  bucket = module.s3.bucket
  iam_role = aws_iam_role.config
  is_main_region = true

  providers = {
    aws = aws.ap-northeast-1
  }
}

module "config_seoul" {
  source = "../../modules/config"

  bucket = module.s3.bucket
  iam_role = aws_iam_role.config
  is_main_region = false

  providers = {
    aws = aws.ap-northeast-2
  }
}

module "config_osaka" {
  source = "../../modules/config"

  bucket = module.s3.bucket
  iam_role = aws_iam_role.config
  is_main_region = false

  providers = {
    aws = aws.ap-northeast-3
  }
}

module "config_singapore" {
  source = "../../modules/config"

  bucket = module.s3.bucket
  iam_role = aws_iam_role.config
  is_main_region = false

  providers = {
    aws = aws.ap-southeast-1
  }
}

module "config_sydney" {
  source = "../../modules/config"

  bucket = module.s3.bucket
  iam_role = aws_iam_role.config
  is_main_region = false

  providers = {
    aws = aws.ap-southeast-2
  }
}

module "config_central" {
  source = "../../modules/config"

  bucket = module.s3.bucket
  iam_role = aws_iam_role.config
  is_main_region = false

  providers = {
    aws = aws.ca-central-1
  }
}

module "config_frankfurt" {
  source = "../../modules/config"

  bucket = module.s3.bucket
  iam_role = aws_iam_role.config
  is_main_region = false

  providers = {
    aws = aws.eu-central-1
  }
}

module "config_ireland" {
  source = "../../modules/config"

  bucket = module.s3.bucket
  iam_role = aws_iam_role.config
  is_main_region = false

  providers = {
    aws = aws.eu-west-1
  }
}

module "config_london" {
  source = "../../modules/config"

  bucket = module.s3.bucket
  iam_role = aws_iam_role.config
  is_main_region = false

  providers = {
    aws = aws.eu-west-2
  }
}

module "config_paris" {
  source = "../../modules/config"

  bucket = module.s3.bucket
  iam_role = aws_iam_role.config
  is_main_region = false

  providers = {
    aws = aws.eu-west-3
  }
}

module "config_stockholm" {
  source = "../../modules/config"

  bucket = module.s3.bucket
  iam_role = aws_iam_role.config
  is_main_region = false

  providers = {
    aws = aws.eu-north-1
  }
}

module "config_saopaulo" {
  source = "../../modules/config"

  bucket = module.s3.bucket
  iam_role = aws_iam_role.config
  is_main_region = false

  providers = {
    aws = aws.sa-east-1
  }
}
