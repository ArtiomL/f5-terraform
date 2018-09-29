# AMI Data Source

data "external" "ami" {
  program = ["sh", "-c", "wget -qO- ${var.ami_url} | jq 'with_entries(.value |= .AllTwoBootLocations)'"]
}
