variable "aws_region" {
  type        = string
  description = "AWS Region name"
  default     = "eu-central-1"
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

variable "aws_instance_ami" {
  type = map(any)
  default = {
    eu-central-1 = "ami-0caef02b518350c8b"
  }
}

variable "aws_instance_type" {
  type = string
}

variable "aws_instance_count" {
  type    = string
  default = "2"
}
