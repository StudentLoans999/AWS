My journey to complete Step 9 (using AWS Lambda's Function URL to accept requests from my web app and communicate with the database - to avoid communicating directly with DynamoDB).

Went to AWS Lambda and created a new Function that uses Python for the runtime and Enabled function URL (now don't have to use API Gateway) in the advanced settings (Use function URLs to assign HTTP(S) endpoints to your Lambda function)
Changed Auth type to NONE (Lambda won't perform IAM authentication on requests to your function URL. The URL endpoint will be public unless you implement your own authorization logic in your function)
Configured cross-origin resource sharing (CORS) in the advanced settings (Use CORS to allow access to your function URL from any origin.)

(Go to Configuration and make sure it is set like this:)
![image](https://github.com/StudentLoans999/AWS/assets/77641113/81ce1475-d427-4d9e-8ceb-a2439f10a7bf)
