variable "content_type" {
  type = "string"
}

variable "rest_api_id" {
  type = "string"
}

output "name" {
  value = "${aws_api_gateway_model.empty_model.name}"
}
