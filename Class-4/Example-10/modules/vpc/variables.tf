variable cidr_block {
  type        = string
  description = "CIDR Range for VPC"
}

variable vpc_tags {
  type        = map
  default     = {
    Name = "MyVPC"
  }
  description = "VPC Tags"
}

variable ig_tags {
  type        = map
  default     = {
    Name = "MyIG"
  }
  description = "Internet Gateway Tags"
}

variable subnet1_cidr_block {
  type        = string
  description = "CIDR Range for Subnet1"
}

variable subnet1_az {
  type        = string
  description = "Subnet1 AZ"
}

variable subnet1_tags {
  type        = map
  default     = {
    Name = "Subnet1"
  }
  description = "Subnet1 Tags"
}

variable subnet2_cidr_block {
  type        = string
  description = "CIDR Range for Subnet2"
}

variable subnet2_az {
  type        = string
  description = "Subnet2 AZ"
}

variable subnet2_tags {
  type        = map
  default     = {
    Name = "Subnet2"
  }
  description = "Subnet2 Tags"
}

variable subnet3_cidr_block {
  type        = string
  description = "CIDR Range for Subnet3"
}

variable subnet3_az {
  type        = string
  description = "Subnet3 AZ"
}

variable subnet3_tags {
  type        = map
  default     = {
    Name = "Subnet3"
  }
  description = "Subnet3 Tags"
}
