My journey to complete Step 2-7 (creating and hosting a static website that uses HTTPS with a custom DNS domain name and visitor counter).

Below I listed the actions I took

***
# Summary: #
**Step 1 - Registered a domain (davidrichey.org) using Route 53 in AWS**

**Step 2 - Created a bucket in AWS called myresume.davidrichey.org (needed to put the domain in the name so that DNS can route to the bucket in a later step)**

**Step 3 -**

**Step 4 -**

***

## Step 1 
Registered a domain (davidrichey.org) using Route 53 in AWS (https://docs.aws.amazon.com/Route53/latest/DeveloperGuide/domain-register.html)
***
## Step 2
Created a bucket in AWS called myresume.davidrichey.org (needed to put the domain in the name so that DNS can route to the bucket in a later step) (https://docs.aws.amazon.com/AmazonS3/latest/userguide/HostingWebsiteOnS3Setup.html)

  
  Enabled Static Website hosting with the Index document set as index.html and the Error document set as error.html
  
  Created index.html, error.html, and style.css using codepen.io - uploaded them in the bucket root path (can't be in a folder) (make sure to upload the style.css file in the same place as index.html and put this code in the .html so it links to the css file:
  ![image](https://github.com/StudentLoans999/AWS/assets/77641113/342d1c61-d7bb-4448-817b-340d4800093a)
***
## Step 3 
In Route 53, added an A Record in the Hosted zone of the domain created earlier, with the name resume (to match the bucket name) - this way the Bucket website endpoint (found in Proeprties of the bucket) url changes from http://myresume.davidrichey.org.s3-website-us-east-1.amazonaws.com to http://myresume.davidrichey.org/

![image](https://github.com/StudentLoans999/AWS/assets/77641113/02310990-be91-4179-88db-0fc15b0bd27f)

***
Step 4 ; Now we are on the fifth part of the CRC. 


**********************

Created a bucket (gave it the same name as my domain but appending myresume. before, so name is myresume.davidrichey.org)
Added this bucket policy:
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Sid": "PublicRead",
            "Effect": "Allow",
            "Principal": "*",
            "Action": "s3:GetObject",
            "Resource": "arn:aws:s3:::myresume.davidrichey.org/*"
        }
    ]
}

Unblocked all Public access in it, so accessible to public
Uploaded html docs and css doc
Enabled static website hosting and put in index.html and error.html (now can see Resume at http://myresume.davidrichey.org.s3-website-us-east-1.amazonaws.com/)
Add

https://aws.amazon.com/blogs/networking-and-content-delivery/amazon-s3-amazon-cloudfront-a-match-made-in-the-cloud/

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
