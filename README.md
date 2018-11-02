# Address Book Web App infrastructure code
> LAMP APP using Amazon Virtual Private Cloud (VPC)

Terraform scripts to build the AWS environment where to deploy and release "Address Book", a LAMP application.

```
Tested using:

Terraform v0.11.10
+ provider.aws v1.42.0
```

## How to use

### Pre-requirement: Set AWS environment variables
```
$ export AWS_ACCESS_KEY_ID=<your_key>

$ export AWS_SECRET_ACCESS_KEY=<your-secret>

$ export AWS_DEFAULT_REGION=<your_region>
```

### Initialize a working directory

`$ cd lamp_intrastructure/`

`$ terraform init`

### Create an execution plan

`$ terraform plan`

### Apply the changes required to reach the desired state of the configuration

`$ terraform apply`

### Delete infrastructure
> Before to run command delete manually the RDS mysql instance(you will be prompt with securities questions)

`$ terraform destroy`

## How to test?

### Open the Address Book Web App page

Find on EC2 the "IPv4 Public IP"address of the "Web Server" instance and open it in a web browser.

### Login in the web app and try some CRUD operations

Find the DB endpoint on the "Connect" section of the RDS mysql created instance.

Using the DB endpoint and credentials(can be found on the 9-rdsDbResources.tf file) login in the app.

Create, edit or remove contacts to test the web app.
