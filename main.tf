resource "aws_vpc" "gu_vpc" {
  cidr_block           = var.vpc_cidr
  enable_dns_support   = true
  enable_dns_hostnames = true
  tags = {
    Name = "${var.prefix}VPCGU"
  }
}

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.gu_vpc.id
  tags = {
    Name = "${var.prefix}VPCGU-IGW"
  }
}

resource "aws_subnet" "public" {
  count                   = 2
  vpc_id                  = aws_vpc.gu_vpc.id
  cidr_block              = cidrsubnet(var.vpc_cidr, 5, count.index)
  availability_zone       = element(["${var.region}a", "${var.region}b"], count.index)
  map_public_ip_on_launch = true
  tags = {
    Name = "${var.prefix}VPCGU-UE2SUPU0${count.index + 1}"
  }
}

resource "aws_subnet" "private" {
  count             = 6
  vpc_id            = aws_vpc.gu_vpc.id
  cidr_block        = cidrsubnet(var.vpc_cidr, 5, count.index + 2)
  availability_zone = element(["${var.region}a", "${var.region}b", "${var.region}c"], count.index % 3)
  tags = {
    Name = "${var.prefix}VPCGU-UE2SUPR0${count.index + 1}"
  }
}

resource "aws_route_table" "public" {
  vpc_id = aws_vpc.gu_vpc.id
  tags = {
    Name = "${var.prefix}VPCGU-UE2RTAB01"
  }

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }
}

resource "aws_route_table_association" "public" {
  count          = 2
  subnet_id      = aws_subnet.public[count.index].id
  route_table_id = aws_route_table.public.id
}

resource "aws_route_table" "private" {
  count  = 3
  vpc_id = aws_vpc.gu_vpc.id
  tags = {
    Name = "${var.prefix}VPCGU-UE2RTAB0${count.index + 2}"
  }
}

resource "aws_route_table_association" "private" {
  count          = 6
  subnet_id      = aws_subnet.private[count.index].id
  route_table_id = aws_route_table.private[floor(count.index / 2)].id
}
