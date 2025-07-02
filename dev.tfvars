environment          = "dev"
region               = "us-east-2"
aws_profile          = "adogu-dev"
vpc_cidr             = "172.26.97.0/24"
prefix               = "MADOAWSDEV"

public_subnet_cidrs  = ["172.26.97.0/28", "172.26.97.16/28"]
private_subnet_cidrs = [
  "172.26.97.32/28",
  "172.26.97.48/28",
  "172.26.97.64/28",
  "172.26.97.80/28",
  "172.26.97.96/28",
  "172.26.97.112/28"
]

azs = ["us-east-2a", "us-east-2b"]
