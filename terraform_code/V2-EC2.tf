provider "aws"{
    region = "us-east-1"
}
resource "aws_instance" "demo-server"{
    ami = "ami-0bb84b8ffd87024d8"
    instance_type = "t2.micro"
    key_name = "devtest"
    security_groups = ["demo-sg"]
}

resource "aws_security_group" "demo-test" {
  name        = "demo-test"
  description = "SSh access"
 

   ingress {
    description      = "SSH access"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }

    egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "SSH-port"
  }
}

