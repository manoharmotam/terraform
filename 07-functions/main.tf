resource "aws_instance" "test_ec2" {
  count           = length(var.instances)
  ami             = var.ami_id
  instance_type   = var.instance_type
  vpc_security_group_ids  = [aws_security_group.test_sg[count.index].id]
  key_name = "ami2"

  tags = {
    Name = "${var.project}-${var.environment}-${var.instances[count.index]}"
  }
}

resource "aws_security_group" "test_sg" {
  count = length(var.instances)
  name  = "${var.project}-${var.environment}-${var.instances[count.index]}-sg"
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "TCP"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    Name = "${var.project}-${var.environment}-${var.instances[count.index]}"
  }
}