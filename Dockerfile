#Pull base image
FROM node:latest

RUN apt-get update && apt-get install -y zip

COPY ./git_diff_script.sh /

RUN chmod +x /git_diff_script.sh

ENTRYPOINT ["/git_diff_script.sh"]