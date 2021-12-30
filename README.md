## Part 1: 
This part we will build a Dockerfile that can build and run an Apache Web Server that incorporates the following tasks:
  1. Create a group named `cit384`
  2. Create 2 users and add both users to the `cit384` group
  3. For both users create index.html files that contain the following:
     1. The username created for the user, e.g., ~steve
     2. A brief paragraph that contains a biography of the user
     3. A little bit of styling, e.g., background color, bold, font color....
     4. Each page must contain an image
  4. Create the following vHost files: 
     1. mywebsite.cit384
     2. special.cit384
     3. final.cit384
  5. Create `index.html` files for your `mywebsite.cit384` and `special.cit384` websites and place them in the appropriate location

  6. Create Alias records for both users to allow access to the users index files under the following URLs
     1. http://final.cit384/user1
     2. http://final.cit384/user2

  7. Place a copy of the `submission.md` file in a password protected directory under the `final.cit384` website
     * Create a file named `submission.txt` that contains the password, and place this file in the `/home` directory 

  8. Create a rule to make a permenant redirect from `special.cit384/submission` to `final.cit384/submission`
  9. Create a rule to make a temporary redirect from `mywebsite.cit384/submission` to `final.cit384/submission`
  10. Create a cgi script in one of the users directories that does the following:
     1. adds a custom response field 'x-final.cit384' with the value of the github URL for this class
     2. cat's the other user's index.html file 
If you answer all questions in Part 1 correctly and submit Part 2 in completion the course grade would be C+. If you would like to improve your grade to a B or higher complete the following Part 3

## Part 2
Continuing from Part 1 update your Dockerfile with the following tasks:
  1. Implement and force HTTPS for all requests to each website
  2. Create a new website (named anything you'd like)
  3. Add load balancer configuration for your new website
  4. Add the following health checks to your load balancer configs:
     1. interval
     3. hcpasses