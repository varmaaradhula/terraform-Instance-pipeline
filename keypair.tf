resource "aws_key_pair" "keypair" {
  key_name   = "instanceKey"
  public_key = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIPvLlcDewbvbkgRa4W2iT/4T5scSwLmsNs1GfRIG9o+f jenkins@Jenkins"
}
