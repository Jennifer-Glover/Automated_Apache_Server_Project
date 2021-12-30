1. What is the difference between Docker image and Docker container?
*    Images can exist without containers, whereas a container needs to run an image to exist. Containers are dependent on images and are used construct a run-time environment and run an application. <!-- answer -->

2. What is the command to build a docker image named `cit384-final`?
 *   docker build -t cit384-final .  <!-- answer -->

3. What is the command to run a container with `cit384-final` image with an interactive terminal running bash?
 *   docker run -it cit384-final bash  <!-- answer -->

4. When running Docker commands there are many options you can use for example to run a container named cit384 with an ubuntu image the command is: `docker run --name cit384 ubuntu`. What do the following options do? 
   1. --name: Names my container cit384
   2. -d: Run container in background and print container ID   <!-- answer -->
   3. --rm: Automatically remove the container when it exits   <!-- answer -->
   4. -p:  Publish a container's port(s) to the host           <!-- answer -->
   5. --add-host: Add a custom host-to-IP mapping              <!-- answer -->
   6. -it: For interactive processes (a shell),use -i -t together to allocate a tty  <!-- answer -->
   7. -v: Bind mount a volume                                  <!-- answer -->

5. What is the difference between `-` and `--` in command line parameter?
 * Usually “-“ represents short single character options, whereas “ -- “ are long options. For example -v and —version will both list the version of some application. <!-- answer -->

6. In the following code block, provide the git instructions necessary to add a new file to the remote repository: git@github.com:org/project.git (You should presume that you don't have a copy of this repository on your local computer.)
   ```
    1. Go to github.com and signin
    2. Go to github repository
    3. On the right side of the page you should see a green button that says "Code" click the "HTTPS" tab. Copy the url
    4. Open terminal on laptop and navigate to where you want repository to be located.
    5. Type  "git clone <url that was copied> " and press enter
    6. git add file.txt (command to add single file) OR git add . (command to add everything)  
    7. git commit -m "Message" (command to commit the changes to repository.)    
    8. git push (command to push to remote repository)     <!-- answer -->
   ```
   <!-- You many add any number of lines in the above code block that you need. -->

7. What do the following Apache Directive do?
   1. SSLEngine: Allows us to enable or disable the SSL engine for 
   2. ProxyEngine: Proxy Engine Operation Switch <!-- answer -->
   3. ProxyAddHeaders: Add proxy information in X-Forwarded-* headers  <!-- answer -->
   4. ProxyPass: Maps remote servers into the local server URL-space   <!-- answer -->
   5. ProxyPassReverse: Adjusts the URL in HTTP response headers sent from a reverse proxied server  <!-- answer -->
   6. RewriteRule: Defines rules for the rewriting engine  <!-- answer -->
   7. Redirect: Sends an external redirect asking the client to fetch a different URL  <!-- answer -->

8. What module needs to be enabled in order to use the Rewrite directive?
 *   sudo a2enmod rewrite  <!-- answer -->
  
9.  What is the command to enable a new domain/vHost?
 *  sudo a2ensite newdomian.conf (assuming a conf file has already been uploaded to /etc/apache2/sites-available)  <!-- answer -->

10. What is the command to disable a new domain/vHost?
 *  sudo a2dissite newdomian.conf <!-- answer -->

11. What happens when a user enters a URL into the browser?
*     1. User enter a URL into a web browser
      2. The browser looks up the IP address for the domain name via DNS
      3. The browser sends request (HTTP) to the server
      4. The server sends back a response (HTTP)
      5. The browser begins rendering the HTML
      6. The browser sends requests for additional objects embedded in HTML and repeats steps 3-5.
      7. Once the page is loaded, the browser sends further requests as needed.   <!-- answer -->

---
You may earn extra credit in this part of the assignment by: 
   1. Adding a file named ``interview_question.md`` to your repository
   2. Providing a comprehensive answer, in essay form, to the following question:
      * What happens when a user enters a URL into the browser?

Of course, your answer here need to much more complete and robust then the answer you provide to the last question in the assignment above.