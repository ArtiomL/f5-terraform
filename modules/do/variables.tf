# DigitalOcean Input Variables

variable "do_region" {
  description = "DigitalOcean region"
  default     = "fra1"
}

# --- Tags --- #

variable "tag_name" {
  description = "Name tag"
  default     = "F5Labs"
}

variable "tag_environment" {
  description = "Environment tag"
  default     = "DEV"
}

variable "tags_shared" {
  description = "Other tags assigned to all resources"
  default     = ["T.Durden", "R&D", "7741", "Mayhem"]
}

# --- Droplet --- #

variable "ssh_keys" {
  description = "SSH key IDs or fingerprints"
  type        = "list"
}

variable "droplet_image" {
  description = "Droplet image ID or slug"
  default     = "coreos-stable"
}

variable "droplet_size" {
  description = "Droplet size slug"
  default     = "s-1vcpu-1gb"
}

variable "user_data" {
  description = "Cloud-config user data acted upon by cloud-init"
}
