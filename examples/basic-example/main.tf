module "basic-example" {
  source = "../../"

  name = var.storage_name

  private_subnets = var.private_subnets
  security_groups = var.security_groups
}
