resource "aws_secretsmanager_secret" "db_credentials" {
  name = "myapp-db-credentials-v2"
}

resource "aws_secretsmanager_secret_version" "db_credentials_version" {
  secret_id = aws_secretsmanager_secret.db_credentials.id

  secret_string = jsonencode({
    username = "appuser"
    password = "StrongPassword123!"
    dbname   = "postgres"
    port     = 5432
  })
}
