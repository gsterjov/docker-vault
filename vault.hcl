backend "file" {
  path = "/data"
}

listener "tcp" {
  address = "0.0.0.0:8200"
  tls_cert_file = "/certs/vault.crt"
  tls_key_file = "/certs/vault.key"
}