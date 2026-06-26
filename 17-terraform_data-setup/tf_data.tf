#terraform_data is used to run the bootstrap scripts when there is any change in instance/script details

resource "terraform_data" "test" {
  triggers_replace = [
    aws_instance.test-ec2.id
  ]

  provisioner "file" {
    source      = "user-data.sh"
    destination = "/home/ec2-user/user-data.sh"
  }
  connection {
    type        = "ssh"
    user        = "ec2-user"
    private_key = file("~/.ssh/ami2.pem")
    host        = self.public_ip
  }
  provisioner "remote-exec" {
    inline = [
      "sudo chmod +x /home/ec2-user/user-data.sh",
      "cd /home/ec2-user/",
      "sudo sh user-data.sh"
    ]
  }
}