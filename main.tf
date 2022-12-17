terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
}

# Configure the AWS Provider
provider "aws" {
  region = "us-east-1"
}

data "aws_iam_role" "iam_for_lambda" {
  name = "iam_for_lambda"
}

data "aws_iam_policy" "iam_policy_for_lambda" {
 
  name         = "aws_iam_policy_for_terraform_aws_lambda_role"
}

resource "aws_iam_role_policy_attachment" "attach_iam_policy_to_iam_role" {
 role        = data.aws_iam_role.iam_for_lambda.name
 policy_arn  = data.aws_iam_policy.iam_policy_for_lambda.arn
}

