module "accessanalyzer_virginia" {
  source = "../../modules/accessanalyzer"

  providers = {
    aws = aws.us-east-1
  }
}

module "accessanalyzer_ohio" {
  source = "../../modules/accessanalyzer"

  providers = {
    aws = aws.us-east-2
  }
}

module "accessanalyzer_california" {
  source = "../../modules/accessanalyzer"

  providers = {
    aws = aws.us-west-1
  }
}

module "accessanalyzer_oregon" {
  source = "../../modules/accessanalyzer"

  providers = {
    aws = aws.us-west-2
  }
}

module "accessanalyzer_mumbai" {
  source = "../../modules/accessanalyzer"

  providers = {
    aws = aws.ap-south-1
  }
}

module "accessanalyzer_tokyo" {
  source = "../../modules/accessanalyzer"

  providers = {
    aws = aws.ap-northeast-1
  }
}

module "accessanalyzer_seoul" {
  source = "../../modules/accessanalyzer"

  providers = {
    aws = aws.ap-northeast-2
  }
}

module "accessanalyzer_osaka" {
  source = "../../modules/accessanalyzer"

  providers = {
    aws = aws.ap-northeast-3
  }
}

module "accessanalyzer_singapore" {
  source = "../../modules/accessanalyzer"

  providers = {
    aws = aws.ap-southeast-1
  }
}

module "accessanalyzer_sydney" {
  source = "../../modules/accessanalyzer"

  providers = {
    aws = aws.ap-southeast-2
  }
}

module "accessanalyzer_central" {
  source = "../../modules/accessanalyzer"

  providers = {
    aws = aws.ca-central-1
  }
}

module "accessanalyzer_frankfurt" {
  source = "../../modules/accessanalyzer"

  providers = {
    aws = aws.eu-central-1
  }
}

module "accessanalyzer_ireland" {
  source = "../../modules/accessanalyzer"

  providers = {
    aws = aws.eu-west-1
  }
}

module "accessanalyzer_london" {
  source = "../../modules/accessanalyzer"

  providers = {
    aws = aws.eu-west-2
  }
}

module "accessanalyzer_paris" {
  source = "../../modules/accessanalyzer"

  providers = {
    aws = aws.eu-west-3
  }
}

module "accessanalyzer_stockholm" {
  source = "../../modules/accessanalyzer"

  providers = {
    aws = aws.eu-north-1
  }
}

module "accessanalyzer_saopaulo" {
  source = "../../modules/accessanalyzer"

  providers = {
    aws = aws.sa-east-1
  }
}
