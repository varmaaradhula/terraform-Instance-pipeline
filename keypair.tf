resource "aws_key_pair" "keypair" {
  key_name   = "instanceKey"
  public_key = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAICTmX4Sq8N5paLW7iBwSnGzuL1bIe3zOt9hYptdMnNn/ varma@macbookpro"
}