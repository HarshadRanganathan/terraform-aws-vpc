namespace = "aws"

public_dedicated_network_acl      = true
private_dedicated_network_acl     = true

create_database_subnet_group      = false

enable_dns_hostnames              = true
enable_dns_support                = true

# enable_classiclink              = true
# enable_classiclink_dns_support  = true

enable_nat_gateway                = true
single_nat_gateway                = true

# enable_vpn_gateway = true

enable_dhcp_options              = true
# dhcp_options_domain_name         = "service.consul"
# dhcp_options_domain_name_servers = ["127.0.0.1", "10.10.0.2"]

# VPC endpoint for S3
enable_s3_endpoint = true

# VPC endpoint for DynamoDB
enable_dynamodb_endpoint = true

# VPC endpoint for SSM
enable_ssm_endpoint              = true
ssm_endpoint_private_dns_enabled = true
# ssm_endpoint_security_group_ids  = [data.aws_security_group.default.id]

# VPC endpoint for SSMMESSAGES
enable_ssmmessages_endpoint              = true
ssmmessages_endpoint_private_dns_enabled = true


# VPC Endpoint for EC2
enable_ec2_endpoint              = false
ec2_endpoint_private_dns_enabled = false


# VPC Endpoint for EC2MESSAGES
enable_ec2messages_endpoint              = false
ec2messages_endpoint_private_dns_enabled = false


# VPC Endpoint for ECR API
enable_ecr_api_endpoint              = true
ecr_api_endpoint_private_dns_enabled = true


# VPC Endpoint for ECR DKR
enable_ecr_dkr_endpoint              = true
ecr_dkr_endpoint_private_dns_enabled = true


# VPC endpoint for KMS
enable_kms_endpoint              = true
kms_endpoint_private_dns_enabled = true


# VPC endpoint for ECS
enable_ecs_endpoint              = false
ecs_endpoint_private_dns_enabled = false


# VPC endpoint for ECS telemetry
enable_ecs_telemetry_endpoint              = false
ecs_telemetry_endpoint_private_dns_enabled = false


# VPC endpoint for SQS
enable_sqs_endpoint              = false
sqs_endpoint_private_dns_enabled = false

# VPC endpoint for cassandra
enable_cassandra_endpoint              = true
cassandra_endpoint_private_dns_enabled = true

vpc_endpoint_tags = {
  Project  = "aws"
  Endpoint = "true"
}

igw_tags = {
  "Name" = "aws-internet-gateway"
}
