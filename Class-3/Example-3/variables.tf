variable "username" {
  type        = string
  sensitive   = true
  default = "dbuser"
  description = "DB username"
}

variable "password" {
  type        = string
  sensitive   = true
  description = "DB password"
}

variable common_tags {
  type        = map
  default     = {
    Team = "DevOps"
    Owner = "DevOps"
    Tool = "Terraform" 
  }
  description = "Resource tags"
}

