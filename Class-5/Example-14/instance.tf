resource "aws_instance" "myinstance1" {
  ami           = "ami-00874d747dde814fa"
  instance_type = "t2.micro"

  key_name = aws_key_pair.bastion_key.key_name
}




