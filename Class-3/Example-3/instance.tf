resource "aws_key_pair" "bastion_key" {
  key_name   = "bastion-key"
  public_key = file("~/.ssh/id_rsa.pub")

  tags = merge( var.common_tags, {
    Name = "bastion-key"
  })
}

resource "aws_instance" "myinstance" {
  ami           = "ami-0b5eea76982371e91"
  instance_type = "t2.micro"

  # Implicit Dependency
  key_name = aws_key_pair.bastion_key.key_name

  # Explicit Dependency
  depends_on = [aws_key_pair.bastion_key, aws_db_instance.default]

  tags = merge( var.common_tags, {
    Name = "web1"
  })
}
