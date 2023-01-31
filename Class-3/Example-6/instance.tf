resource "aws_key_pair" "bastion_key" {
  key_name   = "bastion-key"
  public_key = file("~/.ssh/id_rsa.pub")
}

resource "aws_instance" "myinstance1" {
  ami             = "ami-0b5eea76982371e91"
  instance_type   = "t2.micro"
  security_groups = ["ssh-sg", "http-sg"]

  user_data = <<-EOF
    #!/bin/bash
    yum install httpd -y
    service httpd start
    chkconfig httpd on
    echo "Hello, world" > /var/www/html/index.html
    EOF

  key_name = "bastion-key"
}




