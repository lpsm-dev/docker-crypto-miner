/**
 * Configure your Terraform variables
 */
variable "aws_region" {
  type        = string
  description = "AWS Region name"
  default     = "us-east-1"
}

variable "aws_profile" {
  type        = string
  description = "AWS Profile name"
  default     = "aws"
}

variable "environment" {
  type        = string
  description = "A name that identifies the environment (e.g. `production`, `devops`, `develop`), will used as prefix and for tagging"
  default     = "develop"
}

variable "tags" {
  type        = map(string)
  description = "General tags values"
  default     = {}
}
