My journey to complete Step 8 (using AWS DynamoDB to store the Visitor Counter's count).

Below I listed the actions I took

***
# Summary: #
**Action 1 - Started the AWS course: Developing with Amazon DynamoDB**

**Action 2 - Created Cloud9 and all the other services needed for it**

**Action 3 - Installed AWS SDK for Python in Cloud9**

**Action 4 - Set up DynamoDB Local**

**Action 5 - Interacted with DynamoDB using AWS CLI**

**Action 6 - Interacted with DynamoDB using AWS SDK**
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
***
## Action 4
In Cloud9, below is what I did for setting up DynamoDB Local

Installed Docker to the system by running "docker pull amazon/dynamodb-local" (amazon/dynamodb-local is the image)

![image](https://github.com/StudentLoans999/AWS/assets/77641113/f245bb3b-ecd6-4385-9f10-b4e5d317d6f7)

Started dynamoDB by running "docker run -p 8000:8000 amazon/dynamodb-local" http://localhost:8000/ is the endpoint url (8000 is the port)

![image](https://github.com/StudentLoans999/AWS/assets/77641113/d9b533e9-eb97-41d3-a1fc-80ca297b5418)

Put in access key by using "aws onfigure" (must have AWS CLI installed) - I already had my access key info configured.
***
## Action 5
In Cloud9, below is the AWS CLI I did for interacting with DynamoDB (here is a good source of info https://docs.aws.amazon.com/cli/latest/reference/dynamodb/create-table.html)

KeyType of HASH is the partition key (unique) ; KeyType of RANGE is the sort key (optional, can only have one) ; Having both makes the unique identifier the combination of the HASH and RANGE.

AttributeType of N is number ; AttributeType of S is string.

Other parameters that can be used: --region us-east 1 ; (if using DyanmoDB LocaL) --endpoint-url http://localhost:8000

<br></br>
**To Create a DynamoDB table :**

    aws dynamodb create-table ^

      --table-name Movies ^

      --key-schema ^

       AttributeName=year,KeyType=HASH ^

       AttributeName=title,KeyType=RANGE ^

       --attribute-definitions ^

       AttributeName=year,AttributeType=N ^

       AttributeName=title,AttributeType=S ^

       --billing-mode PAY_PER_REQUEST
  
  ![image](https://github.com/StudentLoans999/AWS/assets/77641113/cf218796-e881-4b85-8fee-489a600f74f5)

**To Write an item into a DynamoDB table :**

    aws dynamodb put-item ^

      --table-name Movies ^

      --item "{\"year\": {\"N\": \"1900\"}, \"title\": {\"S\": \"Example 1\"}}"
  
<br></br>
**To Query a DynamoDB table (uses the partition key to retrieve specific items)  :** 

    aws dynamodb query ^

      --table-name Movies ^

      --key-condition-expression "#y = :yr" ^

      --projection-expression "title" ^

      --expression-attribute-names "{\"#y\":\"year\"}" ^

      --expression-attribute-values "{\":yr\":{\"N\":\"1985\"}}"
  
<br></br>
**To scan a DynamoDB table (reads the full table) :**

    aws dynamodb scan ^

      --table-name Movies ^

      --filter-expression "title = :name" ^

      --expression-attribute-values "{\":name\":{\"S\":\"Back to the Future\"}}" ^

      --return-consumed-capacity "TOTAL"
***
## Action 6
In Cloud9, below is the AWS SDK for Python I did for interacting with DynamoDB (here is a good source of info https://docs.aws.amazon.com/code-library/latest/ug/python_3_dynamodb_code_examples.html)

<br></br>
**To Create a DynamoDB table :**

    def create_movie_table(dynamodb=None):
      if not dynamodb:
        dynamodb = boto3.resource('dynamoodb')
    
    table = dynamodb.create_table
    (
      TableName='Movies',
      KeySchema=
      [
        {
          'AttributeName': 'year',
          'KeyType': 'HASH' # Partition key
        },
        {
          'AttributeName': 'title',
          'KeyType': 'RANGE' # Sort key
        }
      ],
      AttributeDefinitions=
      [
        {
          'AttributeName': 'year',
          'AttributeType': 'N'
        },
        {
          'AttributeName': 'title',
          'AttributeType': 'S'
        },
      ],
      ProvisionedThroughput=
      {
        'ReadCapacityUnits': 10,
        'WriteCapacityUnits': 10
      }
    }
    return table
