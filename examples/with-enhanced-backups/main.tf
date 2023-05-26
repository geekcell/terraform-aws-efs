module "with-enhanced-backups" {
  source = "../../"

  name            = "efs1"
  private_subnets = ["subnet-12345678", "subnet-12345678"]
  security_groups = ["sg-12345678"]

  enable_enhanced_backups = true
}
