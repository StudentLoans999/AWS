My journey to complete Step 2-7 (creating and hosting a static website that uses HTTPS with a custom DNS domain name and visitor counter).

Below I listed the actions I took (I didn't list all the trouble I had trying to make this all work - like in Step 3 I tried Stacks A and C from the website without success)

***
# Summary: #
**Step 1 - Registered a domain (davidrichey.org) using Route 53 in AWS**

**Step 2 - Created a bucket in AWS called davidrichey.org (needed to put the domain in the name so that DNS can route to the bucket in a later step) with some settings set**

**Step 3 -**

**Step 4 -**

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
I went to the newly created CloudFront Distribution and edited the Behavior to these settings (guided by arpanexe's answer here: https://stackoverflow.com/questions/36466092/custom-domain-for-api-gateway-returning-403)

![image](https://github.com/StudentLoans999/AWS/assets/77641113/83259752-f2cb-4a1b-8d55-2595c7e9cd3f)

  Then I went into Invalidations and had it set to affect every object (clears the cache)
***
## Step 5
In Route 53, added an A Record in the Hosted zone of the domain created earlier, with the name resume (to match the bucket name) - this way the Bucket website endpoint (found in Proeprties of the bucket) url changes from http://myresume.davidrichey.org.s3-website-us-east-1.amazonaws.com to http://myresume.davidrichey.org/

![image](https://github.com/StudentLoans999/AWS/assets/77641113/02310990-be91-4179-88db-0fc15b0bd27f)

**********************

How I setup HTTPS (Behavior section on CloudFront) -
https://docs.aws.amazon.com/AmazonCloudFront/latest/DeveloperGuide/using-https-viewers-to-cloudfront.html

How I created CloudFront distribution (my own resume bucket - bucket endpoint & S3 website endpoint) -
https://repost.aws/knowledge-center/cloudfront-serve-static-website

How I setup alternate domain names (CloudFront distribution) -
https://docs.aws.amazon.com/AmazonCloudFront/latest/DeveloperGuide/CNAMEs.html

How I setup to route the domain to the CloudFront distribution -
https://docs.aws.amazon.com/Route53/latest/DeveloperGuide/routing-to-cloudfront-distribution.html

More info on Domain records -
https://docs.aws.amazon.com/Route53/latest/DeveloperGuide/resource-record-sets-choosing-alias-non-alias.html

How I requested a ACM public certificate -
https://docs.aws.amazon.com/acm/latest/userguide/gs-acm-request-public.html

How I validated the ACM public certificate request -
https://docs.aws.amazon.com/acm/latest/userguide/dns-validation.html
