resource "aws_api_gateway_method" "options_method" {
  rest_api_id       = "${var.rest_api_id}"
  resource_id       = "${var.resource_id}"
  http_method       = "OPTIONS"
  authorization     = "${var.authorization}"
  authorizer_id  = "${var.authorizer_id}"
}

resource "aws_api_gateway_integration" "integration" {
  rest_api_id = "${var.rest_api_id}"
  resource_id = "${var.resource_id}"
  http_method = "${aws_api_gateway_method.options_method.http_method}"
  type = "MOCK"
  request_templates = {
    "application/json" = <<PARAMS
{ "statusCode": 200 }
PARAMS
    "application/xml" = <<PARAMS
{ "statusCode": 200 }
PARAMS
    "text/html" = <<PARAMS
{ "statusCode": 200 }
PARAMS
    "application/xhtml+xml" = <<PARAMS
{ "statusCode": 200 }
PARAMS
  }
}

resource "aws_api_gateway_integration_response" "integration200" {
  rest_api_id = "${var.rest_api_id}"
  resource_id = "${var.resource_id}"
  http_method = "${aws_api_gateway_method.options_method.http_method}"
  status_code = "200"
  response_parameters = {
    "method.response.header.Access-Control-Allow-Headers" = "'${var.allow_headers}'",
    "method.response.header.Access-Control-Allow-Methods" = "'${var.allow_methods}'",
    "method.response.header.Access-Control-Allow-Origin"  = "'${var.allow_origin}'"
  }
}

resource "aws_api_gateway_method_response" "200" {
  rest_api_id = "${var.rest_api_id}"
  resource_id = "${var.resource_id}"
  http_method = "OPTIONS"
  status_code = "200"
  response_models = {
    "application/json"        = "${module.json_model.name}",
    "application/xml"         = "${module.xml_model.name}",
    "text/html"               = "${module.html_model.name}",
    "application/xhtml+xml"   = "${module.xhtml_model.name}"
  }
  response_parameters = {
    "method.response.header.Access-Control-Allow-Headers" = true,
    "method.response.header.Access-Control-Allow-Methods" = true,
    "method.response.header.Access-Control-Allow-Origin" = true
  }
}

module "json_model" {
  source        = "./models"
  rest_api_id   = "${var.rest_api_id}"
  content_type  = "application/json"
}

module "xml_model" {
  source        = "./models"
  rest_api_id   = "${var.rest_api_id}"
  content_type  = "application/xml"
}

module "html_model" {
  source        = "./models"
  rest_api_id   = "${var.rest_api_id}"
  content_type  = "text/html"
}

module "xhtml_model" {
  source        = "./models"
  rest_api_id   = "${var.rest_api_id}"
  content_type  = "application/xhtml+xml"
}
