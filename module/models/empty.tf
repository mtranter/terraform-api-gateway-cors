resource "aws_api_gateway_model" "empty_model" {
  rest_api_id  = "${var.rest_api_id}"
  name         = "Empty_${replace(replace(var.content_type,"/",""),"+","")}"
  description  = "Empty Schema"
  content_type = "${var.content_type}"

  schema = <<EOF
{
  "$schema": "http://json-schema.org/draft-04/schema#",
  "title" : "Empty Schema",
  "type" : "object"
}
EOF
}
