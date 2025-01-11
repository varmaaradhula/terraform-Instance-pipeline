variable "region" {
  type    = string
  default = "eu-west-2"

}

variable "avzone" {

  type    = string
  default = "eu-west-2c"

}

variable "amiIds" {

  type = map(any)

  default = {
    eu-west-2 = "ami-05c172c7f0d3aed00"
    eu-west-1 = "ami-0e9085e60087ce171"

  }
}

variable "webuser" {

  default = "ubuntu"

}
