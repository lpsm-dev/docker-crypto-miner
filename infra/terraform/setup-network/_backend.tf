# Generated by Terragrunt. Sig: nIlQXj57tbuaRZEa
terraform {
  backend "s3" {
    bucket         = ""
    dynamodb_table = ""
    encrypt        = true
    key            = "projects/docker-crypto-miner/setup-network/terraform.tfstate"
    region         = "us-east-1"
  }
}
