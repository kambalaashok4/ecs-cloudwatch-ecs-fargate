variable "aws_region" {
  description = "AWS region to deploy resources into"
  type        = string
  default     = "us-east-1"
}

variable "project_name" {
  description = "Prefix used for all resource names. Must be 1–19 characters (AWS ALB/TG names are capped at 32 chars; the longest suffix appended here is '-ecs-tasks-sg' = 13 chars)."
  type        = string
  default     = "ecs-cw-demo"

  validation {
    condition     = length(var.project_name) >= 1 && length(var.project_name) <= 19
    error_message = "project_name must be between 1 and 19 characters to comply with AWS ALB/Target Group name limits (max 32 chars total including resource suffixes)."
  }
}

variable "container_image" {
  description = "Docker image to run in the ECS task"
  type        = string
  default     = "avian19/tetrisv1:latest"
  #"nginx:latest"
}

variable "container_port" {
  description = "Port the container listens on"
  type        = number
  default     = 3000
}

variable "desired_count" {
  description = "Number of ECS task replicas to run"
  type        = number
  default     = 1
}

variable "cpu" {
  description = "vCPU units for the Fargate task (512 = 0.5 vCPU)"
  type        = number
  default     = 512
}

variable "memory" {
  description = "Memory (MiB) for the Fargate task"
  type        = number
  default     = 1024
}

variable "log_retention_days" {
  description = "CloudWatch log group retention period in days"
  type        = number
  default     = 7
}

variable "autoscaling_min_capacity" {
  description = "Minimum number of ECS tasks when autoscaling"
  type        = number
  default     = 1
}

variable "autoscaling_max_capacity" {
  description = "Maximum number of ECS tasks when autoscaling"
  type        = number
  default     = 4
}

variable "autoscaling_cpu_target" {
  description = "Target average CPU utilization (%) that triggers scaling"
  type        = number
  default     = 60
}
