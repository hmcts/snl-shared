//SHARED VARIABLES
variable "product" {
  type        = "string"
  default     = "snl"
  description = "Scheduling and Listing "
}

variable "raw_product" {
  default      = "snl" // jenkins-library overrides product for PRs and adds e.g. pr-118-snl
}

variable "component" {
  type        = "string"
  default     = "shared"
  description = "Scheduling and Listing "
}

variable "env" {
  type = "string"
  description = "The deployment environment (sandbox, aat, prod etc..)"
}

variable "location" {
  type    = "string"
  description = "The location where you would like to deploy your infrastructure"
  default = "UK South"
}

variable "tenant_id" {
  description = "(Required) The Azure Active Directory tenant ID that should be used for authenticating requests to the key vault. This is usually sourced from environment variables and not normally required to be specified."
}

variable "jenkins_AAD_objectId" {
  description = "(Required) The Azure AD object ID of a user, service principal or security group in the Azure Active Directory tenant for the vault. The object ID must be unique for the list of access policies."
}

variable "product_group_object_id" {
  default = "c9ab670f-8f92-4170-ba08-796ccab27751"
  description = "dcd_snl_kv"
}

// ASP Specific Variables
variable "asp_capacity" {
  type    = "string"
  default = "1"
}

variable "asp_sku_size" {
  type    = "string"
  default = "I1"
}

// AppInsights
// as of now, UK South is unavailable for Application Insights
variable "appinsights_location" {
  type        = "string"
  default     = "West Europe"
  description = "Location for Application Insights"
}

variable "application_type" {
  type        = "string"
  default     = "Web"
  description = "Type of Application Insights (Web/Other)"
}

// TAG SPECIFIC VARIABLES
variable "team_name" {
  type        = "string"
  description = "The name of your team"
  default     = "SnL"
}

variable "team_contact" {
  type        = "string"
  description = "The name of your Slack channel people can use to contact your team about your infrastructure"
  default     = "#snl-devs"
}

// Other
variable "destroy_me" {
  type        = "string"
  default     = "false"
}
