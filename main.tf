resource "aws_instance" "ubuntu" {
    ami = "ami-080e1f13689e07408"
    instance_type = "t2.medium"
    key_name = "ubuntu"
    user_data = file("flower.sh")
    vpc_security_group_ids = [aws_security_group.ubuntu-sg.id ]
    tags = {
      Name = "ubuntu-server"
    }
}

resource "aws_security_group" "ubuntu-sg" {
  vpc_id = "vpc-0f4b705f483dda13d"
  description = "This is the security group of my ubuntu server"
  name = "my_ubuntu_sg"

  ingress {
    from_port = 22
    to_port = 22
    cidr_blocks = ["0.0.0.0/0"]
    protocol = "tcp"
    description = "Port 22 for ssh login"
  }

  ingress {
    from_port = 8080
    to_port = 8080
    cidr_blocks = ["0.0.0.0/0"]
    protocol = "tcp"
    description = "This is for jenkins"
  }

  egress {
    from_port = 0
    to_port = 0
    cidr_blocks = ["0.0.0.0/0"]
    protocol = -1
    description = "Allow all outgoing traffic"
  }

}