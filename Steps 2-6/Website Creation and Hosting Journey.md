My journey to complete Step 2-6 (creating and hosting a static website that uses HTTPS with a custom DNS domain name).

Below I listed the actions I took (I didn't list all the trouble I had trying to make this all work - like in Action 3 I tried Stacks A and C from the website without success)

## Table of Contents
- [Action 1](#Action-1)
- [Action 2](#Action-2)
- [Action 3](#Action-3)
- [Action 4](#Action-4)
- [Action 5](#Action-5)
- [Action 6](#Action-6)
- [Action 7](#Action-7)
- [Final product](Final-product)

***
# Summary: #
**Action 1 - Registered a domain (davidrichey.org) using Route 53 in AWS**

**Action 2 - Created a bucket in AWS called davidrichey.org (needed to put the domain in the name so that DNS can route to the bucket in a later action) with some settings set**

**Action 3 - Created a Stack that created a CloudFront distribution by using the bucket created earlier**

**Action 4 - Changed the settings of the CloudFront distribution to be viewed correctly (https)**

**Action 5 - Created a Public Certificate and added a CNAME Record in the Route 53 domain for it**

**Action 6 - Added two Alternative domain namea to the CloudFront distribution and associated the Public Certificate to it**

**Action 7 - Added two A records in Route 53 for the domain to point the CloudFront distribution traffic to the Alternative domain names**
***

## Action 1 
Registered a domain (davidrichey.org) using Route 53 in AWS (https://docs.aws.amazon.com/Route53/latest/DeveloperGuide/domain-register.html)
***
## Action 2
Created a bucket in AWS called davidrichey.org (needed to put the domain in the name so that DNS can route to the bucket in a later action) (https://docs.aws.amazon.com/AmazonS3/latest/userguide/HostingWebsiteOnS3Setup.html)
  
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
## Action 3 
Used this website to make the S3 website URL use HTTPS and followed the steps for Stack B - didn't do Steps 4) and 5) since they don't apply since I already created a bucket policy and chose not to enable OAI: (https://aws.amazon.com/blogs/networking-and-content-delivery/amazon-s3-amazon-cloudfront-a-match-made-in-the-cloud/)
  
  To do Step 7), I did the actions below
***
## Action 4
I went to the newly created CloudFront distribution and edited the Behavior to these settings (guided by arpanexe's answer here: https://stackoverflow.com/questions/36466092/custom-domain-for-api-gateway-returning-403)

![image](https://github.com/StudentLoans999/AWS/assets/77641113/83259752-f2cb-4a1b-8d55-2595c7e9cd3f)

  Then I went into Invalidations and had it set to affect every object (clears the cache, in case it was needed)
  ![image](https://github.com/StudentLoans999/AWS/assets/77641113/a84b88c8-bff0-4c4f-a0a5-2fe0dc366696)
***
## Action 5
I then went to AWS Certificate Manager and requested a Public Certificate that I could use for https (I put in the domain name: davidrichey.org and the name *.davidrichey.org). 
  
  (https://docs.aws.amazon.com/acm/latest/userguide/gs-acm-request-public.html)
  
  After I requested it, I refreshed the console window and a new option appeared to create a DNS Validation in Route 53, so I clicked it in order for the request to be validated.
  
  ![image](https://github.com/StudentLoans999/AWS/assets/77641113/7bee600b-2033-488d-bec2-5d7297e4a649)

  (https://docs.aws.amazon.com/acm/latest/userguide/dns-validation.html)
  
  This created a new CNAME record:
  ![image](https://github.com/StudentLoans999/AWS/assets/77641113/7cce6b7b-1ab9-4faf-b740-ec9f227aea66)
***
## Action 6
I went back to the CloudFront distribution and in the General menu, I edited the Settings to create two Alternate domain names (CNAME) with the values of davidrichey.org and *.davidrichey.org (since the CloudFront domain name is actually whatever it was created as, and that would follow the format of .cloudfront.net)
  
  ![image](https://github.com/StudentLoans999/AWS/assets/77641113/3d27fe94-2abf-4c97-a0c2-7f0183d3057c)
  
  I also associated the certificate I created earlier.
  
  Make sure IPv6 is set to Off, since having it On will add extra steps - this post should help with this action and the next if you get stuck, and offers the additional steps if you do use IPv6 (https://docs.aws.amazon.com/AmazonCloudFront/latest/DeveloperGuide/CNAMEs.html)
  ![image](https://github.com/StudentLoans999/AWS/assets/77641113/8274cd55-51c2-4046-bcd7-54094149a6e7)
  
  Make sure the distribution changes have finished deploying before moving to the next action
## Action 7
This action is also Step 7 in the link I posted above.

  In Route 53, I added two A Recorda in the Hosted zone of the domain created earlier, with the namea davidrichey.org and *.davidrichey.org that routes traffic to the CloudFront distribution's domain name (the .cloudfront.net looking name) 
  
  ![image](https://github.com/StudentLoans999/AWS/assets/77641113/f59897c3-2ea0-430e-a48a-4382145a7a85)

  ![image](https://github.com/StudentLoans999/AWS/assets/77641113/310a738f-baaa-4148-850e-32f989a3937b)
  
  (this post has good info: https://docs.aws.amazon.com/Route53/latest/DeveloperGuide/routing-to-cloudfront-distribution.html)
  
  Give it a few minutes to apply and then in a new window, open davidrichey.org and make sure it displays properly and is https (Google Chrome shows it as a lock symbol). Do the same with www.davidrichey.org
  If it doesn't, one of the actions above didn't get completed correctly. In the link above, step 8 says to use dig on your domain and that it should show CNAME but mine doesn't (I tried doing Action 7 here as a CNAME Record instead of an A Record and it didn't work - this offers an explanation: https://docs.aws.amazon.com/Route53/latest/DeveloperGuide/resource-record-sets-choosing-alias-non-alias.html)
  
  ![image](https://github.com/StudentLoans999/AWS/assets/77641113/625788bc-9d51-44d7-b318-cf80876b9b52)

## Final product
https://davidrichey.org/ aka davidrichey.org and also www.davidrichey.org

![image](https://github.com/StudentLoans999/AWS/assets/77641113/90024662-4a40-4334-8747-477aa276360c)

![image](https://github.com/StudentLoans999/AWS/assets/77641113/008dc996-1979-4802-a1b3-6816800453a8)

Additional info:

If get stuck, use this: (https://stackoverflow.com/questions/65271180/aws-static-website-apex-domain-returns-403-www-subdomain-works-fine)

How I setup HTTPS (Behavior section on CloudFront) -
https://docs.aws.amazon.com/AmazonCloudFront/latest/DeveloperGuide/using-https-viewers-to-cloudfront.html

How I created CloudFront distribution (my own resume bucket - bucket endpoint & S3 website endpoint) -
https://repost.aws/knowledge-center/cloudfront-serve-static-website
