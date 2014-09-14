Example SSL Certificates
========================

This directory contains dummy SSL certificates for use in testing
the CloudFormation templates. Do not use these certificates in production!

Uploading to AWS IAM
--------------------

Here's how you upload the certificate and key to AWS IAM. When uploading
a real certificate, of course, you also need the certificate chain,
specified as `--certificate-chain`. (For the example certificate, we
don't care.)

```
$ aws iam upload-server-certificate --server-certificate-name chef.example.com --certificate-body file:///path/to/chef.example.com.crt --private-key file:///path/to/chef.example.com.key
{
    "ServerCertificateMetadata": {
        "ServerCertificateId": "ASCAZZZZZZZZZZZZZZZZZ",
        "ServerCertificateName": "chef.example.com",
        "Expiration": "2034-09-09T02:55:30Z",
        "Path": "/",
        "Arn": "arn:aws:iam::000000000000:server-certificate/chef.example.com",
        "UploadDate": "1970-01-01T00:00:00.000Z"
    }
}
```

Record the ARN field. That's what the templates take as input.

References
----------

This is a cheat sheet. For a fuller explanation, read Amazon's documentation: http://docs.aws.amazon.com/ElasticLoadBalancing/latest/DeveloperGuide/ssl-server-cert.html
