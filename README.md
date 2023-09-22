<!-- BEGIN_TF_DOCS -->
[![Geek Cell GmbH](https://raw.githubusercontent.com/geekcell/.github/main/geekcell-github-banner.png)](https://www.geekcell.io/)

### Code Quality
[![License](https://img.shields.io/github/license/geekcell/terraform-aws-efs)](https://github.com/geekcell/terraform-aws-efs/blob/master/LICENSE)
[![GitHub release (latest tag)](https://img.shields.io/github/v/release/geekcell/terraform-aws-efs?logo=github&sort=semver)](https://github.com/geekcell/terraform-aws-efs/releases)
[![Release](https://github.com/geekcell/terraform-aws-efs/actions/workflows/release.yaml/badge.svg)](https://github.com/geekcell/terraform-aws-efs/actions/workflows/release.yaml)
[![Validate](https://github.com/geekcell/terraform-aws-efs/actions/workflows/validate.yaml/badge.svg)](https://github.com/geekcell/terraform-aws-efs/actions/workflows/validate.yaml)
[![Lint](https://github.com/geekcell/terraform-aws-efs/actions/workflows/linter.yaml/badge.svg)](https://github.com/geekcell/terraform-aws-efs/actions/workflows/linter.yaml)

<!--
Comment in these badges if they apply to the repository.

### Security
[![Infrastructure Tests](https://www.bridgecrew.cloud/badges/github/geekcell/terraform-aws-efs/general)](https://www.bridgecrew.cloud/link/badge?vcs=github&fullRepo=geekcell%2Fterraform-aws-efs&benchmark=INFRASTRUCTURE+SECURITY)

#### Cloud
[![Infrastructure Tests](https://www.bridgecrew.cloud/badges/github/geekcell/terraform-aws-efs/cis_aws)](https://www.bridgecrew.cloud/link/badge?vcs=github&fullRepo=geekcell%2Fterraform-aws-efs&benchmark=CIS+AWS+V1.2)
[![Infrastructure Tests](https://www.bridgecrew.cloud/badges/github/geekcell/terraform-aws-efs/cis_aws_13)](https://www.bridgecrew.cloud/link/badge?vcs=github&fullRepo=geekcell%2Fterraform-aws-efs&benchmark=CIS+AWS+V1.3)
[![Infrastructure Tests](https://www.bridgecrew.cloud/badges/github/geekcell/terraform-aws-efs/cis_azure)](https://www.bridgecrew.cloud/link/badge?vcs=github&fullRepo=geekcell%2Fterraform-aws-efs&benchmark=CIS+AZURE+V1.1)
[![Infrastructure Tests](https://www.bridgecrew.cloud/badges/github/geekcell/terraform-aws-efs/cis_azure_13)](https://www.bridgecrew.cloud/link/badge?vcs=github&fullRepo=geekcell%2Fterraform-aws-efs&benchmark=CIS+AZURE+V1.3)
[![Infrastructure Tests](https://www.bridgecrew.cloud/badges/github/geekcell/terraform-aws-efs/cis_gcp)](https://www.bridgecrew.cloud/link/badge?vcs=github&fullRepo=geekcell%2Fterraform-aws-efs&benchmark=CIS+GCP+V1.1)

##### Container
[![Infrastructure Tests](https://www.bridgecrew.cloud/badges/github/geekcell/terraform-aws-efs/cis_kubernetes_16)](https://www.bridgecrew.cloud/link/badge?vcs=github&fullRepo=geekcell%2Fterraform-aws-efs&benchmark=CIS+KUBERNETES+V1.6)
[![Infrastructure Tests](https://www.bridgecrew.cloud/badges/github/geekcell/terraform-aws-efs/cis_eks_11)](https://www.bridgecrew.cloud/link/badge?vcs=github&fullRepo=geekcell%2Fterraform-aws-efs&benchmark=CIS+EKS+V1.1)
[![Infrastructure Tests](https://www.bridgecrew.cloud/badges/github/geekcell/terraform-aws-efs/cis_gke_11)](https://www.bridgecrew.cloud/link/badge?vcs=github&fullRepo=geekcell%2Fterraform-aws-efs&benchmark=CIS+GKE+V1.1)
[![Infrastructure Tests](https://www.bridgecrew.cloud/badges/github/geekcell/terraform-aws-efs/cis_kubernetes)](https://www.bridgecrew.cloud/link/badge?vcs=github&fullRepo=geekcell%2Fterraform-aws-efs&benchmark=CIS+KUBERNETES+V1.5)

#### Data protection
[![Infrastructure Tests](https://www.bridgecrew.cloud/badges/github/geekcell/terraform-aws-efs/soc2)](https://www.bridgecrew.cloud/link/badge?vcs=github&fullRepo=geekcell%2Fterraform-aws-efs&benchmark=SOC2)
[![Infrastructure Tests](https://www.bridgecrew.cloud/badges/github/geekcell/terraform-aws-efs/pci)](https://www.bridgecrew.cloud/link/badge?vcs=github&fullRepo=geekcell%2Fterraform-aws-efs&benchmark=PCI-DSS+V3.2)
[![Infrastructure Tests](https://www.bridgecrew.cloud/badges/github/geekcell/terraform-aws-efs/pci_dss_v321)](https://www.bridgecrew.cloud/link/badge?vcs=github&fullRepo=geekcell%2Fterraform-aws-efs&benchmark=PCI-DSS+V3.2.1)
[![Infrastructure Tests](https://www.bridgecrew.cloud/badges/github/geekcell/terraform-aws-efs/iso)](https://www.bridgecrew.cloud/link/badge?vcs=github&fullRepo=geekcell%2Fterraform-aws-efs&benchmark=ISO27001)
[![Infrastructure Tests](https://www.bridgecrew.cloud/badges/github/geekcell/terraform-aws-efs/nist)](https://www.bridgecrew.cloud/link/badge?vcs=github&fullRepo=geekcell%2Fterraform-aws-efs&benchmark=NIST-800-53)
[![Infrastructure Tests](https://www.bridgecrew.cloud/badges/github/geekcell/terraform-aws-efs/hipaa)](https://www.bridgecrew.cloud/link/badge?vcs=github&fullRepo=geekcell%2Fterraform-aws-efs&benchmark=HIPAA)
[![Infrastructure Tests](https://www.bridgecrew.cloud/badges/github/geekcell/terraform-aws-efs/fedramp_moderate)](https://www.bridgecrew.cloud/link/badge?vcs=github&fullRepo=geekcell%2Fterraform-aws-efs&benchmark=FEDRAMP+%28MODERATE%29)

-->



## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_access_points"></a> [access\_points](#input\_access\_points) | List of access points to create. | <pre>map(object({<br>    posix_user = optional(object({<br>      gid            = number<br>      uid            = number<br>      secondary_gids = optional(list(number))<br>    }))<br><br>    root_directory = optional(object({<br>      path = string<br><br>      creation_info = optional(object({<br>        owner_gid   = number<br>        owner_uid   = number<br>        permissions = string<br>      }))<br>    }))<br>  }))</pre> | `{}` | no |
| <a name="input_aws_iam_principals"></a> [aws\_iam\_principals](#input\_aws\_iam\_principals) | AWS IAM principals which will be allowed to access the file system via the EFS policy. | `list(string)` | <pre>[<br>  "*"<br>]</pre> | no |
| <a name="input_bypass_policy_lockout_safety_check"></a> [bypass\_policy\_lockout\_safety\_check](#input\_bypass\_policy\_lockout\_safety\_check) | A flag to indicate whether to bypass the aws\_efs\_file\_system\_policy lockout safety check. | `bool` | `false` | no |
| <a name="input_enable_customer_managed_kms"></a> [enable\_customer\_managed\_kms](#input\_enable\_customer\_managed\_kms) | If enabled, will create a customer managed KMS key for at-rest encryption. | `bool` | `false` | no |
| <a name="input_enable_enhanced_backups"></a> [enable\_enhanced\_backups](#input\_enable\_enhanced\_backups) | Enable enhanced backups. | `bool` | `false` | no |
| <a name="input_encrypted"></a> [encrypted](#input\_encrypted) | If true, the disk will be encrypted. | `bool` | `true` | no |
| <a name="input_enforce_read_only_default"></a> [enforce\_read\_only\_default](#input\_enforce\_read\_only\_default) | Enforce read-only access to the file system. Identity-based policies can override these default permissions. | `bool` | `false` | no |
| <a name="input_enforce_transit_encryption"></a> [enforce\_transit\_encryption](#input\_enforce\_transit\_encryption) | Enforce in-transit encryption for all clients. | `bool` | `true` | no |
| <a name="input_kms_key_id"></a> [kms\_key\_id](#input\_kms\_key\_id) | The ARN of the AWS KMS to encrypt the file system. Defaults to the AWS managed KMS key. | `string` | `null` | no |
| <a name="input_name"></a> [name](#input\_name) | The name of the file system. | `string` | n/a | yes |
| <a name="input_performance_mode"></a> [performance\_mode](#input\_performance\_mode) | The file system performance mode. Can be either `generalPurpose` or `maxIO`. | `string` | `"generalPurpose"` | no |
| <a name="input_prevent_anonymous_access"></a> [prevent\_anonymous\_access](#input\_prevent\_anonymous\_access) | Prevent anonymous access to the file system. | `bool` | `false` | no |
| <a name="input_prevent_root_access_default"></a> [prevent\_root\_access\_default](#input\_prevent\_root\_access\_default) | Prevent root access to the file system. Identity-based policies can override these default permissions. | `bool` | `false` | no |
| <a name="input_private_subnets"></a> [private\_subnets](#input\_private\_subnets) | A list of private subnets inside the VPC. | `list(string)` | n/a | yes |
| <a name="input_provisioned_throughput_in_mibps"></a> [provisioned\_throughput\_in\_mibps](#input\_provisioned\_throughput\_in\_mibps) | The throughput, measured in MiB/s, that you want to provision for the file system. | `number` | `0` | no |
| <a name="input_security_groups"></a> [security\_groups](#input\_security\_groups) | A list of security group IDs to associate with the file system. | `list(string)` | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | A mapping of tags to assign to all resources. | `map(string)` | `{}` | no |
| <a name="input_throughput_mode"></a> [throughput\_mode](#input\_throughput\_mode) | Throughput mode for the file system. Defaults to bursting. | `string` | `"bursting"` | no |
| <a name="input_transition_to_ia"></a> [transition\_to\_ia](#input\_transition\_to\_ia) | Indicates how long it takes to transition files to the IA storage class. Accepted values AFTER\_7\_DAYS, AFTER\_14\_DAYS, AFTER\_30\_DAYS, AFTER\_60\_DAYS, AFTER\_90\_DAYS. | `string` | `"AFTER_30_DAYS"` | no |
| <a name="input_transition_to_primary_storage_class"></a> [transition\_to\_primary\_storage\_class](#input\_transition\_to\_primary\_storage\_class) | Describes the policy used to transition a file from infequent access storage to primary storage. Only AFTER\_1\_ACCESS is accepted | `string` | `"AFTER_1_ACCESS"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_arn"></a> [arn](#output\_arn) | ARN of filesystem. |
| <a name="output_dns_name"></a> [dns\_name](#output\_dns\_name) | DNS address of filesystem. |
| <a name="output_id"></a> [id](#output\_id) | Id of filesystem. |
| <a name="output_kms_key_id"></a> [kms\_key\_id](#output\_kms\_key\_id) | DNS address of filesystem. |
| <a name="output_number_of_mount_targets"></a> [number\_of\_mount\_targets](#output\_number\_of\_mount\_targets) | DNS address of filesystem. |
| <a name="output_size_in_bytes"></a> [size\_in\_bytes](#output\_size\_in\_bytes) | DNS address of filesystem. |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | >= 4.36 |
| <a name="provider_random"></a> [random](#provider\_random) | >= 3.4 |

## Resources

- resource.aws_efs_access_point.main (main.tf#44)
- resource.aws_efs_file_system.main (main.tf#3)
- resource.aws_efs_file_system_policy.main (main.tf#37)
- resource.aws_efs_mount_target.main (main.tf#28)
- resource.random_uuid.main (main.tf#1)
- data source.aws_iam_policy_document.main (data.tf#1)

# Examples
### Basic Example
```hcl
module "basic-example" {
  source = "../../"

  name = var.storage_name

  private_subnets = var.private_subnets
  security_groups = var.security_groups
}
```

### with enhanced Backups
```hcl
module "with-enhanced-backups" {
  source = "../../"

  name            = "efs1"
  private_subnets = ["subnet-12345678", "subnet-12345678"]
  security_groups = ["sg-12345678"]

  enable_enhanced_backups = true
}
```
<!-- END_TF_DOCS -->
