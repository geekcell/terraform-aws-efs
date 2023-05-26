module "basic-example" {
  source = "../../"

  name            = "efs1"
  private_subnets = ["subnet-12345678", "subnet-12345678"]
  security_groups = ["sg-12345678"]
}
