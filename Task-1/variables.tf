variable "common_tags" {
  type = map(any)
  default = {
    Project     = "VPC_Task"
    Environment = "Test"
    Team        = "DevOps"
    Created_by  = "Islam_Kambarov"
  }
  description = "Resourse tags"
}
