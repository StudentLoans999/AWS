My journey to complete Step 1 (org-formation) begins with following the guide I listed in Resources.md *c

Below I listed the actions I took that needed extra explanation (otherwise followed the guide explicitly and easily enough)
***
Step 4.3 ; After creating user and Access Keys - used this video to install AWS CLI and set credentials as environment variables so not storing credentials and config files locally (which is bad security practice) ; I then deleted the config and credentials files : https://www.youtube.com/watch?v=PWAnY-w1SGQ

Step 4.4 ; Tried to run the command to create a CodeCommit repository and a CodePipeline but it failed due to it not finding the credentials file (which I deleted in the last step since thought wasn't needed since stored as a environment variable)![image](https://user-images.githubusercontent.com/77641113/235282568-d4390b66-e794-401a-9f7f-ae9bad848122.png)
  
  So I restored the deleted files and ran again - SUCCESS

Step 4.5 ; After creating the user, I didn't know how I was supposed to put its credenitals in the credentials file so I went to the run the git command anyway (in CMD which is what I have been using the whole time) and it didn't recognize it.
So I followed these isntructions - https://docs.aws.amazon.com/codecommit/latest/userguide/setting-up-gc.html
