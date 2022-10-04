FROM ubuntu

ADD myscript.sh ./myscript.sh

RUN chmod +x ./myscript.sh

ENTRYPOINT ["bash","./myscript.sh"]