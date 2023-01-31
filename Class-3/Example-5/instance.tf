data "aws_subnet" "mysubnet" {
  availability_zone = "us-east-1c"
}

resource "aws_key_pair" "bastion_key" {
  key_name   = "bastion-key"
  public_key = file("~/.ssh/id_rsa.pub")
}

resource "aws_instance" "myinstance1" {
  ami           = "ami-0b5eea76982371e91"
  instance_type = "t2.micro"
  subnet_id = data.aws_subnet.mysubnet.id

  key_name = "bastion-key"
}

