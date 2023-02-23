Setup AWS instances

## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | ~> 1.2.2 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | ~> 4.4.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | ~> 4.4.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_instance.instance](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/instance) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_aws_profile"></a> [aws\_profile](#input\_aws\_profile) | AWS Profile name | `string` | `"aws"` | no |
| <a name="input_aws_region"></a> [aws\_region](#input\_aws\_region) | AWS Region name | `string` | `"us-east-1"` | no |
| <a name="input_environment"></a> [environment](#input\_environment) | A name that identifies the environment (e.g. `production`, `devops`, `develop`), will used as prefix and for tagging | `string` | `"develop"` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | General tags values | `map(string)` | `{}` | no |

## Outputs

No outputs.
