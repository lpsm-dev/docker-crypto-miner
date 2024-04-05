# ==================================================================
# PROVIDER - AWS DEFAULT
# ==================================================================

provider "aws" {
  region = local.aws_region
  default_tags {
    tags = {
      "automation:managedby"          = "terraform",
      "cost-allocation:business-unit" = local.aws_default_tags.cost_allocation_business_unit,
      "cost-allocation:product"       = local.aws_default_tags.cost_allocation_product,
      "operation-support:account"     = local.aws_default_tags.operation_support_account_name,
      "operation-support:criticality" = local.aws_default_tags.operation_support_criticality
      "operation-support:environment" = local.aws_default_tags.operation_support_environment,
      "operation-support:team"        = local.aws_default_tags.operation_support_team,
      "source-code"                   = local.aws_default_tags.source_code
      "source-project"                = local.aws_default_tags.source_project
    }
  }
}

# ==================================================================
# PROVIDER - AWS SA-EAST-1
# ==================================================================

provider "aws" {
  region = "sa-east-1"
  alias  = "sa-east-1"
  default_tags {
    tags = {
      "automation:managedby"          = "terraform",
      "cost-allocation:business-unit" = local.aws_default_tags.cost_allocation_business_unit,
      "cost-allocation:product"       = local.aws_default_tags.cost_allocation_product,
      "operation-support:account"     = local.aws_default_tags.operation_support_account_name,
      "operation-support:criticality" = local.aws_default_tags.operation_support_criticality
      "operation-support:environment" = local.aws_default_tags.operation_support_environment,
      "operation-support:team"        = local.aws_default_tags.operation_support_team,
      "source-code"                   = local.aws_default_tags.source_code
      "source-project"                = local.aws_default_tags.source_project
    }
  }
}

# ==================================================================
# PROVIDER - AWS US-EAST-1
# ==================================================================

provider "aws" {
  region = "us-east-1"
  alias  = "us-east-1"
  default_tags {
    tags = {
      "automation:managedby"          = "terraform",
      "cost-allocation:business-unit" = local.aws_default_tags.cost_allocation_business_unit,
      "cost-allocation:product"       = local.aws_default_tags.cost_allocation_product,
      "operation-support:account"     = local.aws_default_tags.operation_support_account_name,
      "operation-support:criticality" = local.aws_default_tags.operation_support_criticality
      "operation-support:environment" = local.aws_default_tags.operation_support_environment,
      "operation-support:team"        = local.aws_default_tags.operation_support_team,
      "source-code"                   = local.aws_default_tags.source_code
      "source-project"                = local.aws_default_tags.source_project
    }
  }
}
