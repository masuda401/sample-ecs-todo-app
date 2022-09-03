variable "tags" {
  type = map(string)
  default = {
    "Terraform" = "true"
  }
}

variable "region" {
  type    = string
  default = "ap-northeast-1"
}
