resource "aws_instance" "test-ec2" {
    ami = "ami-02dfbd4ff395f2a1b"
    instance_type = "t3.micro"

    tags = {
        Name = "test-ec2"
    }
}
