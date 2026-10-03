terraform {
  backend "s3" {
    bucket = "terraform-practice-bucket-2025"
    key    = "dev/terraform.tfstate"
    region = "us-east-1"
  }
}