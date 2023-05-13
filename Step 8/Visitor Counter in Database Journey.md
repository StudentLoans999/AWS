My journey to complete Step 8 (using AWS DynamoDB to store the Visitor Counter's count).

Below I listed the actions I took

***
## Action 1 
I started with taking the Developing with Amazon DynamoDB course on AWS https://explore.skillbuilder.aws/learn/course/1525/play;state=%255Bobject%2520Object%255D;autoplay=0

Actions 2-# are about that. Actions #+1 are about after I finished the course and worked on using DynamoDB for the CRC. 
***
## Action 2
All of the steps below I used with help from this (https://docs.aws.amazon.com/cloud9/latest/user-guide/vpc-settings.html?icmpid=docs_ac9_console#vpc-settings-requirements-subnets-view)

Created VPC (10.0.0.0/16)

![image](https://github.com/StudentLoans999/AWS/assets/77641113/8ff30d1a-9553-4759-a5d1-671b51406917)

Created Subnet (10.0.0.0/24)

![image](https://github.com/StudentLoans999/AWS/assets/77641113/1caa9e71-f0ec-4460-8609-04f9342947d9)


Associated Route Table with subnet

![image](https://github.com/StudentLoans999/AWS/assets/77641113/7f4ea8c4-2543-42ce-b76b-3b88a8e74400)


Created Internet Gateway and Attached it to the VPC

![image](https://github.com/StudentLoans999/AWS/assets/77641113/8e1cb95a-95b3-4045-b32e-0966e518ef54)

Edited Route Table to have a Route to igw (0.0.0.0/0 to igw)

![image](https://github.com/StudentLoans999/AWS/assets/77641113/09f75742-51eb-4994-bb07-51a20f2ffa08)

Created Cloud9 IED with the VPC and Subnet config from above

![image](https://github.com/StudentLoans999/AWS/assets/77641113/d5d032ed-8f72-4c93-969f-438c701b39c3)
***
## Action 3
In Cloud9, I ran "sudo yum -y update" in order to update packages (none were needed)

![image](https://github.com/StudentLoans999/AWS/assets/77641113/d4925fa8-8248-43fe-baf8-264828399805)

Then I ran "sudo pip3 install boto3" to install the AWS SDK for Python 

![image](https://github.com/StudentLoans999/AWS/assets/77641113/3d0ed25f-780a-4b92-8479-d5978542bf56)

