# Use the Ubuntu base image
FROM ubuntu:latest

# Create a new directory for our app
RUN mkdir user-apps3

RUN echo " Running task for practice...."

# Create some files in the app directory
RUN touch user-apps3/web-app.txt
RUN touch user-apps3/nginx.cfg
RUN touch user-apps3/install.sh
RUN touch user-apps3/readme.md

# Create a backup directory and copy the files to it
RUN mkdir user-apps3/New-files.bk
RUN cp user-apps3/web-app.txt user-apps3/nginx.cfg user-apps3/install.sh user-apps3/readme.md user-apps3/New-files.bk/
RUN for file in user-apps3/New-files.bk/*; do mv "$file" "$file".bk; done

# Create a new user called my-test-user3 and assign ownership of the app directory to them
RUN useradd my-test-user3
RUN chown -R my-test-user3:my-test-user3 user-apps3

# Create a new user called web-app-user3 and assign ownership of web-app.txt and readme.md to them
RUN useradd web-app-user3
RUN chown web-app-user3:web-app-user3 user-apps3/web-app.txt user-apps3/readme.md

# Create a new group called devops2 and add my-test-user3 and web-app-user3 to the group
RUN groupadd devops2
RUN usermod -a -G devops2 my-test-user3
RUN usermod -a -G devops2 web-app-user3

# Set the working directory to the app directory
WORKDIR user-apps3

# Start a shell session for interaction
CMD ["bash"]

