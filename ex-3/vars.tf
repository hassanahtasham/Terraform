variable "REGION" {
  default = "us-east-1"
}

variable "ZONE1" {
  default = "us-east-1a"
}

variable "AMIS" {
  type = map(any)
  default = {
    us-east-1 = "ami-007855ac798b5175e"
    us-east-2 = "ami-0a695f0d95cefc163"

  }
}

variable "instance_type" {
  default = "t2.micro"
}

variable "USER" {
  default = "ec2-User"
}
