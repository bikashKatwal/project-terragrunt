remote_state {
  backend = "azurerm"

  config = {
    resource_group_name  = "terraform_dev_rg"
    storage_account_name = "terraformdevtfstatestacc"
    container_name       = "terraformtfstatecontainer"
    key                  = "${path_relative_to_include()}/${get_env("ENVIRONMENT", "")}.terraform.tfstate"
  }
}


generate "backend" {
  path      = "backend.tf"
  if_exists = "overwrite_terragrunt"
  contents  = <<EOF
terraform {
  backend "azurerm" {
    resource_group_name  =  "terraform_dev_rg"
    storage_account_name = "terraformdevtfstatestacc"
    container_name       = "terraformtfstatecontainer"
    key            = "${path_relative_to_include()}/${get_env("ENVIRONMENT", "")}.terraform.tfstate"
  }
}
EOF
}