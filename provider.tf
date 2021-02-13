provider "aws" {
  version = ">= 2.28.1"
  region  = var.region

  // Ignore tags managed by AWS
  ignore_tags {
    key_prefixes = [
      "kubernetes.io/cluster/",
      "kubernetes.io/role/"
    ]
  }
}

provider "random" {
  version = "~> 2.1"
}

provider "local" {
  version = "~> 1.2"
}

provider "null" {
  version = "~> 2.1"
}

provider "template" {
  version = "~> 2.1"
}
