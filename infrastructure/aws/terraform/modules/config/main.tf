terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "3.75.1"
    }
  }
}

#resource "aws_iam_role" "config" {
#  name = "config-role"
#
#  assume_role_policy = <<POLICY
#{
#  "Version": "2012-10-17",
#  "Statement": [
#    {
#      "Action": "sts:AssumeRole",
#      "Principal": {
#        "Service": "config.amazonaws.com"
#      },
#      "Effect": "Allow",
#      "Sid": ""
#    }
#  ]
#}
#POLICY
#}
#
#resource "aws_iam_role_policy_attachment" "config" {
#  role       = aws_iam_role.config.name
#  policy_arn = "arn:aws:iam::aws:policy/service-role/AWSConfigRole"
#}
#
#resource "aws_iam_role_policy" "config" {
#  name = "config-role-policy"
#  role = aws_iam_role.config.id
#
#  policy = <<POLICY
#{
#  "Version": "2012-10-17",
#  "Statement": [
#    {
#      "Action": [
#        "s3:*"
#      ],
#      "Effect": "Allow",
#      "Resource": [
#        "${var.bucket.arn}",
#        "${var.bucket.arn}/*"
#      ]
#    }
#  ]
#}
#POLICY
#}

resource "aws_config_delivery_channel" "main" {
  name           = "config-delivery-channel"
  s3_bucket_name = var.bucket.id
}

resource "aws_config_configuration_recorder" "main" {
  name     = "config-configuration-recorder"
  role_arn = var.iam_role.arn

  recording_group {
    all_supported                 = true
    # メインのリージョンでのみグローバルリソースの監視を行う
    include_global_resource_types = var.is_main_region ? true : false
  }
}

resource "aws_config_configuration_recorder_status" "main" {
  name       = aws_config_configuration_recorder.main.name
  is_enabled = true
  depends_on = [aws_config_delivery_channel.main]
}
