
  name = "aws-prod-vpc"
  stage = "prod"

  cidr = "10.0.0.0/16" # 10.1.0.0/8 is reserved for EC2-Classic

  azs                 = ["us-east-1a", "us-east-1b", "us-east-1c"]
  private_subnets     = ["10.0.0.0/20", "10.0.16.0/20", "10.0.32.0/20"]
  public_subnets      = ["10.0.48.0/20", "10.0.64.0/20", "10.0.80.0/20"]
  database_subnets    = ["10.0.96.0/22", "10.0.100.0/22", "10.0.104.0/22"]
  elasticache_subnets = ["10.0.108.0/22", "10.0.112.0/22", "10.0.116.0/22"]
  redshift_subnets    = ["10.0.120.0/22", "10.0.124.0/22", "10.0.128.0/22"]
  intra_subnets       = ["10.0.132.0/22", "10.0.136.0/22", "10.0.140.0/22"]

  tags = {
    Owner       = "aws"
    Name        = "aws"
    Stage       = "prod"
  }

  vpc_tags = {
    "Name"    = "aws-prod-vpc"
    "team"    = "aws"
    "ManagedBy" = "Managed by Terraform"
  }

# The usage of the specific kubernetes.io/cluster/* resource tags below are required
# for EKS and Kubernetes to discover and manage networking resources
# https://www.terraform.io/docs/providers/aws/guides/eks-getting-started.html#base-vpc-networking
  public_subnet_tags_us_east_1 = {
    "Name"                                      = "public-us-east-1"
    "team"                                      = "aws"
    "ManagedBy"                                 = "Managed by Terraform"
    "kubernetes.io/cluster/prod-eks-cluster"    = "shared"
    "kubernetes.io/role/elb"                    = "1"
  }

# The usage of the specific kubernetes.io/cluster/* resource tags below are required
# for EKS and Kubernetes to discover and manage networking resources
# https://www.terraform.io/docs/providers/aws/guides/eks-getting-started.html#base-vpc-networking
  private_subnet_tags_us_east_1 = {
    "Name"                                      = "private-us-east-1"
    "team"                                      = "aws"
    "ManagedBy"                                 = "Managed by Terraform"
    "kubernetes.io/cluster/prod-eks-cluster"    = "shared"
    "kubernetes.io/role/internal-elb"           = "1"
  }

sagemaker_notebook_endpoint_region = "us-east-1"

# VPC Endpoint for CloudWatch Logs
enable_logs_endpoint                    = true
logs_endpoint_private_dns_enabled       = true

# VPC Endpoint for Sagemaker Notebooks
enable_sagemaker_notebook_endpoint              = true
sagemaker_notebook_endpoint_private_dns_enabled = true

# VPC Endpoint for SageMaker API
enable_sagemaker_api_endpoint                   = true
sagemaker_api_endpoint_private_dns_enabled      = true

# VPC Endpoint for SageMaker Runtime
enable_sagemaker_runtime_endpoint               = true
sagemaker_runtime_endpoint_private_dns_enabled  = true

# VPC Endpoint for Service Catalog
enable_servicecatalog_endpoint                  = true
servicecatalog_endpoint_private_dns_enabled     = true
