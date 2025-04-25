terraform {
  backend "s3" {
    key = "temp-infra-s3/terraform.tfstate"
    region = "ap-northeast-1"
  }
}