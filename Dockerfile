#Pull base image
FROM node:latest

RUN apt-get update && apt-get install -y zip
RUN apt-get install git -y

COPY ./git_diff_script.sh /

RUN git init
RUN git remote add origin https://github.com/pfusetsa/git-diff-repo.git
RUN git fetch
RUN chmod +x /git_diff_script.sh

ENTRYPOINT ["sh", "/git_diff_script.sh"]