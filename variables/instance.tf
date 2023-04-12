resource "aws_instance" "first-deployment" {
  ami                    = var.AMIS[var.REGION]
  availability_zone      = var.ZONE1
  instance_type          = var.instance_type
  key_name               = "ec2-first"
  vpc_security_group_ids = ["sg-0a48f1ad8006d2cb9"]
  tags = {
    "Name" = "first-deployment"
  }


}