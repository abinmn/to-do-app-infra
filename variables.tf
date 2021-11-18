variable "AWS_REGION" {
  default = "eu-central-1"
}

variable "DEVELOPER_IPS" {
  type    = list(string)
  default = ["116.68.79.59/32", "95.90.254.71/32"]
}

variable "PRIVATE_SUBNET_1_CIDR_BLOCK"v{
  type = string
  default = "10.0.4.0/24"
}

variable "PRIVATE_SUBNET_2_CIDR_BLOCK"v{
  type = string
  default = "10.0.5.0/24"
}