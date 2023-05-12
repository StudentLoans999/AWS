My journey to complete Step 2-7 (creating and hosting a static website that uses HTTPS with a custom DNS domain name and visitor counter).

Below I listed the actions I took (I didn't list all the trouble I had trying to make this all work - like in Step 3 I tried Stacks A and C from the website without success)

***
# Summary: #
**Step 1 - Registered a domain (davidrichey.org) using Route 53 in AWS**

**Step 2 - Created a bucket in AWS called davidrichey.org (needed to put the domain in the name so that DNS can route to the bucket in a later step) with some settings set**

**Step 3 - Created a Stack that created a CloudFront distribution by using the bucket created earlier**

**Step 4 - Changed the settings of the CloudFront distribution to be viewed correctly (https)**

**Step 5 - Created a Public Certificate and added a CNAME Record in the Route 53 domain for it**

**Step 6 - Added an Alternative domain name to the CloudFront distribution and associated the Public Certificate to it**

**Step 7 - Added an A record in Route 53 for the domain to rotue point the CloudFront distribution traffic to the Alternative domain name**
***

## Step 1 
Registered a domain (davidrichey.org) using Route 53 in AWS (https://docs.aws.amazon.com/Route53/latest/DeveloperGuide/domain-register.html)
***
## Step 2
Created a bucket in AWS called davidrichey.org (needed to put the domain in the name so that DNS can route to the bucket in a later step) (https://docs.aws.amazon.com/AmazonS3/latest/userguide/HostingWebsiteOnS3Setup.html)
  
  Created index.html, error.html, and style.css using codepen.io - uploaded them in the bucket's root path (can't be in a folder) (make sure to upload the style.css file in the same place as index.html and put this code in index.html so it links to the css file):
  ![image](https://github.com/StudentLoans999/AWS/assets/77641113/342d1c61-d7bb-4448-817b-340d4800093a)
  
  Enabled Static Website hosting with the Index document set as index.html and the Error document set as error.html
  
  Created a bucket policy to give permission to use the bucket (read the .html files)
  {
    "Version": "2012-10-17",
    "Statement": [
        {
            "Sid": "PublicRead",
            "Effect": "Allow",
            "Principal": "*",
            "Action": "s3:GetObject",
            "Resource": "arn:aws:s3:::davidrichey.org/*"
        }
    ]
}
  
  Created a bucket policy to give permission to use the bucket (read the .html files)
  
  Unblocked all Public access to bucket, so that is accessible to the public
***
## Step 3 
Used this website to make the S3 website URL use HTTPS and followed the steps for Stack B - didn't do Steps 4) and 5) since they don't apply since I already created a bucket policy and chose not to enable OAI: (https://aws.amazon.com/blogs/networking-and-content-delivery/amazon-s3-amazon-cloudfront-a-match-made-in-the-cloud/)
  
  To do Step 7), I did the steps below
***
## Step 4
I went to the newly created CloudFront distribution and edited the Behavior to these settings (guided by arpanexe's answer here: https://stackoverflow.com/questions/36466092/custom-domain-for-api-gateway-returning-403)

![image](https://github.com/StudentLoans999/AWS/assets/77641113/83259752-f2cb-4a1b-8d55-2595c7e9cd3f)

  Then I went into Invalidations and had it set to affect every object (clears the cache, in case it was needed)
  ![image](https://github.com/StudentLoans999/AWS/assets/77641113/a84b88c8-bff0-4c4f-a0a5-2fe0dc366696)
***
## Step 5
I then went to AWS Certificate Manager and requested a Public Certificate that I could use for https (I put in the domain name: davidrichey.org). 
  
  (https://docs.aws.amazon.com/acm/latest/userguide/gs-acm-request-public.html)
  
  After I requested it, I refreshed the console window and a new option appeared to create a DNS Validation in Route 53, so I clicked it in order for the request to be validated.
  
  ![image](https://github.com/StudentLoans999/AWS/assets/77641113/913731f5-7bed-4e1b-a7bb-1939bea732b7)

  (https://docs.aws.amazon.com/acm/latest/userguide/dns-validation.html)
  
  This created a new CNAME record:
  ![image](https://github.com/StudentLoans999/AWS/assets/77641113/3b6d7927-1e05-4288-bfbf-dd30e14b28cb)
***
## Step 6
I went back to the CloudFront distribution and in the General menu, I edited the Settings to create an Alternate domain name (CNAME) with the value of davidrichey.org (since the CloudFront domain name is actually whatever it was created as, it will follow this kind of name format .cloudfront.net)
  
  ![image](https://github.com/StudentLoans999/AWS/assets/77641113/d73f8087-8b77-42e0-9f09-e490660e0350)
  
  I also associated the certificate I created earlier.
  
  Make sure IPv6 is set to Off, since having it On will add extra steps - this post should help with this step and the next if you get stuck, and offers the additional steps if you do use IPv6 (https://docs.aws.amazon.com/AmazonCloudFront/latest/DeveloperGuide/CNAMEs.html)
  ![image](https://github.com/StudentLoans999/AWS/assets/77641113/8274cd55-51c2-4046-bcd7-54094149a6e7)
  
  Make sure the distribution changes have finished deploying before moving to the next step
## Step 7
This step is also Step 7 in the link I posted above.

  In Route 53, I added an A Record in the Hosted zone of the domain created earlier, with the name davidrichey.org that routes traffic to the CloudFront distribution's domain name (the .cloudfront.net looking name) 
  
  ![image](https://github.com/StudentLoans999/AWS/assets/77641113/ee16abb3-8fe2-4e65-a94c-cb87e4320a7c)
  
  (this post has good info: https://docs.aws.amazon.com/Route53/latest/DeveloperGuide/routing-to-cloudfront-distribution.html)
  
  Give it a few minutes to apply and then in a new window, open davidrichey.org and make sure it displays properly and is https (Google Chrome shows it as a lock symbol).
  If it doesn't, one of the steps above didn't get completed correctly. In the link above, step 8 says to use dig on your domain and that it should show CNAME but mine doesn't (I tried doing Step 7 here as a CNAME Record instead of an A Record and it didn't work - this offers an explanation: https://docs.aws.amazon.com/Route53/latest/DeveloperGuide/resource-record-sets-choosing-alias-non-alias.html)
  
  ![image](https://github.com/StudentLoans999/AWS/assets/77641113/625788bc-9d51-44d7-b318-cf80876b9b52)

# Final product:
https://davidrichey.org/ aka davidrichey.org

![image](https://github.com/StudentLoans999/AWS/assets/77641113/90024662-4a40-4334-8747-477aa276360c)

Additional info:

How I setup HTTPS (Behavior section on CloudFront) -
https://docs.aws.amazon.com/AmazonCloudFront/latest/DeveloperGuide/using-https-viewers-to-cloudfront.html

How I created CloudFront distribution (my own resume bucket - bucket endpoint & S3 website endpoint) -
https://repost.aws/knowledge-center/cloudfront-serve-static-website
