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
    <td><strong>ECDownloadURL</strong></td>
    <td>String</td>
    <td>The download URL for the Enterprise Chef package provided by Opscode</td>
    <td><em>nil</em></td>
  </tr>
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
The following command will create a new stack named **ec-aws-poc** in the **us-west-2** region. **Note:** You will need to either set environment variables for the <tt>$AWS_ACCESS_KEY</tt> and <tt>$AWS_SECRET_KEY</tt> values or enter them directly on the command line.

```
cfn-create-stack ec-aws-poc --region us-west-2 --template-file ec-standalone-2.template -K ../ec-aws-poc.pem -p "KeyName=ec-aws-poc;ECDownloadURL=http://s3.amazonaws.com/opscode-private-chef/ubuntu/10.04/x86_64/private-chef_1.4.6-1.ubuntu.10.04_amd64.deb?AWSAccessKeyId=AKIAJFEFN6I3YE4UAMLA&Expires=1378648806&Signature=zvOL4xmP4Ac2TMkKpOky%2B3xcjKw%3D;InstanceType=c1.medium;SSHLocation=0.0.0.0/0" -I $AWS_ACCESS_KEY -S $AWS_SECRET_KEY --capabilities CAPABILITY_IAM
```

Using the Knife CloudFormation Plugin
-------------------------------------

There is also a [knife-cfn](https://github.com/neillturner/knife-cfn) plugin that will allow you to validate and create stacks using Knife.

```
knife cfn create yourstackname -p "KeyName=yourkey;ECDownloadURL=http://your-ec-download-url.com;SSHLocation=1.2.3.4/32" -f ec-standalone-centos-6-amd64_ebs.template --capabilities CAPABILITY_IAM
```

Using the AWS Management Console
--------------------------------
TODO

Templates
=========
ec-standalone-ubuntu-10.04-amd64_ebs.template - Installs EC in standalone mode on an EBS-backed Ubuntu 10.04 instance.
ec-standalone-centos-6-amd64_ebs.template - Installs EC in standalone mode on an EBS-backed CentOS 6 instance. The images in use are the ones from [Bashton](http://www.bashton.com/) since they include cloud-init
ec-standalone-centos-6-amd64_ebs_s3bookshelf.template - Same as the CentOS6 template only this will set up EC to use S3 buckets for the bookshelf.
