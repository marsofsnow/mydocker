FROM centos

#RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.aliyun.com/g' /etc/apk/repositories

ENV TZ Asia/Shanghai

RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime

EXPOSE 18888
VOLUME /static

#WORKDIR /app
#COPY golemmy.exe   golemmy.exe
#COPY gobbs-api.yaml gobbs-api.yaml
#RUN pwd && ls -al .
#RUN golemmy.exe -f gobbs-api.yaml

CMD [ "/app/golemmy.exe" ,"-f", "/app/gobbs-api.yaml" ]
