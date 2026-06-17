locals {
  environment   = terraform.workspace
  ami_id        = "ami-02dfbd4ff395f2a1b"
  instance_type = "t3.micro"
  tags = merge(var.common_tags,
    {
      "Managed By" = "terraform"
    }
  )
  project = "roboshop"
  ssh = [{
    port        = 22
    cidr_blocks = ["${chomp(data.http.get_ip.response_body)}/32"]
  }]
}

locals {

}