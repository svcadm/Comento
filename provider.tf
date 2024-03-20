provider "aws" {
  region = "ap-northeast-2"

  terraform {
  backend "s3" {
    bucket = "fastcampus-backend"
    key    = "tfstate/fast"
    region = "us-east-1"
  }
}