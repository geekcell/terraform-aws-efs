run "setup" {
  module {
    source = "./tests/network"
  }
}

run "basic_efs" {
  variables {
    name = "basic-efs-test"

    private_subnets = run.setup.subnet_ids
    security_groups = [run.setup.security_group_id]

    throughput_mode       = "elastic"
    transition_to_ia      = "AFTER_7_DAYS"
    transition_to_archive = "AFTER_14_DAYS"

    access_points = {
      for dir in ["private", "public"] : dir => {
        posix_user = {
          gid = 1000
          uid = 1000
        }

        root_directory = {
          path = "/${dir}"

          creation_info = {
            owner_gid   = 1000
            owner_uid   = 1000
            permissions = "0755"
          }
        }
      }
    }

    tags = {
      SomeTag    = "foo"
      AnotherTag = "bar"
    }
  }

  assert {
    condition     = length(output.arn) >= 0
    error_message = "Expected EFS to be created."
  }

  assert {
    condition     = length(output.access_point_ids) == 2
    error_message = "Expected EFS to have 2 access points."
  }
}
