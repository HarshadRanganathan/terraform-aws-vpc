locals {
  network_acls = {
    # Default Inbound
    default_inbound = [
      {
        rule_number = 100
        rule_action = "allow"
        from_port   = -1
        protocol    = "all"
        to_port     = -1
        cidr_block  = "0.0.0.0/0"
      },
    ]

    # Outbound (Egress traffic)
    default_outbound = [
      {
        rule_number = 100
        rule_action = "allow"
        from_port   = -1
        protocol    = "all"
        to_port     = -1
        cidr_block  = "0.0.0.0/0"
      },
    ]


    ## Public Inbound ( Ingress Traffic)
    public_inbound = [
      {
        rule_number = 100
        rule_action = "allow"
        from_port   = -1
        protocol    = "all"
        to_port     = -1
        cidr_block  = "0.0.0.0/0"
    }, ]

    # Public Outbound
    public_outbound = [
      {
        rule_number = 100
        rule_action = "allow"
        from_port   = -1
        protocol    = "all"
        to_port     = -1
        cidr_block  = "0.0.0.0/0"
    }, ]

    ## Private Inbound
    private_inbound = [
      {
        rule_number = 100
        rule_action = "allow"
        from_port   = -1
        protocol    = "all"
        to_port     = -1
        cidr_block  = "0.0.0.0/0"
    }, ]

    # Private Outbound
    private_outbound = [
      {
        rule_number = 100
        rule_action = "allow"
        from_port   = -1
        protocol    = "all"
        to_port     = -1
        cidr_block  = "0.0.0.0/0"
    }, ]
  }
}
