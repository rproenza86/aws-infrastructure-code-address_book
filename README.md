# Address Book Web App infrastructure code
> LAMP APP using Amazon Virtual Private Cloud (VPC)

Terraform scripts to build the AWS environment where to deploy and release "Address Book", a LAMP application.

```
Tested using:

Terraform v0.11.10
+ provider.aws v1.42.0
```

### Infrastructure details

* Create Virtual Private Cloud(VPC)
* Create a public and private subnets
* Create an Internet Gateway
* Create a Route Table and add a route to the Internet
* Create a security group for the web server to only allow HTTP inbound traffic from Internet
* Create a security group for the MySQL RDS instance server to only allow MySQL inbound traffic from the web server subnet
* Deploy web server and a MySQL RDS instance
* Configure application to connect to the MySQL RDS instance

## How to use

### Pre-requirement: Set AWS environment variables
```
$ export TF_VAR_access_key=<your_key>

$ export TF_VAR_secret_key=<your-secret>

$ export TF_VAR_region=<your_region>
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

When applied the configuration `terraform` will show us the next output:

```
Outputs:

db_endpoint = terraform-20181102155541101800000001.cfi372mmcqsi.us-east-1.rds.amazonaws.com:3306
web_server_public_ip = 18.209.111.9
```

Use the `db_endpoint` and `web_server_public_ip` for the next steps.

### Open the Address Book Web App page

Find on EC2 the "IPv4 Public IP" address(`web_server_public_ip`) of the "Web Server" instance and open it in a web browser.

### Login in the web app and try some CRUD operations

Find the DB endpoint( `db_endpoint`) on the "Connect" section of the RDS mysql created instance.

Using the DB endpoint and credentials(can be found on the 9-rdsDbResources.tf file) login in the app.

Create, edit or remove contacts to test the web app.
