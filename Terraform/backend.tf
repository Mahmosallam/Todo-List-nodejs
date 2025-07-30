terraform {
  backend "s3" {
    bucket         = "backend-tf-test-bucket-sallam"
    key            = "global/s3/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "terraform-lock"
  }
}