# Provider pre-configured for LocalStack — no AWS account needed.
# Students just write resources in main.tf and run terraform commands.

provider "aws" {
  region                      = "us-east-1"
  access_key                  = "test"
  secret_key                  = "test"
  skip_credentials_validation = true
  skip_metadata_api_check     = true
  skip_requesting_account_id  = true

  endpoints {
    s3  = "http://localstack:4566"
    iam = "http://localstack:4566"
    sts = "http://localstack:4566"
  }
}
