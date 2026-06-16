resource "aws_instance" "test_ec2" {
    ami = local.ami_id
    instance_type = local.instance_type
    vpc_security_group_ids = [aws_security_group.test_sg.id]
    tags = merge(local.tags,
            {
                Name = "${local.project}-${local.environment}-test_ec2"
            }
        )
}

resource "aws_security_group" "test_sg" {
    name = "${local.project}-${local.environment}-sg"

    ingress {
        from_port = 22
        to_port = 22
        cidr_blocks = [ "0.0.0.0/0" ]
        protocol = "TCP"
    }
    tags = merge(local.tags,
            {
                Name = "${local.project}-${local.environment}-test_sg"
            }
        )
}