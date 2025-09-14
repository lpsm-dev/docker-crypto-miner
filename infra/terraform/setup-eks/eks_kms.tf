# ==================================================================
# MODULE AWS KMS - EKS
# ==================================================================

module "kms_eks" {
  source  = "terraform-aws-modules/kms/aws"
  version = "~> 4.0"

  description             = "Setup KMS ${local.aws_eks.cluster_name} cluster encryption key"
  deletion_window_in_days = 7
  enable_key_rotation     = true
  enable_default_policy   = false
  key_administrators = [
    module.eks.cluster_iam_role_arn
  ]
  key_users = [
    module.eks.cluster_iam_role_arn
  ]
  aliases = ["eks/${local.aws_eks.cluster_name}"]
}
