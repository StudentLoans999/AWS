My journey to complete Step 8 (using AWS DynamoDB to store the Visitor Counter's count).

Below I listed the actions I took

***
## Action 1 
I started with taking the Developing with Amazon DynamoDB course on AWS https://explore.skillbuilder.aws/learn/course/1525/play;state=%255Bobject%2520Object%255D;autoplay=0

Actions 2-# are about that. Actions #+1 are about after I finished the course and worked on using DynamoDB for the CRC. 
***
## Action 2
Created VPC (10.0.0.0/24)
Created Subnet (10.0.0.0/24)
Created Internet Gateway and Associated it to the VPC
Edited Route Table to have a Route to igw (0.0.0.0/24 to igw)
Created Cloud9 with the VPC and Subnet config from above
https://docs.aws.amazon.com/cloud9/latest/user-guide/vpc-settings.html?icmpid=docs_ac9_console#vpc-settings-requirements-subnets-view 
***
## Action 3



