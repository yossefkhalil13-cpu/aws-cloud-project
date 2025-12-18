
# Main provider (your infra region)
provider "aws" {
  region = "eu-west-1"
}

# Provider for CloudFront + WAF (must be us-east-1)
provider "aws" {
  alias  = "us_east_1"
  region = "us-east-1"
}
