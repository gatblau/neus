# Amazon Web Services (AWS)

## Elastic Cloud Compute (EC2)

### Ansible EC2 Prerequisites

To use the Ansible [ec2 module](http://docs.ansible.com/ansible/ec2_module.html), ensure that the following requirements are met on the host environment:

* python >= 2.6
* boto

### EC2 Blueprints

To build any of the Neus EC2 blueprints requires an AWS account.  Go to the [AWS web site](http://aws.amazon.com/) and create an account.
    
Note: to set up MFA, download Authenticator (Windows phone) or Google Authenticator (Android or iOS), run the app and follow the MFA setup instructions on the AWS web site for virtual hardware.  A QR code will be provided that is scanned by the app to create an account that generates a 6 digit number that changes.  Enter two different codes from the app and MFA setup is completed.  When next logging in, after entering username and password, it will require a 6 digit code form the app to complete login.

Once an account has been created, carry out the following steps:

1.  Create a user called ec2-user, download the credentials and save the csv file as this is needed later.
2.  Create a group called ec2-group and grant the group PowerUserAccess permission.
3.  Add the ec2-user to the ec2-group.
4.  Set the following environment variables, using the values in the user credentials csv file:

    `AWS_ACCESS_KEY_ID` - set to the Access Key Id value
    
    `AWS_SECRET_ACCESS_KEY` - set to the Secret Access Key value

5.  Create a key pair called ec2user and save the ec2user.pem file.  Change the file permissions to 0600 and then copy it to the `neus/lib/keys` directory.

### Troubleshooting

**Authentication**

If the scripts terminate with an authentication error, then check that the key environment variables `AWS_ACCESS_KEY_ID` and `AWS_SECRET_ACCESS_KEY` are set correctly.