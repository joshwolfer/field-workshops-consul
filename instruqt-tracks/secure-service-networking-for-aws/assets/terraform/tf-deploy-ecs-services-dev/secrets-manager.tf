resource "aws_secretsmanager_secret" "bootstrap_token" {
  name                    = "bootstrap-token"
  recovery_window_in_days = 0
}

resource "aws_secretsmanager_secret_version" "bootstrap_token" {
  secret_id     = aws_secretsmanager_secret.bootstrap_token.id
  secret_string = local.hcp_acl_token
}

resource "aws_secretsmanager_secret" "gossip_key" {
  name                    = "gossip-key"
  recovery_window_in_days = 0
}

resource "aws_secretsmanager_secret_version" "gossip_key" {
  secret_id     = aws_secretsmanager_secret.gossip_key.id
  secret_string = local.consul_gossip_key
}

resource "aws_secretsmanager_secret" "consul_ca_cert" {
  name                    = "consul-ca-cert"
  recovery_window_in_days = 0
}

resource "aws_secretsmanager_secret_version" "consul_ca_cert" {
  secret_id     = aws_secretsmanager_secret.consul_ca_cert.id
  secret_string = file(var.consul_client_ca_path)
}