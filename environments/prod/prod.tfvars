
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

  public_subnet_tags_us_east_1 = {
    "Name"    = "public-us-east-1"
    "team"    = "aws"
    "ManagedBy" = "Managed by Terraform"
  }

  private_subnet_tags_us_east_1 = {
    "Name"    = "private-us-east-1"
    "team"    = "aws"
    "ManagedBy" = "Managed by Terraform"
  }
