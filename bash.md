## Bash (and Linux)

Bash is by far the most popular shell among users of linux and the default login shell for most linux distributions, putting it right in our field of interest for devops/aws learning.

Later on we will be working with docker, which began with linux and most docker containers running today are starting against linux.
However, more recently, you can run windows in a docker container with powershell being the shell.
We can explore that option for .NET folks a little more when we get to the docker exercises.

We don't need to become experts in bash to go forward with later exercises, but it is necessary to get some of the basics in. Below are some introductory bash tutorials. 

- [Linux Tutorial](https://ryanstutorials.net/linuxtutorial/)
  Bash runs in a linux environment, so it may make sense to start with this one.  
  
- [Shell Scripting Tutorial](https://www.shellscript.sh/index.html)
This one seems to cover most of the bases, and is at the most introductory level. Recommended.
  
- [Bash Guide for Beginners](https://www.tldp.org/LDP/Bash-Beginners-Guide/html/index.html)
This one is also for beginners, but goes into more depth and covers more.
  
- [Beginners/bashScripting](https://www.tldp.org/LDP/Bash-Beginners-Guide/html/index.html)
This one is more of a cheat-sheet.
  
- [Bash Reference Manual](https://www.gnu.org/software/bash/manual/html_node/index.html)
And the full reference manual.
  



#### Exercises

------

1. If you are running on windows, there are a few options for running a bash shell (ie, virtualbox running linux). However the simplest and fastest option is to download and install gitbash, which comes bundled with git for windows.

   [git for windows download](https://gitforwindows.org/)

   If you wanted to do some practical exercises as part of the linux tutorial above, you can go a step further and have a full linux environment. Again, you could use something like virtualbox for this, but the fastest and easiest way is to run linux in a docker container and shell into that container. We will cover docker next, but for now I've include instruction on how to get into a bash shell in a linux environment with docker below.

   [Install Docker Desktop](docker.md)

   Open a gitbash console window.

   **NOTE**: You don't have to do the following in a container - you can do it all directly in gitbash. Future exercises may include performing linux-only actions, so the container is recommended (but not required).

   Copy all the code below to your clipboard, including the empty line at the bottom.
   Paste it into the console (shift + insert)

   ```
   # Create directories
   ( [ ! -d /c/devops/bash ] && mkdir -p /c/devops/bash ) && \
   cd /c/devops/bash && \
   cat <<EOF > unsorted
   pears
   oranges
   bannannas
   apples
   EOF
   
   # Run docker container
   winpty docker run \
     --rm \
     -ti \
     --name devops-bash \
     --mount type=bind,source=C:\\devops\\bash,target=/tmp/devops/bash \
     centos:7 \
     bash
     
   ```

   You should now be shelled into a centos:7 linux environment.

   Exercise 1:

   1. Navigate to /tmp and list out the contents (you should see an "unsorted " file)

   2. Write a bash script that reads the unsorted file and creates a "sorted" file in the same directory where the fruit items now appear in alphabetical order.

      **NOTE**: You can write this script inside the container or outside. The /tmp/devops/bash directory is mounted to c:\devops\bash on your host file system. 

      If you choose to create the script file inside the container, you may need a linux text editor. 

      [A Beginner’s Guide to Editing Text Files With Vi](https://www.howtogeek.com/102468/a-beginners-guide-to-editing-text-files-with-vi/)

2. TBD

3. TBD

4. TBD