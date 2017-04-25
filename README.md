# Terraform CORS configuration for API Gateway

Usage:
```
module "api_gw_cors" {
  source = "github.com/mtranter/terraform-api-gateway-cors//module"
  resource_id = "${aws_api_gateway_resource.api_resource.root_resource_id}"
  rest_api_id = "${aws_api_gateway_rest_api.api_resource.id}"
}
```
