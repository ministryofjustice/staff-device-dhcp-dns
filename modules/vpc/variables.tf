variable "cidr_block" {
  type = string
}

variable "cidr_block_new_bits" {
  type = number
  default = 8
}

variable "region" {
  type = string
}

variable "prefix" {
  type = string
}
