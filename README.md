# sample-terraform-symlink

An example terraform project for multiple environments.

Supposed terraform version: `v0.10+`

This example does not use terraform's [Workspace](https://www.terraform.io/docs/state/workspaces.html) feature.

Instead, this shares some settings as symlinks.
The real files are located in `shared/` or `dev/` or `prod/` directories.

# Usage

Example:

```sh
cd dev/infra
terraform init # for the 1st time only
terraform apply
```

Some variables must be configured before execution.

# See Also

- [TerraformでWorkspaceを使わずに複数環境をDRYに設定する - Qiita](https://qiita.com/progrhyme/items/766d02e605358ad2930e)
