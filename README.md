# terraform-gcp-instance

[![Build Status](https://github.com/JamesWoolfenden/terraform-gcp-instance/workflows/Verify%20and%20Bump/badge.svg?branch=master)](https://github.com/JamesWoolfenden/terraform-gcp-instance)
[![Latest Release](https://img.shields.io/github/release/JamesWoolfenden/terraform-gcp-instance.svg)](https://github.com/JamesWoolfenden/terraform-gcp-instance/releases/latest)
[![GitHub tag (latest SemVer)](https://img.shields.io/github/tag/JamesWoolfenden/terraform-gcp-instance.svg?label=latest)](https://github.com/JamesWoolfenden/terraform-gcp-instance/releases/latest)
![Terraform Version](https://img.shields.io/badge/tf-%3E%3D0.14.0-blue.svg)
[![Infrastructure Tests](https://www.bridgecrew.cloud/badges/github/JamesWoolfenden/terraform-gcp-instance/cis_aws)](https://www.bridgecrew.cloud/link/badge?vcs=github&fullRepo=JamesWoolfenden%2Fterraform-gcp-instance&benchmark=CIS+AWS+V1.2)
[![pre-commit](https://img.shields.io/badge/pre--commit-enabled-brightgreen?logo=pre-commit&logoColor=white)](https://github.com/pre-commit/pre-commit)
[![checkov](https://img.shields.io/badge/checkov-verified-brightgreen)](https://www.checkov.io/)
[![Infrastructure Tests](https://www.bridgecrew.cloud/badges/github/jameswoolfenden/terraform-gcp-instance/general)](https://www.bridgecrew.cloud/link/badge?vcs=github&fullRepo=JamesWoolfenden%2Fterraform-gcp-instance&benchmark=INFRASTRUCTURE+SECURITY)

## Usage

Add **module.instance.tf** to your code:-

```terraform
module "instance" {
  source             = "JamesWoolfenden/instance/gcp"
  version            = "0.1.13"
  image              = var.image
  name               = var.name
  network_interface  = var.network_interface
  project            = var.project
  service_email      = var.service_email
  source_cidrs       = var.source_cidrs
  zone               = var.zone
}
```

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| google | n/a |

## Modules

No Modules.

## Resources

| Name |
|------|
| [google_compute_instance](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_instance) |
| [google_service_account](https://registry.terraform.io/providers/hashicorp/google/latest/docs/data-sources/service_account) |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| account\_id | n/a | `any` | n/a | yes |
| common\_tags | n/a | `map(any)` | <pre>{<br>  "module": "terraform-gco-instance"<br>}</pre> | no |
| image | n/a | `string` | `"debian-cloud/debian-10"` | no |
| labels | n/a | `map` | <pre>{<br>  "jim": "a"<br>}</pre> | no |
| machine\_type | n/a | `string` | `"e2-medium"` | no |
| metadata | n/a | `map(any)` | <pre>{<br>  "block-project-ssh-keys": true<br>}</pre> | no |
| metadata\_startup\_script | (optional) describe your variable | `string` | `""` | no |
| name | n/a | `string` | `"instance-1"` | no |
| zone | n/a | `string` | `"us-central1-a"` | no |

## Outputs

No output.
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

## Information

## Related Projects

Check out these related projects.

- [terraform-aws-codecommit](https://github.com/jameswoolfenden/terraform-aws-codebuild) - Storing ones code

## Help

**Got a question?**

File a GitHub [issue](https://github.com/jameswoolfenden/terraform-aws-instance/issues).

## Contributing

### Bug Reports & Feature Requests

Please use the [issue tracker](https://github.com/jameswoolfenden/terraform-aws-instance/issues) to report any bugs or file feature requests.

## Copyrights

Copyright 2021 James Woolfenden

## License

[![License](https://img.shields.io/badge/License-Apache%202.0-blue.svg)](https://opensource.org/licenses/Apache-2.0)

See [LICENSE](LICENSE) for full details.

Licensed to the Apache Software Foundation (ASF) under one
or more contributor license agreements. See the NOTICE file
distributed with this work for additional information
regarding copyright ownership. The ASF licenses this file
to you under the Apache License, Version 2.0 (the
"License"); you may not use this file except in compliance
with the License. You may obtain a copy of the License at

<https://www.apache.org/licenses/LICENSE-2.0>

Unless required by applicable law or agreed to in writing,
software distributed under the License is distributed on an
"AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
KIND, either express or implied. See the License for the
specific language governing permissions and limitations
under the License.

### Contributors

[![James Woolfenden][jameswoolfenden_avatar]][jameswoolfenden_homepage]<br/>[James Woolfenden][jameswoolfenden_homepage]

[jameswoolfenden_homepage]: https://github.com/jameswoolfenden
[jameswoolfenden_avatar]: https://github.com/jameswoolfenden.png?size=150
[github]: https://github.com/jameswoolfenden
[linkedin]: https://www.linkedin.com/in/jameswoolfenden/
[twitter]: https://twitter.com/JimWoolfenden
[share_twitter]: https://twitter.com/intent/tweet/?text=terraform-aws-instance&url=https://github.com/jameswoolfenden/terraform-aws-instance
[share_linkedin]: https://www.linkedin.com/shareArticle?mini=true&title=terraform-aws-instance&url=https://github.com/jameswoolfenden/terraform-aws-instance
[share_reddit]: https://reddit.com/submit/?url=https://github.com/jameswoolfenden/terraform-aws-instance
[share_facebook]: https://facebook.com/sharer/sharer.php?u=https://github.com/jameswoolfenden/terraform-aws-instance
[share_email]: mailto:?subject=terraform-aws-instance&body=https://github.com/jameswoolfenden/terraform-aws-instance
