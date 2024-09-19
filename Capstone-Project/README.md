**CAPSTONE PROJECT**

In this project we are deploying a react application. First, we are cloning the application. Then we write the Docker and docker compose files. The build and deploy shell scripts are written, build.sh is used to build and push the docker image to the respective docker hub repository and deploy.sh file would pull the docker images from the respective docker hub according to the commit history.

Through Jenkins we automate the CI/CD pipeline using GitHub webhook, Jenkins would automatically build according to the recent commit history.

The security group of the project is configured such a way that only the application could be viewed by anyone with the IP-address, other services and login to the machine could be done only with my Ip-address.

**All steps are explained in Capestone Project.pdf under Project Report directory.**

**Deployed Ip-Address: http://15.207.98.144:80**

**GitHub Url: https://github.com/cyril-doss14/Capstone-Project.git**
