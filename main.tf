resource "aws_security_group" "vpce_security_group" {
  name        = format("%s-%s-vpce", var.namespace, var.stage)
  description = "Allows to communicate with vpce interface endpoints"
  vpc_id      = module.vpc.vpc_id
  tags        = var.tags
}

resource "aws_security_group_rule" "ingress_self" {
  description              = "Self Ingress"
  from_port                = 0
  to_port                  = 65535
  protocol                 = "-1"
  security_group_id        = aws_security_group.vpce_security_group.id
  source_security_group_id = aws_security_group.vpce_security_group.id
  type                     = "ingress"
}

resource "aws_security_group_rule" "ingress_vpc" {
  description       = "VPC CIDR"
  from_port         = 0
  to_port           = 65535
  protocol          = "-1"
  security_group_id = aws_security_group.vpce_security_group.id
  cidr_blocks       = [module.vpc.vpc_cidr_block]
  type              = "ingress"
}


module "vpc" {
  source          = "git::https://github.com/terraform-aws-modules/terraform-aws-vpc.git//module?ref=2.70.0"
  cidr            = var.cidr
  azs             = var.azs
  private_subnets = var.private_subnets
  public_subnets  = var.public_subnets

  enable_dns_hostnames = var.enable_dns_hostnames
  enable_dns_support   = var.enable_dns_support

  enable_nat_gateway = var.enable_nat_gateway
  single_nat_gateway = var.single_nat_gateway

  # Public NACL
  # True or Fasle to enable dedicated public NACL
  public_dedicated_network_acl = var.public_dedicated_network_acl

  # Public NACL inbound and outbound rules
  public_inbound_acl_rules = concat(
    local.network_acls.default_inbound,
    local.network_acls.public_inbound,
  )

  public_outbound_acl_rules = concat(
    local.network_acls.default_outbound,
    local.network_acls.public_outbound,
  )

  # Private NACL
  # True or Fasle to enable dedicated private NACL
  private_dedicated_network_acl = var.private_dedicated_network_acl

  # Private NACL inbound and outbound rules
  private_inbound_acl_rules = concat(
    local.network_acls["default_inbound"],
    local.network_acls["private_inbound"],
  )
  private_outbound_acl_rules = concat(
    local.network_acls["default_outbound"],
    local.network_acls["private_outbound"],
  )
  # VPC endpoint for S3
  enable_s3_endpoint = var.enable_s3_endpoint

  # VPC endpoint for DynamoDB
  enable_dynamodb_endpoint = var.enable_dynamodb_endpoint

  # VPC endpoint for SSM
  enable_ssm_endpoint              = var.enable_ssm_endpoint
  ssm_endpoint_private_dns_enabled = var.ssm_endpoint_private_dns_enabled
  ssm_endpoint_security_group_ids  = [aws_security_group.vpce_security_group.id]

  # VPC endpoint for SSMMESSAGES
  enable_ssmmessages_endpoint              = var.enable_ssmmessages_endpoint
  ssmmessages_endpoint_private_dns_enabled = var.ssmmessages_endpoint_private_dns_enabled
  ssmmessages_endpoint_security_group_ids  = [aws_security_group.vpce_security_group.id]

  # VPC Endpoint for EC2
  enable_ec2_endpoint              = var.enable_ec2_endpoint
  ec2_endpoint_private_dns_enabled = var.ec2_endpoint_private_dns_enabled
  ec2_endpoint_security_group_ids  = [aws_security_group.vpce_security_group.id]

  # VPC Endpoint for EC2MESSAGES
  enable_ec2messages_endpoint              = var.enable_ec2messages_endpoint
  ec2messages_endpoint_private_dns_enabled = var.ec2messages_endpoint_private_dns_enabled
  ec2messages_endpoint_security_group_ids  = [aws_security_group.vpce_security_group.id]

  # VPC Endpoint for ECR API
  enable_ecr_api_endpoint              = var.enable_ecr_api_endpoint
  ecr_api_endpoint_private_dns_enabled = var.ecr_api_endpoint_private_dns_enabled
  ecr_api_endpoint_security_group_ids  = [aws_security_group.vpce_security_group.id]

  # VPC Endpoint for ECR DKR
  enable_ecr_dkr_endpoint              = var.enable_ecr_dkr_endpoint
  ecr_dkr_endpoint_private_dns_enabled = var.ecr_dkr_endpoint_private_dns_enabled
  ecr_dkr_endpoint_security_group_ids  = [aws_security_group.vpce_security_group.id]

  # VPC endpoint for KMS
  enable_kms_endpoint              = var.enable_kms_endpoint
  kms_endpoint_private_dns_enabled = var.kms_endpoint_private_dns_enabled
  kms_endpoint_security_group_ids  = [aws_security_group.vpce_security_group.id]

  # VPC endpoint for ECS

  ecs_endpoint_security_group_ids = [aws_security_group.vpce_security_group.id]

  # VPC endpoint for ECS telemetry

  ecs_telemetry_endpoint_security_group_ids = [aws_security_group.vpce_security_group.id]

  # VPC endpoint for SQS

  sqs_endpoint_security_group_ids = [aws_security_group.vpce_security_group.id]

  # VPC endpoint for Athena

  enable_athena_endpoint              = var.enable_athena_endpoint
  athena_endpoint_private_dns_enabled = var.athena_endpoint_private_dns_enabled
  athena_endpoint_security_group_ids  = [aws_security_group.vpce_security_group.id]

  # VPC endpoint for glue

  enable_glue_endpoint              = var.enable_glue_endpoint
  glue_endpoint_private_dns_enabled = var.glue_endpoint_private_dns_enabled
  glue_endpoint_security_group_ids  = var.glue_endpoint_security_group_ids

  # VPC endpoint for cassandra

  enable_cassandra_endpoint              = var.enable_cassandra_endpoint
  cassandra_endpoint_private_dns_enabled = var.cassandra_endpoint_private_dns_enabled
  cassandra_endpoint_security_group_ids  = [aws_security_group.vpce_security_group.id]


  tags = var.tags

  vpc_tags = var.vpc_tags
  igw_tags = var.igw_tags

  public_subnet_tags = var.public_subnet_tags_us_east_1

  private_subnet_tags = var.private_subnet_tags_us_east_1
}


