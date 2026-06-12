resource "aws_instance" "test_ec2" {
    ami = var.ami_id
    instance_type = var.instance_type
    vpc_security_group_ids = [
      aws_security_group.test_sg.id
      ]
    user_data = file("${path.module}/user-data.sh")
    user_data_replace_on_change = true
    tags = {
      Name = "test-ec2"
    }
}

resource "aws_security_group" "test_sg" {
  name = "test-sg"
  description = "Allow SSH"
  
  ingress {
    from_port = 22
    to_port = 22
    protocol = "TCP"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port = 80
    to_port = 80
    protocol = "TCP"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "test-sg"
  }
}