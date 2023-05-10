***
Summary:


***
My journey to complete Step 2-7 (creating and hosting a static website).

Below I listed the actions I took
***
Step 1 ; Registered a domain (davidrichey.org) using Route 53 in AWS (https://docs.aws.amazon.com/Route53/latest/DeveloperGuide/domain-register.html)
***

Step 2 ; Created a bucket in AWS called myresume.davidrichey.org (needed to put the domain in the name so that DNS can route to the bucket in a later step) (https://docs.aws.amazon.com/AmazonS3/latest/userguide/HostingWebsiteOnS3Setup.html)
  
  Enabled Static Website hosting with the Index document set as index.html and the Error document set as error.html
  
  Created index.html, error.html, and style.css using codepen.io - uploaded them in the bucket root path (can't be in a folder) (make sure to upload the style.css file in the same place as index.html and put this code in the .html so it links to the css file:
  ![image](https://github.com/StudentLoans999/AWS/assets/77641113/342d1c61-d7bb-4448-817b-340d4800093a)


***

Step 3 ; In Route 53, added an A Record in the Hosted zone of the domain created earlier, with the name resume (to match the bucket name) - this way the Bucket website endpoint (found in Proeprties of the bucket) url changes from http://myresume.davidrichey.org.s3-website-us-east-1.amazonaws.com to http://myresume.davidrichey.org/

![image](https://github.com/StudentLoans999/AWS/assets/77641113/02310990-be91-4179-88db-0fc15b0bd27f)

***
Step 4 ; Now we are on the fifth part of the CRC. 
