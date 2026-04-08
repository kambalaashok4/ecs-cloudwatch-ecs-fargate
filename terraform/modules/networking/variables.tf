variable "project_name" {
  description = "Prefix used for all resource names"
  type        = string
}

variable "container_port" {
  description = "Port the container listens on"
  type        = number
}

variable "certificate_arn" {
  description = "ARN of the ACM certificate for HTTPS (optional)"
  type        = string
  default     = ""
  
}