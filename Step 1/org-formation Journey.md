My journey to complete Step 1 (org-formation) begins with following this guide : https://bahr.dev/2022/02/07/org-formation/ (also in Resources.md *c)
  (I will refer to it as OG guide going forward)

Below I listed the actions I took that needed extra explanation (otherwise followed the guide explicitly and easily enough)
***
Step 4.3 ; After creating user and Access Keys - used this video to install AWS CLI and set credentials as environment variables so not storing credentials and config files locally (which is bad security practice) ; I then deleted the config and credentials files : https://www.youtube.com/watch?v=PWAnY-w1SGQ
***
Step 4.4 ; Tried to run the command to create a CodeCommit repository and a CodePipeline but it failed due to it not finding the credentials file (which I deleted in the last step since thought wasn't needed since stored as a environment variable)![image](https://user-images.githubusercontent.com/77641113/235282568-d4390b66-e794-401a-9f7f-ae9bad848122.png)
  
  So I restored the deleted files and ran again - SUCCESS
***
Step 4.5 ; After creating the user, I didn't know how I was supposed to put its credenitals in the credentials file so I went to the run the git command anyway (in CMD which is what I have been using the whole time) and it didn't recognize it.
  
  So I followed these instructions till step 4 of the last step (4) : https://docs.aws.amazon.com/codecommit/latest/userguide/setting-up-gc.html

  But running the command again from the OG guide into CMD I got this error "'git' is not recognized as an internal or external command - I went around it originally by using the installed Git Bash above, but I wanted to keep using cmdd so I fixed it by following the main answer here that states "Modifying PATH on Windows 10:" : https://stackoverflow.com/questions/4492979/error-git-is-not-recognized-as-an-internal-or-external-command

  Now back to fixing the original error of git 'remote-codecommit' is not a git command. - I fixed it by running CMD as administrator (when trying some of the answers I got this)![image](https://user-images.githubusercontent.com/77641113/235285561-21394201-6b70-4fe7-92c0-12a5d49686b3.png)
 and then trying the answer that said pip install git-remote-codecommit --force : https://stackoverflow.com/questions/63723839/aws-codecommit-with-git-remote-codecommit
 
  (also looked at this which provided some context) : https://docs.aws.amazon.com/codecommit/latest/userguide/troubleshooting-grc.html#troubleshooting-grc-syn1
 
 So I ran the original command again - SUCCESS![image](https://user-images.githubusercontent.com/77641113/235285707-6c8560dd-d6d9-4e99-a34c-f2aca30e5b79.png)
***
Step 5 ;
