resource "aws_securityhub_account" "securityhub_virginia" {
  provider = aws.us-east-1
}

resource "aws_securityhub_account" "securityhub_ohio" {
  provider = aws.us-east-2
}

resource "aws_securityhub_account" "securityhub_california" {
  provider = aws.us-west-1
}

resource "aws_securityhub_account" "securityhub_oregon" {
  provider =  aws.us-west-2
}

resource "aws_securityhub_account" "securityhub_mumbai" {
  provider = aws.ap-south-1
}

resource "aws_securityhub_account" "securityhub_tokyo" {
  provider = aws.ap-northeast-1
}

resource "aws_securityhub_account" "securityhub_seoul" {
  provider = aws.ap-northeast-2
}

resource "aws_securityhub_account" "securityhub_osaka" {
  provider = aws.ap-northeast-3
}

resource "aws_securityhub_account" "securityhub_singapore" {
  provider = aws.ap-southeast-1
}

resource "aws_securityhub_account" "securityhub_sydney" {
  provider = aws.ap-southeast-2
}

resource "aws_securityhub_account" "securityhub_central" {
  provider = aws.ca-central-1
}

resource "aws_securityhub_account" "securityhub_frankfurt" {
  provider = aws.eu-central-1
}

resource "aws_securityhub_account" "securityhub_ireland" {
  provider = aws.eu-west-1
}

resource "aws_securityhub_account" "securityhub_london" {
  provider = aws.eu-west-2
}

resource "aws_securityhub_account" "securityhub_paris" {
  provider = aws.eu-west-3
}

resource "aws_securityhub_account" "securityhub_stockholm" {
  provider = aws.eu-north-1
}

resource "aws_securityhub_account" "securityhub_saopaulo" {
  provider = aws.sa-east-1
}
