# Configure your terraform variables
variable "aws_region" {
  type        = string
  description = "AWS Region"
  default     = "us-east-1"
}

variable "aws_profile" {
  type        = string
  description = "AWS Profile name"
}

variable "environment" {
  type        = string
  description = "The name of environment that you apply our terraform"
  default     = "develop"
}
