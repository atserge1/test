resource "aws_key_pair" "bastion_key" {
  key_name   = "bastion-key"
  public_key = file("~/.ssh/id_rsa.pub")
}

resource "aws_instance" "myinstance1" {
  ami           = "ami-0b5eea76982371e91"
  instance_type = "t2.micro"
  key_name      = "bastion-key"
  subnet_id     = module.vpc.subnet1_id
}
