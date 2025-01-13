resource "aws_instance" "CafeShop" {
  ami                    = var.amiIds[var.region]
  instance_type          = "t3.micro"
  key_name               = aws_key_pair.keypair.id
  vpc_security_group_ids = [aws_security_group.instanceSG.id]
  availability_zone      = var.avzone

  tags = {
    Name = "CafeBarista009"
  }


}
