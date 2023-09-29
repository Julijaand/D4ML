provider "aws" {
    region = "eu-central-1"
}
resource "aws_security_group" "JuliasSecurityGroup" {
    name        = "JuliasSecurityGroup"

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_instance" "Julijas_instance"{
    ami = "ami-d4ml-2022-10-05T10-47-38Z"
    instance_type = "t2.micro"
    key_name = "julias_key_pair"
}

connection {
    # type = "ssh"
    user = "admin"
    private_key = file("C:/Users/julija.andrusenko/Desktop/julias_key_pair.pem")
}
