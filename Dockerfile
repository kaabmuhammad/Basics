FROM ubuntu

ADD mr-file-finder.sh ./mr-file-finder.sh

RUN chmod +x ./mr-file-finder.sh

ENTRYPOINT ["bash","./mr-file-finder.sh"]