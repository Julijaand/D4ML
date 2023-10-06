provider "aws" {
    region = "eu-central-1"
}
resource "aws_security_group" "JuliasSecurityGroup" {
    name        = "JuliasSecurityGroup"

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

    tags = {
    Name = "Julijas_instance"
  }
   provisioner "remote-exec" {
    inline = [
      "sudo useradd -m -s /bin/bash admin",  # Create admin user
      "echo 'admin:XXXXXXX' | sudo chpasswd",  # Set the admin's password

      "sudo useradd -m -s /bin/bash director",  # Create director user
      "echo 'director:XXXXXXX' | sudo chpasswd",  # Set the director's password

      "sudo groupadd maintanance",  # Create a new group named "maintanance"
      "sudo usermod -aG maintanance director",  # Add director to the group "maintanance"
    ]
    

    # connection {
    #   type        = "ssh"
    #   user        = "admin"
    #   private_key = file("C:/Users/julija.andrusenko/Desktop/julias_key_pair.pem")  # Replace with the path to your private key
    # }
  }
}
