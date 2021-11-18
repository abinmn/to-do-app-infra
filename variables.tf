variable "AWS_REGION" {
  default = "eu-central-1"
}

variable "DEVELOPER_IPS" {
  type    = list(string)
  default = ["116.68.79.59/32", "95.90.254.71/32"]
}