# Public IP Data Source

data "external" "ifconfig" {
  program = ["sh", "-c", "wget -qO- ifconfig.co/json | jq '{ip, country, country_iso, city, hostname}'"]
}
