provider "aws" {
  region                      = "us-east-1"
  access_key                  = "test"
  secret_key                  = "test"
  skip_credentials_validation = true
  skip_metadata_api_check     = true
  skip_requesting_account_id  = true
  s3_use_path_style           = true

  endpoints {
    s3  = "http://localhost:4566"
    iam = "http://localhost:4566"
    sts = "http://localhost:4566"
  }
}


resource "aws_s3_bucket" "it_backups" {
  bucket = "my-it-support-backups"
}


resource "aws_s3_bucket_versioning" "versioning_example" {
  bucket = aws_s3_bucket.it_backups.id
  versioning_configuration {
    status = "Enabled"
  }
}


resource "aws_iam_user" "intern_user" {
  name = "it-intern"
}


resource "aws_iam_policy" "s3_read_only" {
  name        = "S3ReadOnlyPolicy"
  description = "Allows only viewing buckets, no deletion"

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action   = ["s3:Get*", "s3:List*"]
        Effect   = "Allow"
        Resource = "*"
      }
    ]
  })
}


resource "aws_iam_user_policy_attachment" "attach_readonly" {
  user       = aws_iam_user.intern_user.name
  policy_arn = aws_iam_policy.s3_read_only.arn
}


output "new_iam_user" {
  value = aws_iam_user.intern_user.name
}