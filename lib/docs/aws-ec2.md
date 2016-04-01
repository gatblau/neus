## Amazon Web Services (AWS)

### AWS Account

To build any of the Neus EC2 blueprints requires an AWS account.  Go to the [AWS web site](http://aws.amazon.com/) and create an account.

Note: to set up MFA, download Authenticator (Windows phone) or Google Authenticator (Android or iOS), run the app and follow the MFA setup instructions on the AWS web site for virtual hardware.  A QR code will be provided that is scanned by the app to create an account that generates a 6 digit number that changes.  Enter two different codes from the app and MFA setup is completed.  When next logging in, after entering username and password, it will require a 6 digit code form the app to complete login.

This guide assumes that the steps below are carried out on a [Europa](http://github.com/gatblau/europa) environment.  After creating an AWS account, carry out the following steps:

1. Using the AWS web site:
    1. Create a user called `ec2-user`, download the credentials and save the csv file as this is needed later.
    2. Create a group called `ec2-group` and grant the group PowerUserAccess permission.
    3. Add the `ec2-user` to the `ec2-group`.
    4. Create a key pair called `ec2user` and save the `ec2user.pem` file to the Europa environment.

2. Using the Europa environment:
    1.  Set the following environment variables, using the values in the `ec2-user` credentials csv file:

    `AWS_ACCESS_KEY_ID` - set to the *Access Key Id* value

    `AWS_SECRET_ACCESS_KEY` - set to the *Secret Access Key* value

    2. Change the file permissions of the `ec2user.pem` file to 0600 and then copy it to the `neus/lib/keys` directory.

## Elastic Cloud Compute (EC2)

### Ansible EC2 Prerequisites

To use the Ansible [ec2 module](http://docs.ansible.com/ansible/ec2_module.html), ensure that the following requirements are met on the host environment:

* python >= 2.6
* boto

### Accessing EC2 Instances

The AWS EC2 instances web site will provide details of how to ssh onto a running EC2 instance.  From the EC2 dashboard, select the instance and click on `Connect`.  A pop up window will give the syntax to ssh on to the EC2 instance.  The example below shows the syntax:

`ssh -i "ec2user.pem" ec2-user@ec2-54-171-132-208.eu-west-1.compute.amazonaws.com`

Note: using a terminal, change to the directory of the `e2cuser.pem` key pair file before entering the command.

### Troubleshooting

**Authentication**

If the scripts terminate with an authentication error, then check that the key environment variables `AWS_ACCESS_KEY_ID` and `AWS_SECRET_ACCESS_KEY` are set correctly.