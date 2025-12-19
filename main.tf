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
    dynamodb = "http://localhost:4566"
    ec2 = "http://localhost:4566"
    cloudwatch = "http://localhost:4566"
    logs = "http://localhost:4566"
  }
}


resource "aws_vpc" "it_support_vpc" {
  cidr_block = "10.0.0.0/16"
  tags = { Name = "IT-Support-VPC" }
}


resource "aws_subnet" "support_subnet" {
  vpc_id     = aws_vpc.it_support_vpc.id
  cidr_block = "10.0.1.0/24"
}


resource "aws_security_group" "db_sg" {
  name        = "database-access"
  vpc_id      = aws_vpc.it_support_vpc.id

  ingress {
    from_port   = 5432
    to_port     = 5432
    protocol    = "tcp"
    cidr_blocks = ["10.0.0.0/16"]
  }
}


resource "aws_dynamodb_table" "it_logs" {
  name           = "ITSupportLogs"
  billing_mode   = "PAY_PER_REQUEST"
  hash_key       = "LogID"

  attribute {
    name = "LogID"
    type = "S" 
  }

  tags = {
    Environment = "Dev"
    Project     = "IT-Automation"
  }
}


resource "aws_cloudwatch_log_group" "it_support_logs" {
  name              = "/aws/it-support/system-logs"
  retention_in_days = 7
}


resource "aws_cloudwatch_metric_alarm" "database_health" {
  alarm_name          = "High-Error-Rate"
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = "1"
  metric_name         = "Errors"
  namespace           = "AWS/DynamoDB"
  period              = "60"
  statistic           = "Sum"
  threshold           = "5"
  alarm_description   = "This alarm monitors DynamoDB errors"
}