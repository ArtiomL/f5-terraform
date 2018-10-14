# Slack Input Variables

variable "message_text" {
  description = "Slack message text"
  default     = "hello, world"
}

variable "webhook_url" {
  description = "Incoming Webhook URL"
  default     = "T00000000/B00000000/XXXXXXXXXXXXXXXXXXXXXXXX"
}
