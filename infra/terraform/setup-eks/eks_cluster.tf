# ==================================================================
# MODULE AWS EKS - CLUSTER
# ==================================================================

module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = "~> 20.8"

  // EKS Cluster information
  cluster_name    = local.aws_eks.cluster_name
  cluster_version = local.aws_eks.cluster_version
  enable_irsa     = true

  // Setup Network
  vpc_id                   = data.aws_vpc.selected.id
  subnet_ids               = local.aws_network.subnet_private_ids
  control_plane_subnet_ids = local.aws_network.subnet_publish_ids

  // Setup cluster endpoint
  cluster_endpoint_private_access = true
  cluster_endpoint_public_access  = true

  // Setup Node Security Group
  node_security_group_tags = {
    "kubernetes.io/cluster/${local.aws_eks.cluster_name}" = null
  }
  node_security_group_additional_rules = {
    ingress_self_all = {
      description = "Node to node all ports/protocols"
      protocol    = "-1"
      from_port   = 0
      to_port     = 0
      type        = "ingress"
      self        = true
    },
    ingress_cluster_to_node_all_traffic = {
      description                   = "Cluster API to Nodegroup all traffic"
      protocol                      = "-1"
      from_port                     = 0
      to_port                       = 0
      type                          = "ingress"
      source_cluster_security_group = true
    }
  }

  // EKS Managed Node Group(s)
  eks_managed_node_group_defaults = {
    attach_cluster_primary_security_group = true
    iam_role_attach_cni_policy            = true
    iam_role_additional_policies = {
      AmazonEKSWorkerNodePolicy : "arn:aws:iam::aws:policy/AmazonEKSWorkerNodePolicy",
      AmazonEKS_CNI_Policy : "arn:aws:iam::aws:policy/AmazonEKS_CNI_Policy",
      AmazonEC2ContainerRegistryReadOnly : "arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryReadOnly",
      AmazonSSMManagedInstanceCore : "arn:aws:iam::aws:policy/AmazonSSMManagedInstanceCore"
    }
  }

  // EKS Managed Node Profile(s)
  eks_managed_node_groups = {
    green = {
      name              = "eks-green-worknodes"
      description       = "EKS managed node group for green worknodes"
      min_size          = 3
      max_size          = 3
      desired_size      = 3
      capacity_type     = "SPOT"
      instance_types    = ["t3a.large", "t3a.xlarge"]
      ebs_optimized     = true
      enable_monitoring = true
      block_device_mappings = {
        xvda = {
          device_name = "/dev/xvda"
          ebs = {
            volume_size           = 64
            volume_type           = "gp3"
            iops                  = 3000
            throughput            = 150
            encrypted             = true
            delete_on_termination = true
          }
        }
      }
      update_config = {
        max_unavailable_percentage = 33
      }
      tags = {
        worknodes = "green"
      }
    }
  }

  // Cluster access entry - To add the current caller identity as an administrator
  enable_cluster_creator_admin_permissions = true

  // Enable EKS cluster access logging
  cluster_enabled_log_types              = ["api", "audit", "authenticator"]
  create_cloudwatch_log_group            = true
  cloudwatch_log_group_retention_in_days = 14

  // Setup KMS Key
  create_kms_key = false
  cluster_encryption_config = {
    resources        = ["secrets"]
    provider_key_arn = module.kms_eks.key_arn
  }

  // More tags
  /*tags = {
    "karpenter.sh/discovery" = local.aws_eks.cluster_name
  }*/
}
