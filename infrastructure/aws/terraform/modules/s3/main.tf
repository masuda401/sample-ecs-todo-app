#resource "aws_kms_key" "s3" {
#  description             = "kms-key-for-S3-bucket"
#  deletion_window_in_days = 10
#  enable_key_rotation     = true
#}

resource "aws_s3_bucket" "security_logs" {
  bucket = "aws-security-audit-logs"
}

resource "aws_s3_bucket_acl" "security_logs" {
  bucket = aws_s3_bucket.security_logs.id
  acl    = "private"
}

resource "aws_s3_bucket_versioning" "security_logs" {
  bucket = aws_s3_bucket.security_logs.id

  versioning_configuration {
    status = "Enabled"
  }
}

#resource "aws_s3_bucket_server_side_encryption_configuration" "security_logs" {
#  bucket = aws_s3_bucket.security_logs.bucket
#
#  rule {
#    apply_server_side_encryption_by_default {
#      kms_master_key_id = aws_kms_key.s3.arn
#      sse_algorithm = "aws:kms"
#    }
#  }
#}

resource "aws_s3_bucket_public_access_block" "security_logs" {
  bucket = aws_s3_bucket.security_logs.id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}

# CloudTrailのみアクセス許可
resource "aws_s3_bucket_policy" "security_logs" {
  bucket = aws_s3_bucket.security_logs.id
  policy = templatefile("${path.module}/bucket_policy.json", {
    BucketName = aws_s3_bucket.security_logs.bucket
    AccountID   = var.account_id
  })
}