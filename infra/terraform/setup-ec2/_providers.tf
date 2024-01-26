/**
 * Configure AWS provider
 */
provider "aws" {
  region  = var.aws_region
  profile = var.aws_profile

  # Common tags for all resources that accept tags
  default_tags {
    tags = var.tags
  }
}
