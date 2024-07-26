# TerraformPlaybook

---
Terraform practice codes following the O'RREILLY book `Terraform Up & Running`.

Steps:
Set AWS profile

```
export AWS_DEFAULT_PROFILE="YOUR_CONFIGURED_AWS_PROFILE"
```

Deploy the code:

```
terraform init
terraform apply
```

Check the workspace

```
$ terraform workspace show
default
```

Create new workspace

```
$ terraform workspace new example1
Created and switched to workspace "example1"!
```

Again, deploy the code for new workspace:

```
terraform init
terraform apply
```

List all the workspaces

```
$ terraform workspace list
default
example1
```

Switch between them at any time using the `terraform workspace select` command:

```
$ terraform workspace select example1
Switched to workspace "example1".
```

Clean up when you're done, switch to each workspace and do:

```
terraform destroy
```