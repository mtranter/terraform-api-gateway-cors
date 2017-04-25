variable "allow_methods" {
  default = "POST,OPTIONS,GET,PUT,PATCH,DELETE"
}

variable "allow_headers" {
  default = "Content-Type,X-Amz-Date,Authorization,X-Api-Key,X-Amz-Security-Token"
}

variable "allow_origin" {
  default = "*"
}

variable "rest_api_id" {
  type = "string"
}

variable "resource_id" {
  type = "string"
}

variable "authorization" {
  default = "NONE"
}

variable "authorizer_id" {
  default = ""
}
