variable project {
  description = "Project ID"
}
variable region {
  description = "Region"
  default = "europe-west1"
}
variable zone {
  default = "europe-west1-b"
}
variable public_key_path {
  description = "Path to the public key used for ssh access"
}
variable disk_image {
  description = "Disk image"
}
variable private_key {
  description = "Private key for ssh connection"
}
variable instances_amount {
  description = "How many instances VM will be created"
  type        = number
  default     = 1
}
