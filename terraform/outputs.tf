output "alb_dns_name" {
  description = "Public DNS name of the Application Load Balancer — open this in a browser to reach the sample app"
  value       = "http://${aws_lb.main.dns_name}"
}

output "ecs_cluster_name" {
  description = "Name of the ECS cluster (Container Insights enabled)"
  value       = aws_ecs_cluster.main.name
}

output "cloudwatch_log_group" {
  description = "CloudWatch Log Group where container stdout/stderr is sent"
  value       = aws_cloudwatch_log_group.app.name
}

output "ecs_service_name" {
  description = "Name of the ECS Fargate service"
  value       = aws_ecs_service.app.name
}
