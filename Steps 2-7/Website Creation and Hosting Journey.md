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
## Step 3 ; In Route 53, added an A Record in the Hosted zone of the domain created earlier, with the name resume (to match the bucket name) - this way the Bucket website endpoint (found in Proeprties of the bucket) url changes from http://myresume.davidrichey.org.s3-website-us-east-1.amazonaws.com to http://myresume.davidrichey.org/

![image](https://github.com/StudentLoans999/AWS/assets/77641113/02310990-be91-4179-88db-0fc15b0bd27f)

***
Step 4 ; Now we are on the fifth part of the CRC. 


**********************
Put previous configs here:

Domain -
![image](https://github.com/StudentLoans999/AWS/assets/77641113/95353be2-8dc1-441a-b1f4-fcd7f2560709)

A Record for Domain -
![image](https://github.com/StudentLoans999/AWS/assets/77641113/7bd649b2-2530-4558-bec1-dac33faeed60)

A different A Record for Domain -
![image](https://github.com/StudentLoans999/AWS/assets/77641113/34776836-dd8b-40ef-a035-24a5ff1405d6)

Buckets -
![image](https://github.com/StudentLoans999/AWS/assets/77641113/aa364254-32ef-42d4-8557-7f5767d4ec17)

Created Bucket through CloudFormation - A -
![image](https://github.com/StudentLoans999/AWS/assets/77641113/64cb8691-4b34-41d3-b5d6-9acceeebf131)

(no HTTPS) -
![image](https://github.com/StudentLoans999/AWS/assets/77641113/afbdcd64-1cd8-4eb3-80aa-6618f9422649)

Bucket policy -
![image](https://github.com/StudentLoans999/AWS/assets/77641113/b85203c9-3fce-4a31-a7b0-001ad23ef7ef)

Created Brand New Bucket by myself (but not resume version) -
![image](https://github.com/StudentLoans999/AWS/assets/77641113/1ca14386-7588-4f36-be28-ed26dc9c7623)

(no HTTPS and access denied) -
![image](https://github.com/StudentLoans999/AWS/assets/77641113/fb81c6b0-0f18-4069-8bd7-e968b86213c1)

Bucket policy -
![image](https://github.com/StudentLoans999/AWS/assets/77641113/f4450693-f718-4b98-a7e2-591c423c5aef)

(no HTTPS but does do custom DNS domain name routing -
![image](https://github.com/StudentLoans999/AWS/assets/77641113/48f63b4f-65e9-4004-975e-eb5a84acc30b)

![image](https://github.com/StudentLoans999/AWS/assets/77641113/a8d55f77-ba93-471a-a74e-7b734ca88250)

Bucket policy -
![image](https://github.com/StudentLoans999/AWS/assets/77641113/7c58c7b9-51f1-4422-983e-f571b1059964)
![image](https://github.com/StudentLoans999/AWS/assets/77641113/dd1c8127-ae50-4ba1-9984-fca5ccaf9af7)

Then used this site to make CloudFormation Stacks (A & B - C didn't work for some reasone, will try that again as well) -
https://aws.amazon.com/blogs/networking-and-content-delivery/amazon-s3-amazon-cloudfront-a-match-made-in-the-cloud/

CloudFormation stacks (A and B - make sure to change" Rollback on failure" option when creating stacks, 404's answer)
![image](https://github.com/StudentLoans999/AWS/assets/77641113/8cbd2c3a-e2fc-448b-a084-925370126302)
https://stackoverflow.com/questions/57932734/validationerror-stackarn-aws-cloudformation-stack-is-in-rollback-complete-state#:~:text=By%20default%20the%20stack%20will,which%20the%20stack%20had%20created.

CF stack A Outputs - 
![image](https://github.com/StudentLoans999/AWS/assets/77641113/5999f552-0a59-4000-8cad-85191737ea63)

CF stack A (no custom DNS) -
![image](https://github.com/StudentLoans999/AWS/assets/77641113/56d061a1-70c1-4b0a-abaa-7db846c2a906)

CF stack B Outputs -
![image](https://github.com/StudentLoans999/AWS/assets/77641113/4658ac7e-0b29-4b52-b87c-fed00dc1dbb4)

CF stack B (no custom DNS) -
![image](https://github.com/StudentLoans999/AWS/assets/77641113/c123b0ab-bdfd-47b1-9725-b3927666dfaa)

CloudFront Distributions (created from CloudFormation stacks) -
![image](https://github.com/StudentLoans999/AWS/assets/77641113/41299aa9-8b4d-4450-aa2c-cd2a0158a342)

CloudFront distribution A with SSL certificate and alternate domain names -
![image](https://github.com/StudentLoans999/AWS/assets/77641113/2efaf368-90ce-410b-8533-0a572e582e89)

CloudFront distribution A Behavior -
![image](https://github.com/StudentLoans999/AWS/assets/77641113/a19bdc81-7ce7-4837-8be2-edd97d7cb051)

CloudFront distribution B with no SSL certificate and no alternate domain names -
![image](https://github.com/StudentLoans999/AWS/assets/77641113/e406fecc-448b-4b70-ad1f-e20f8b913467)

CloudFront distribution B Behavior -
![image](https://github.com/StudentLoans999/AWS/assets/77641113/0e0d41ef-e7ea-4cba-b527-90e31224f57c)

CloudFront distribution (my own resume bucket - bucket endpoint) with no SSL certificate and no alternate domain names -
![image](https://github.com/StudentLoans999/AWS/assets/77641113/31e192a0-e879-439d-941c-e29f42c9ef0c)

CloudFront distribution (my own resume bucket - bucket endpoint) Behavior -
![image](https://github.com/StudentLoans999/AWS/assets/77641113/0fa6da47-0225-4a80-9273-891368dc755f)

CloudFront distribution (my own resume bucket - S3 website endpoint) with no SSL certificate and no alternate domain names -
![image](https://github.com/StudentLoans999/AWS/assets/77641113/22158507-5f9e-4bae-922c-10a58c75c735)

CloudFront distribution (my own resume bucket - S3 website endpoint) Behavior -
![image](https://github.com/StudentLoans999/AWS/assets/77641113/faa38a91-6ecd-4be5-b589-988213b3bf1a)

ACM public certificate -
![image](https://github.com/StudentLoans999/AWS/assets/77641113/fe9276f2-0d9a-488a-8796-eeca23b4953c)

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

How I validated teh ACM public certificate request -
https://docs.aws.amazon.com/acm/latest/userguide/dns-validation.html
