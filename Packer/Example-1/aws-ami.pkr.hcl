packer {
  required_plugins {
    amazon = {
      version = ">= 1.1.1"
      source  = "github.com/hashicorp/amazon"
    }
  }
}

source "amazon-ebs" "basic-example" {
  region        = "us-east-1"
  source_ami    = "ami-0aa7d40eeae50c9a9"
  instance_type = "t2.micro"
  ssh_username  = "ec2-user"
  ami_name      = "myami_{{timestamp}}"
}

build {
  sources = ["source.amazon-ebs.basic-example"]
  provisioner "shell" {
    inline = [
      "sudo yum install httpd -y",
      "sudo systemctl start httpd",
      "sudo systemctl enable httpd",
      "hostname | sudo tee /var/www/html/index.html"
    ]
  }
}








