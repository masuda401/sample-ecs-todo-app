resource "aws_kms_key" "cloudtrail" {
  description             = "kms-key-for-cloudtrail"
  deletion_window_in_days = 10
  policy                  = data.aws_iam_policy_document.cloudtrail.json
  enable_key_rotation     = true
}

data "aws_iam_policy_document" "cloudtrail" {
  // Enable IAM User Permissions
  statement {
    actions = [
      "kms:*",
    ]
    principals {
      identifiers = [
        "arn:aws:iam::${var.account_id}:root",
      ]
      type = "AWS"
    }
    resources = [
      "*",
    ]
  }

  // Allow CloudTrail to encrypt logs
  statement {
    actions = [
      "kms:GenerateDataKey*",
    ]
    condition {
      test = "StringLike"
      values = [
        "arn:aws:cloudtrail:*:${var.account_id}:trail/*",
      ]
      variable = "kms:EncryptionContext:aws:cloudtrail:arn"
    }
    principals {
      identifiers = [
        "cloudtrail.amazonaws.com",
      ]
      type = "Service"
    }
    resources = [
      "*",
    ]
  }

  // Allow CloudTrail to describe key
  statement {
    actions = [
      "kms:DescribeKey",
    ]
    principals {
      identifiers = [
        "cloudtrail.amazonaws.com",
      ]
      type = "Service"
    }
    resources = [
      "*",
    ]
  }

  statement {
    actions = [
      "kms:*",
    ]
    principals {
      type = "AWS"
      identifiers = [
        "arn:aws:iam::${var.account_id}:user/admin",
      ]
    }
    resources = [
      "*",
    ]
  }
}

resource "aws_cloudtrail" "main" {
  name                          = "cloudtrail-${var.account_id}"
  s3_bucket_name                = var.bucket.id
  include_global_service_events = true
  is_multi_region_trail         = true
  kms_key_id                    = aws_kms_key.cloudtrail.arn
}
