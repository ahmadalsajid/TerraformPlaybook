# TerraformPlaybook

---
Terraform practice codes following the O'RREILLY book `Terraform Up & Running`.

Steps:
Set AWS profile

```
export AWS_DEFAULT_PROFILE="YOUR_CONFIGURED_AWS_PROFILE"
```

Deploy the code:

First, we want to deploy the staging database. So, go to 
[stage/mysql](stage/data-stores/mysql/) and do

```
terraform init
terraform apply
```

After that, go to 
[stage/services/webserver-cluster](stage/services/webserver-cluster/) 
and, run `terraform get` to get the remote versioned modules locally 
and the rest are same.

```
terraform get
terraform init
terraform apply
```

Clean up when you're done, from each module, i.e. `stage/services/webserver-cluster`, 
`stage/mysql`:

```
terraform destroy
```