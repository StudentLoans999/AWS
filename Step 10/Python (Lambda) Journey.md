In the Lambda function [[lambda_function.py]()](https://github.com/StudentLoans999/AWS/blob/3b9fce86c85139a23723cdb854b789607a4a2831/Step%2010/lambda_function.py) I wrote some python code in the Code tab that gets from the table created - the id and views - and then adds 1 to the views and shows it, then updates the table with the new views count. I then deployed that code.

![image](https://github.com/StudentLoans999/AWS/assets/77641113/48abaa9b-ac0f-432e-9cc0-535ba2bf43e6)

I then went to the Configuration tab and attached the AmazonDynamoDBFullAccess permission to the Lambda function's role (Lambda-CRC-API-role-wqf058a3) in the Permissions section.

![image](https://github.com/StudentLoans999/AWS/assets/77641113/bed286da-abd4-4618-a4aa-df4bcd8f97eb)
![Uploading image.png…]()
