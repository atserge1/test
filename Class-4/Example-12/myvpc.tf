module "vpc" {
  source = "ikambarov/module/vpc"

  vpc_cidr     = "10.0.0.0/16"
  subnet1_az   = "us-east-1a"
  subnet1_cidr = "10.0.0.0/24"
  subnet2_az   = "us-east-1b"
  subnet2_cidr = "10.0.1.0/24"
  subnet3_az   = "us-east-1c"
  subnet3_cidr = "10.0.2.0/24"
}