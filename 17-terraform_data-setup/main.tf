resource "aws_instance" "test_ec2" {
  ami                    = local.ami_id
  instance_type          = local.instance_type
  key_name               = "ami2"
  vpc_security_group_ids = [aws_security_group.test_sg.id]
  tags = merge(local.tags,
    {
      Name = "${local.project}-${local.environment}-test_ec2"
    }
  )
}

resource "aws_security_group" "test_sg" {
  name = "${local.project}-${local.environment}-sg"

  dynamic "ingress" {
    for_each = concat(var.allowed_ports, local.ssh)
    content {
      from_port   = ingress.value.port
      to_port     = ingress.value.port
      cidr_blocks = ingress.value.cidr_blocks
      protocol    = "TCP"
    }
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = merge(local.tags,
    {
      Name = "${local.project}-${local.environment}-test_sg"
    }
  )
}
