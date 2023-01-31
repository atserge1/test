resource "aws_key_pair" "bastion-key" {
  key_name   = "bastion-key"
  public_key = file("~/.ssh/id_rsa.pub")
}

data "aws_ami" "centos_ami" {
  most_recent = true
  owners      = ["679593333241"]

  filter {
    name   = "name"
    values = ["CentOS-7-2111-20220825_1.x86_64*"]
  }

  filter {
    name   = "root-device-type"
    values = ["ebs"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}

resource "aws_launch_template" "task_lt" {
  name = "task_lt"

  image_id = data.aws_ami.centos_ami.id

  instance_type = "t2.micro"

  key_name = aws_key_pair.bastion-key.key_name

  vpc_security_group_ids = [aws_security_group.ssh_sg.id, aws_security_group.http_sg.id]

  tag_specifications {
    resource_type = "instance"

    tags = var.common_tags
  }

  user_data = filebase64("user_data.sh")
}

resource "aws_autoscaling_group" "task_asg" {
  name                      = "task_asg"
  max_size                  = 5
  min_size                  = 2
  health_check_grace_period = 300
  health_check_type         = "ELB"
  desired_capacity          = 2
  force_delete              = true

  launch_template {
    id      = aws_launch_template.task_lt.id
    version = aws_launch_template.task_lt.latest_version
  }

  target_group_arns = [aws_lb_target_group.tasktg.arn]

  vpc_zone_identifier = [aws_subnet.subnet1.id, aws_subnet.subnet2.id, aws_subnet.subnet3.id]

  tag {
    key                 = "Project"
    value               = "VPC_Task"
    propagate_at_launch = false
  }

  tag {
    key                 = "Environment"
    value               = "Test"
    propagate_at_launch = false
  }

  tag {
    key                 = "Team"
    value               = "DevOps"
    propagate_at_launch = false
  }

  tag {
    key                 = "Created_by"
    value               = "Your_Name"
    propagate_at_launch = false
  }
}
