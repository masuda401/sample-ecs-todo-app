terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "3.75.1"
    }
  }
}

resource "aws_guardduty_detector" "main" {
  enable = true
}