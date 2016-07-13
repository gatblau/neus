## Amazon Web Services (AWS)

See [setting up with Amazon EC2](http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/get-set-up-for-amazon-ec2.html) for the following:

1. Sign Up for AWS
   * see [below](#mfa) for multi-factor authentication
2. Create an IAM User
   * download the user credentials and save the csv file as this is needed later.
3. Create a Key Pair
   * save the `ec2user.pem` file and set its permission to 0400
4. Create a Virtual Private Cloud (VPC)
5. Create a Security Group
   * add the user from step 1 to the security group

Throughout the neus scripts, the following values are used:

* AWS IAM user name `ec2user`
* AWS security group name `ec2group`
* EC2 key pair name `ec2user`

### <a name="mfa"></a> AWS Account MFA

Once an AWS account has been created, it is recommended the multi-factor authentication (MFA) is set up.  To set up MFA, download Authenticator (Windows phone) or Google Authenticator (Android or iOS), run the app and follow the MFA setup instructions on the AWS web site for virtual hardware.  A QR code will be provided that is scanned by the app to create an account that generates a 6 digit number that changes.  Enter two different codes from the app and MFA setup is completed.  When next logging in, after entering username and password, it will require a 6 digit code form the app to complete login.

### Europa Environment Setup

This guide assumes that the prerequisites below are carried out using a [Europa](http://github.com/gatblau/europa) environment.

| Step | Description |
|--------|--------|
| Install Python | Version must be >= 2.6 (already installed on Europa)       |
| Install Boto | Boto is required by the Ansible ec2 module.  To install it, carry out the following:</br> `sudo pip install --upgrade pip` </br> `sudo pip install boto` |
| Dynamic Inventory | Create the `/etc/ansible` folder and set its permissions to 0777. Download the `ec2.py` and `ec2.ini` files from the [Amazon](https://aws.amazon.com/blogs/apn/getting-started-with-ansible-and-dynamic-amazon-ec2-inventory-management) web site, and save them to the `/etc/ansible` folder. |
| Key Pair | Copy the `ec2user.pem` key pair file to `~/.ssh/keys` and set its file permissions to 0400. |
| Environment Variables | Set the following environment variables in the europa user `.bash_profile` file:</br>`export AWS_ACCESS_KEY_ID=<your-access-key>`</br>`export AWS_SECRET_ACCESS_KEY=<your-secret-key>`</br>`export ANSIBLE_HOSTS=/etc/ansible/ec2.py`</br>`export EC2_INI_PATH=/etc/ansible/ec2.ini` |
| Shell Agent | Create a shell agent:</br>`ssh-agent bash`</br>` ssh-add ~/.ssh/ec2user.pem` |
| Host Key Checking | To turn off host key checking for EC2 instances, edit/create the `~/.ssh/config` file and add the following lines:</p>`Host ec2-*.compute.amazonaws.com`</br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;`StrictHostKeyChecking no`</p> and set the file permissions to 0400. |


## Elastic Cloud Compute (EC2)

### Accessing EC2 Instances

The AWS EC2 instances web site will provide details of how to ssh onto a running EC2 instance.  From the EC2 dashboard, select the instance and click on `Connect`.  A pop up window will give the syntax to ssh on to the EC2 instance.  The example below shows the syntax:

`ssh -i "ec2user.pem" ec2-user@ec2-54-171-132-208.eu-west-1.compute.amazonaws.com`

Note: change to the directory of where the `e2cuser.pem` key pair file is stored before entering the command in a terminal window.

### Troubleshooting

-  If the scripts terminate with an authentication error, then check that the key environment variables `AWS_ACCESS_KEY_ID` and `AWS_SECRET_ACCESS_KEY` are set correctly.

- The scripts will not run if the file permissions for the `ec2user.pem` file are not set to 0700.