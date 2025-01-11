resource "aws_instance" "CafeShop" {
  ami                    = var.amiIds[var.region]
  instance_type          = "t3.micro"
  key_name               = aws_key_pair.keypair.id
  vpc_security_group_ids = [aws_security_group.instanceSG.id]
  availability_zone      = var.avzone

  tags = {
    Name = "CafeBarista"
  }

  # Copies the myapp.conf file to /etc/myapp.conf

  provisioner "file" {
    source      = "web.sh"
    destination = "/tmp/web.sh"
  }

  connection {
    type        = "ssh"
    user        = var.webuser
    private_key = file("instancekey")
    host        = self.public_ip
  }

  provisioner "remote-exec" {
    inline = [
      "chmod +x /tmp/web.sh",
      "sudo /tmp/web.sh"
    ]
  }


}