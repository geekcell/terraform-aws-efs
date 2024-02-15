data "aws_availability_zones" "available" {}

resource "aws_default_vpc" "default" {}

resource "aws_default_security_group" "default" {
  vpc_id = aws_default_vpc.default.id
}

data "aws_subnet" "default" {
  availability_zone = data.aws_availability_zones.available.names[0]
  default_for_az    = true
}
