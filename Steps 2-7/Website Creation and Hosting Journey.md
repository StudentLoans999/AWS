***
Summary:


***
My journey to complete Step 2-7 (creating and hosting a static website).

Below I listed the actions I took
***
Step 1 ; Registered a domain (davidrichey.org) using Route 53 in AWS (https://docs.aws.amazon.com/Route53/latest/DeveloperGuide/domain-register.html)
***

Step 2 ; Created a bucket in AWS called resume.davidrichey.org (needed to put the domain in the name so that DNS can route to the bucket in a later step) (https://docs.aws.amazon.com/AmazonS3/latest/userguide/HostingWebsiteOnS3Setup.html)
  
  Enabled Static Website hosting.
  
  Created index.html ,  error.html , styleIndex.css , and styleError.css using codepen.io (make sure to save the styleIndex.css file in the same folder as index.html and the styleError.css file in the same place as error.html) and put this code in the .html so it links to the css file:
  ![image](https://github.com/StudentLoans999/AWS/assets/77641113/342d1c61-d7bb-4448-817b-340d4800093a)


***

Step 3 ; In Route 53, added an A Record in the Hosted zone of the domain created earlier, with the name resume (to match the bucket name) - this way the Bucket website endpoint (found in Proeprties of the bucket) url changes from http://resume.davidrichey.org.s3-website-us-east-1.amazonaws.com to http://resume.davidrichey.org/

![image](https://github.com/StudentLoans999/AWS/assets/77641113/e8e85214-327d-4f87-86f5-9a76949812ba)

***
Step 4 ; In 
