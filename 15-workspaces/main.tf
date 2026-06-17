resource "aws_instance" "test_ec2" {
  ami                    = var.ami
  instance_type          = var.instance_type
  key_name               = "ami2"
  vpc_security_group_ids = [aws_security_group.test_sg.id]
  tags =     {
      Name = "${var.project}-${var.environment}-test_ec2"
    }


  provisioner "file" {
    source      = "user-data.sh"
    destination = "/home/${var.user}/user-data.sh"
  }
  connection {
    type        = "ssh"
    user        = var.user
    private_key = file("~/.ssh/ami2.pem")
    host        = self.public_ip
  }
  provisioner "remote-exec" {
    inline = [
      "sudo chmod +x /home/${var.user}/user-data.sh",
      "cd /home/${var.user}/",
      "sh user-data.sh"
    ]
  }
}

resource "aws_security_group" "test_sg" {
  name = "${var.project}-${var.environment}-sg"

  ingress {
    
      from_port   = 22
      to_port     = 22
      cidr_blocks = ["0.0.0.0/0"]
      protocol    = "TCP"
    }
  

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags =     {
      Name = "${var.project}-${var.environment}-test_sg"
    }
}
