resource "aws_key_pair" "first-dep" {
  key_name   = "ec2FirstDep"
  public_key = file("ex-3.pub")
}

resource "aws_instance" "EX-3-Deployment" {
  ami                    = var.AMIS[var.REGION]
  instance_type          = var.instance_type
  availability_zone      = var.ZONE1
  key_name               = aws_key_pair.first-dep.key_name
  vpc_security_group_ids = ["sg-0a48f1ad8006d2cb9"]
  tags = {
    "Name" = "first-deployment"
  }

  provisioner "file" {
    source      = "web.sh"
    destination = "/tmp/web.sh"
  }

  provisioner "remote-exec" {
    inline = [
      "chmod = u+x /tmp/web.sh",
      "sudo /tmp/web.sh"
    ]
  }

  connection {
    user        = var.USER
    private_key = file("ex-3")
    host        = self.public_ip
  }

}