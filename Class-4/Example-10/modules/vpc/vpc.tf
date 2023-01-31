resource "aws_vpc" "main" {
  cidr_block = var.cidr_block

  tags = var.vpc_tags
}

resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.main.id

  tags = var.ig_tags
}

resource "aws_route" "main_route" {
  route_table_id            = aws_vpc.main.default_route_table_id
  destination_cidr_block    = "0.0.0.0/0"
  gateway_id = aws_internet_gateway.gw.id
}

resource "aws_subnet" "subnet1" {
  vpc_id     = aws_vpc.main.id
  cidr_block = var.subnet1_cidr_block
  availability_zone = var.subnet1_az
  map_public_ip_on_launch = true

  tags = var.subnet1_tags
}

resource "aws_subnet" "subnet2" {
  vpc_id     = aws_vpc.main.id
  cidr_block = var.subnet2_cidr_block
  availability_zone = var.subnet2_az
  map_public_ip_on_launch = true

  tags = var.subnet2_tags
}

resource "aws_subnet" "subnet3" {
  vpc_id     = aws_vpc.main.id
  cidr_block = var.subnet3_cidr_block
  availability_zone = var.subnet3_az
  map_public_ip_on_launch = true

  tags = var.subnet3_tags
}

output subnet1_id {
  value       = aws_subnet.subnet1.id
  description = "Subnet1 ID"
}

output subnet2_id {
  value       = aws_subnet.subnet2.id
  description = "Subnet2 ID"
}

output subnet3_id {
  value       = aws_subnet.subnet3.id
  description = "Subnet3 ID"
}

