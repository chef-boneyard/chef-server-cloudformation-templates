A word of warning...
====================
The code in this repository is not actively maintained and may not work as expected.  For the latest versions of Chef Server and Chef Automate please visit www.chef.io and follow the installation instructions there.


This repository contains AWS Cloudformation templates for installing Chef Server 12 in various configurations. You can read more about AWS Cloudformation [here](http://aws.amazon.com/cloudformation/).

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

Note: The templates are set up assuming the `us-east-1` region. Your S3 endpoints may change if you are deploying into another region (e.g. substitute `s3-us-west-2.amazonaws.com` for `s3.amazonaws.com` if in us-west-2)

Using the AWS Management Console
--------------------------------

You may also upload the templates to the AWS Management Console and create stacks from there.

Templates
=========

Standalone
----------

`standalone-centos6_amd64.json` installs Chef Server 12 on an EBS-backed CentOS6 instance. Stores cookbooks in S3. The images in use are the ones from [Bashton](http://www.bashton.com/) since they include cloud-init.

Tiered
------

`tiered-centos-6_amd64.json` installs Chef Server 12 in tiered mode (single backend, multiple frontends in an autoscaling group)

To set up tiered, you need to perform a few additional steps in advance:

* Place your server SSL certificate and key on an HTTP server reachable by the bootstrap instance. (It would be possible to modify the template so these keys are retrieved from an S3 bucket, but this is left as an exercise to the reader.)
* Upload the SSL certificate and key you wish to use on the frontend Elastic Load Balancer to AWS IAM, and record the ARN.

Note that the stack name has to be 35 characters or less, otherwise the OpenSSL CN will be too long and nginx won't be able to generate a certificate.

High-Availability
-----------------

Coming soon

License & Authors
-----------------
- Author:: Julian C. Dunn (<jdunn@getchef.com>)

```text
Copyright:: 2013-2014 Chef Software, Inc.

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
```
