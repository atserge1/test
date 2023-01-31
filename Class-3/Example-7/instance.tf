resource "aws_key_pair" "bastion_key" {
  key_name   = "bastion-key"
  public_key = file("~/.ssh/id_rsa.pub")
}

resource "aws_instance" "myinstance1" {
  ami             = "ami-0b5eea76982371e91"
  instance_type   = "t2.micro"
  security_groups = ["ssh-sg", "http-sg"]

  provisioner "remote-exec" {
    connection {
      type        = "ssh"
      user        = "ec2-user"
      private_key = file("~/.ssh/id_rsa")
      host        = self.public_ip
    }
    inline = [
      "sudo yum install httpd -y",
      "sudo systemctl start httpd",
      "sudo systemctl enable httpd",
      "echo \"Hello, world\" > /var/www/html/index.html"
    ]
  }

  key_name = "bastion-key"
}




