variable "environment" {
  type    = string
  default = "dev"
}

variable "location" {
  type    = string
  default = "Australia East"
}

variable "storage_account_tier" {
  type = string
}

variable "storage_account_replication" {
  type = string
}
