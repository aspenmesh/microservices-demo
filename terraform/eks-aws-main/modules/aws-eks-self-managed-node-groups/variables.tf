variable "self_managed_ng" {
  description = "Map of maps of `eks_self_managed_node_groups` to create"
  type        = any
  default     = {}
}

variable "context" {
  type = object({
    # EKS Cluster Config
    eks_cluster_id    = string
    cluster_ca_base64 = string
    cluster_endpoint  = string
    cluster_version   = string
    # VPC Config
    vpc_id             = string
    private_subnet_ids = list(string)
    public_subnet_ids  = list(string)
    # Security Groups
    worker_security_group_ids = list(string)
    # Http config
    http_endpoint               = string
    http_tokens                 = string
    http_put_response_hop_limit = number
    # Data sources
    aws_partition_dns_suffix = string
    aws_partition_id         = string

    iam_role_path                 = string
    iam_role_permissions_boundary = string
    # Tags
    tags = map(string)
    # Service IPV4/IPV6 CIDR
    service_ipv6_cidr = string
    service_ipv4_cidr = string
  })
  description = "Input configuration for the Node groups"
}