output "alb_dns_name" {
  value       = aws_lb.app_alb.dns_name
  description = "ALB DNS name"
}

output "cloudfront_domain" {
  value       = aws_cloudfront_distribution.app_cdn.domain_name
  description = "CloudFront distribution domain"
}

output "rds_endpoint" {
  value       = aws_db_instance.app_db.endpoint
  description = "RDS endpoint"
}

output "rds_secret_arn" {
  value       = aws_secretsmanager_secret.db_credentials.arn
  description = "Secrets Manager ARN for DB credentials"
}
