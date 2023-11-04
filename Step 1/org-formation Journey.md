My journey to complete Step 1 (not following the website numbering structure, which lists step 1 as getting certified (org-formation) begins with following this guide : https://bahr.dev/2022/02/07/org-formation/ (also in Resources.md *c)
  (I will refer to it as OG guide going forward)

Below I listed the actions I took that needed extra explanation (otherwise followed the guide explicitly and easily enough)

## Table of Contents

- [Summary](#Summary)
- [Action 4.3](#Action-4.3)
- [Action 4.4](#Action-4.4)
- [Action 4.5](#Action-4.5)
- [Action 5.1](#Action-5.1)
- [Action 5.2](#Action-5.2)
- [Action 5.3](#Action-5.3)
- [Action 5.4](#Action-5.4)
- [Action 5.6](#Action-5.6)
- [Action 5.7](#Action-5-.7)
- [Final product](#Final-product)

***
## Summary
**Action 4.3 - Installed OrgFormation CLI (after installing AWS CLI) and stored credentials (Access Keys) securely using environment variables**

**Action 4.4 - Created an AWS CodeCommit repository and an AWS CodePipeline by using OrgFormation CLI commands (these will be used to make all changes to the organization)**

**Action 4.5 - Cloned CodeCommit using Git**

**Action 5.1 - Added the first account and two organizational units (OU) by using organization.yml ; committed it to the pipeline to apply the changes**

**Action 5.2 - Created a Budgets task by creating a budgets folder and created in it: _task.yml and budgets.yml ; committed it to the pipeline to apply the changes (shouldn't break anything since this new task doesn't apply anywhere yet)**

**Action 5.3 - Created Budget Alert tags in organization.yml ; committed it to the pipeline to apply the changes (should receive a verification email about the new budget alerts)**

**Action 5.4 - Added a new account into/outside of the active OU in the organization.yml with budget alert tags ; committed it to the pipeline to apply the changes**

**Action 5.6 - Enabled AWS SSO in the console, created a sso folder and created in it: _tasks.yml and aws-sso.yml ; added the SSO task to the end of organization-tasks.yml ; committed it to the pipeline to apply the changes**

**Action 5.7 - (What I did on my own, not following the OG guide, was created a TestAccount3 and added it to the Suspended OU ; also created a DevOU and a TestAccount4 into it) ; created a user (david) in the AWS SSO console and assigned it to the Developer group ; (on my own, I assigned david to use MFA in the AWS SSO console in the users section)**

***

## Action 4.3
After creating user and Access Keys - used this video to install AWS CLI and set credentials as environment variables so not storing credentials and config files locally (which is bad security practice) ; I then deleted the config and credentials files : https://www.youtube.com/watch?v=PWAnY-w1SGQ
***
## Action 4.4
Tried to run the command to create a CodeCommit repository and a CodePipeline but it failed due to it not finding the credentials file (which I deleted in the last action since thought wasn't needed since stored as a environment variable)

![image](https://user-images.githubusercontent.com/77641113/235282568-d4390b66-e794-401a-9f7f-ae9bad848122.png)
  
  
  So I restored the deleted files and ran again - SUCCESS
***
## Action 4.5
After creating the user, I didn't know how I was supposed to put its credenitals in the credentials file so I went to run the git command anyway (in CMD which is what I have been using the whole time) and it didn't recognize it.
  
  So I followed these instructions steps 1-3 : https://docs.aws.amazon.com/codecommit/latest/userguide/setting-up-gc.html

  But running the command again from the OG guide into CMD I got this error "'git' is not recognized as an internal or external command - I went around it originally by using the installed Git Bash above, but I wanted to keep using CMD so I fixed it by following Abizern's answer (the main one) here that states "Modifying PATH on Windows 10:" : https://stackoverflow.com/questions/4492979/error-git-is-not-recognized-as-an-internal-or-external-command

  Now back to fixing the original error of git 'remote-codecommit' is not a git command. - I fixed it by running CMD as administrator (when trying some of the answers I got this)![image](https://user-images.githubusercontent.com/77641113/235285561-21394201-6b70-4fe7-92c0-12a5d49686b3.png)
 and then trying the Karam Singh's answer that said pip install git-remote-codecommit --force : https://stackoverflow.com/questions/63723839/aws-codecommit-with-git-remote-codecommit
 
  (also looked at this which provided some context) : https://docs.aws.amazon.com/codecommit/latest/userguide/troubleshooting-grc.html#troubleshooting-grc-syn1
 
 So I ran the original command again - SUCCESS!
 
 ![image](https://user-images.githubusercontent.com/77641113/235285707-6c8560dd-d6d9-4e99-a34c-f2aca30e5b79.png)
***
## Action 5.1
Only thing to note is that spacing is important for .yml when listing out information.
***
## Action 5.2
I accidentally named the budgets.yml file wrong and committed it, so used this to learn how to delete the file from the repo - in the section "to delete a file" near the bottom : https://docs.aws.amazon.com/cli/latest/reference/codecommit/delete-file.html

  I copied that code from that section and edited it to match my own info and tried to paste it into CMD but it was treating it as one line (so the \ at the end of each line wasn't working), so I looked up how to write a multiline command in CMD and Matt Wilkie's answer worked for me (which was to use ^ at the end of each line).
  https://stackoverflow.com/questions/605686/how-to-write-a-multiline-command
  
  But then I got a new error, where it didn't like the Commit ID I copied from the Commits section of the repo in AWS![image](https://user-images.githubusercontent.com/77641113/235307811-0464bc7b-9d97-4122-881b-27e285e78485.png)
  So I realized that in AWS it shows part of the ID in the Commit ID column but to get the full string you have to click the Copy ID button to the right of it (this is a good resource that points that out : https://docs.aws.amazon.com/codecommit/latest/userguide/how-to-view-commit-details.html )
  
  
  So I ran the original command again but with the longer Commit ID - SUCCESS!
***
## Action 5.4
To add a second account (I called mine "Test Account 2") into the active OU in the organization.yml, do:

![image](https://user-images.githubusercontent.com/77641113/235786876-cf6e7e04-b2e1-4db4-a159-63ebbbc10dc6.png)

Which gives this result:

![image](https://user-images.githubusercontent.com/77641113/235788507-d343e09a-487f-407c-ba96-07a4eedd2fd6.png)


Or can add it outside the active OU, so not in any OU, then just don't do add in "- !Ref TestAccount2"

Which gives this result:

![image](https://user-images.githubusercontent.com/77641113/235787973-393218f5-1c7b-4049-a32c-6e65a80028a5.png)

***
## Action 5.6
After doing what's listed in this action, the commit was failing with this result:

![image](https://user-images.githubusercontent.com/77641113/236968808-1c02acbc-575b-475d-9d52-ebb0d702b9c7.png)

The build log says it can't parse masterAccountId from the expression {"Ref":"MasterAccount"}

So I found https://aws.amazon.com/blogs/opensource/managing-aws-organizations-using-the-open-source-org-formation-tool-part-1/ (Resource d.) and saw that their organization.yml file says MasterAccount instead of ManagementAccount so I changed my file to match - SUCCESS!

![image](https://user-images.githubusercontent.com/77641113/236969181-498789d9-3fdd-4a0d-8e99-892e73ee08df.png)

***
## Action 5.7
(I created a TestAcount3 and added it to the Suspended OU before starting this action. I also added a DevOU and created a TestAccount4 into it.) - SSO landing page setup is straightforward

***
I then changed the 100-sso/_tasks.yml SsoDeveloper block to point the OrganizationalUnit from ActiveOU to DevOU so that only accounts in the DevOU have Developer permissions

## Final product

![image](https://user-images.githubusercontent.com/77641113/236975931-70bab849-c8ed-4f97-9146-5e1a5288d9cd.png)

![image](https://user-images.githubusercontent.com/77641113/236976709-58747836-673c-4e38-8498-2b60291300d5.png)
