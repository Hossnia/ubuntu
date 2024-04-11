resource "tls_private_key" "ubuntu" {
  algorithm = "RSA"
  rsa_bits = 2048
}

resource "aws_key_pair" "ubuntu" {
  key_name = "ubuntu"
  public_key = tls_private_key.ubuntu.public_key_openssh
}

resource "local_file" "ubuntu" {
  filename = "ubuntu.pem"
  content = tls_private_key.ubuntu.private_key_pem
}