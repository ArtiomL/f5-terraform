# Public IP Data Source

data "external" "ifconfig" {
  program = ["sh", "-c", "curl -s https://ifconfig.co/json | jq '{ip, country, country_iso, city, hostname}'"]
}
