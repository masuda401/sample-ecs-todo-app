module "guardduty_virginia" {
  source = "../../modules/guardduty"

  providers = {
    aws = aws.us-east-1
  }
}

module "guardduty_ohio" {
  source = "../../modules/guardduty"

  providers = {
    aws = aws.us-east-2
  }
}

module "guardduty_california" {
  source = "../../modules/guardduty"

  providers = {
    aws = aws.us-west-1
  }
}

module "guardduty_oregon" {
  source = "../../modules/guardduty"

  providers = {
    aws = aws.us-west-2
  }
}

module "guardduty_mumbai" {
  source = "../../modules/guardduty"

  providers = {
    aws = aws.ap-south-1
  }
}

module "guardduty_tokyo" {
  source = "../../modules/guardduty"

  providers = {
    aws = aws.ap-northeast-1
  }
}

module "guardduty_seoul" {
  source = "../../modules/guardduty"

  providers = {
    aws = aws.ap-northeast-2
  }
}

module "guardduty_osaka" {
  source = "../../modules/guardduty"

  providers = {
    aws = aws.ap-northeast-3
  }
}

module "guardduty_singapore" {
  source = "../../modules/guardduty"

  providers = {
    aws = aws.ap-southeast-1
  }
}

module "guardduty_sydney" {
  source = "../../modules/guardduty"

  providers = {
    aws = aws.ap-southeast-2
  }
}

module "guardduty_central" {
  source = "../../modules/guardduty"

  providers = {
    aws = aws.ca-central-1
  }
}

module "guardduty_frankfurt" {
  source = "../../modules/guardduty"

  providers = {
    aws = aws.eu-central-1
  }
}

module "guardduty_ireland" {
  source = "../../modules/guardduty"

  providers = {
    aws = aws.eu-west-1
  }
}

module "guardduty_london" {
  source = "../../modules/guardduty"

  providers = {
    aws = aws.eu-west-2
  }
}

module "guardduty_paris" {
  source = "../../modules/guardduty"

  providers = {
    aws = aws.eu-west-3
  }
}

module "guardduty_stockholm" {
  source = "../../modules/guardduty"

  providers = {
    aws = aws.eu-north-1
  }
}

module "guardduty_saopaulo" {
  source = "../../modules/guardduty"

  providers = {
    aws = aws.sa-east-1
  }
}
