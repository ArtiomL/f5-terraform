# Slack Notifications

resource "null_resource" "main" {
  provisioner "local-exec" {
    command = "curl -X POST -H 'Content-type: application/json' --data '{\"text\":\"${var.message}\"}' https://hooks.slack.com/services/${var.webhook_url}"
  }
}
