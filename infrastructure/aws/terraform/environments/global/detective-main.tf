module "detective_virginia" {
  source = "../../modules/detective"

  providers = {
    aws = aws.us-east-1
  }
}

module "detective_ohio" {
  source = "../../modules/detective"

  providers = {
    aws = aws.us-east-2
  }
}

module "detective_california" {
  source = "../../modules/detective"

  providers = {
    aws = aws.us-west-1
  }
}

module "detective_oregon" {
  source = "../../modules/detective"

  providers = {
    aws = aws.us-west-2
  }
}

module "detective_mumbai" {
  source = "../../modules/detective"

  providers = {
    aws = aws.ap-south-1
  }
}

module "detective_tokyo" {
  source = "../../modules/detective"

  providers = {
    aws = aws.ap-northeast-1
  }
}

module "detective_seoul" {
  source = "../../modules/detective"

  providers = {
    aws = aws.ap-northeast-2
  }
}

#module "detective_osaka" {
#  source = "../../modules/detective"
#
#  providers = {
#    aws = aws.ap-northeast-3
#  }
#}

module "detective_singapore" {
  source = "../../modules/detective"

  providers = {
    aws = aws.ap-southeast-1
  }
}

module "detective_sydney" {
  source = "../../modules/detective"

  providers = {
    aws = aws.ap-southeast-2
  }
}

module "detective_central" {
  source = "../../modules/detective"

  providers = {
    aws = aws.ca-central-1
  }
}

module "detective_frankfurt" {
  source = "../../modules/detective"

  providers = {
    aws = aws.eu-central-1
  }
}

module "detective_ireland" {
  source = "../../modules/detective"

  providers = {
    aws = aws.eu-west-1
  }
}

module "detective_london" {
  source = "../../modules/detective"

  providers = {
    aws = aws.eu-west-2
  }
}

module "detective_paris" {
  source = "../../modules/detective"

  providers = {
    aws = aws.eu-west-3
  }
}

module "detective_stockholm" {
  source = "../../modules/detective"

  providers = {
    aws = aws.eu-north-1
  }
}

module "detective_saopaulo" {
  source = "../../modules/detective"

  providers = {
    aws = aws.sa-east-1
  }
}
