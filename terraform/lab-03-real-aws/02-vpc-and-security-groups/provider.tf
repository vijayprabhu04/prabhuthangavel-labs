# Provider configured for real AWS.
# Run 'aws configure' first to set up your credentials.

provider "aws" {
  region = var.aws_region
}

variable "aws_region" {
  description = "AWS region"
  type        = string
  default     = "us-east-1"
}
