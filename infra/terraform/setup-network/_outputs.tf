# ==================================================================
# OUTPUTS - AWS
# ==================================================================

output "aws_account_id" {
  description = "Selected AWS Account ID"
  value       = local.aws_account_id
}

output "aws_region" {
  description = "Details about selected AWS region"
  value       = data.aws_region.current.name
}
