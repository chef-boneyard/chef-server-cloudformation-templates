This repository contains AWS Cloudformation templates for installing Enterprise Chef in various configurations. You can read more about AWS Cloudformation [here](http://aws.amazon.com/cloudformation/).

How To Use These Templates
==========================
You can use Cloudformation templates on AWS through either the [management console](https://console.aws.amazon.com/cloudformation/home) or the command line (provided you have installed the [cloudformation command line tools](http://aws.amazon.com/developertools/2555753788650372)).

Template Variables
------------------
Each template takes four variables that need to be provided when a new stack is created.

<table>
  <tr>
    <th>Key</th>
    <th>Example</th>
    <th>Description</th>
    <th>Default</th>
  </tr>
  <tr>
    <td><strong>KeyName</strong></td>
    <td>ec-aws-poc</td>
    <td>The name of the private keypair to use</td>
    <td><em>nil</em></td>
  </tr>
  <tr>
    <td><strong>InstanceType</strong></td>
    <td>String</td>
    <td>The instance type to be used.</td>
    <td><em>c1.medium</em></td>
  </tr>
  </tr>
  <tr>
    <td><strong>SSHLocation</strong></td>
    <td>String</td>
    <td>CIDR for what IP ranges can SSH into the instance.</td>
    <td><em>0.0.0.0/0</em></td>
  </tr>
</table>


Using Command Line Tools
------------------------
The following command will create a new standalone stack named **ec-aws-poc** using the `aws` command-line tool. This assumes you have $HOME/.aws/config set up correctly:

```
aws cloudformation create-stack --stack-name ec-aws-poc --template-body file:///Users/You/path/to/chef-server-cloudformation-templates/standalone/ec-standalone-centos-6-amd64_ebs_s3cookbooks.template --parameters ParameterKey=KeyName,ParameterValue=your-aws-ssh-key-name --capabilities CAPABILITY_IAM
```

Using the AWS Management Console
--------------------------------

You may also upload the templates to the AWS Management Console and create stacks from there.

Templates
=========

Standalone
----------

ec-standalone-ubuntu-10.04-amd64_ebs.template - Installs EC in standalone mode on an EBS-backed Ubuntu 10.04 instance.
ec-standalone-centos-6-amd64_ebs.template - Installs EC in standalone mode on an EBS-backed CentOS 6 instance. The images in use are the ones from [Bashton](http://www.bashton.com/) since they include cloud-init
ec-standalone-centos-6-amd64_ebs_s3bookshelf.template - Same as the CentOS6 template only this will set up EC to use S3 buckets for the bookshelf.

Tiered
------

* ec-tiered-centos-6-amd64_vpc_ebs_s3_cookbooks.template - Installs EC in tiered mode. Note that the stack name has to be 35 characters or less, otherwise the OpenSSL CN will be too long and EC won't be able to generate a certificate.

High-Availability
-----------------

Coming soon
