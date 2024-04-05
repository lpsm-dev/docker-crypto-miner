locals {
  # ==================================================================
  # GENERAL
  # ==================================================================
  client_name = "lpsm-dev"
  # ==================================================================
  # AWS GENERAL
  # ==================================================================
  aws_account_id              = data.aws_caller_identity.current.account_id
  aws_default_tags = {
    cost_allocation_business_unit  = "lpsm-dev"
    cost_allocation_product        = "lpsm-dev"
    operation_support_account_name = "${local.client_name}-${local.aws_environment}-services"
    operation_support_criticality  = "low"
    operation_support_environment  = local.aws_environment
    operation_support_team         = "cloud"
    source_code                    = "https://github.com/lpsm-dev/docker-crypto-miner"
    source_project                 = "setup-ec2"
  }
  aws_environment = "develop"
  aws_region      = "us-east-1"
}
