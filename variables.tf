
variable "metadata_startup_script" {
  type        = string
  default     = ""
  description = "(optional) describe your variable"
}

variable "image" {
  default = "debian-cloud/debian-10"
}

variable "common_tags" {
  type = map(any)
  default = {
    module = "terraform-gcp-instance"
  }
}

variable "labels" {
  default = { "jim" = "a" }
}
variable "name" { default = "instance-1" }
variable "machine_type" { default = "e2-medium" }
variable "zone" { default = "us-central1-a" }
variable "account_id" {}
