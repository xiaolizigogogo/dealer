 FROM java:latest
  MAINTAINER jml
  #将jar包拷贝到容器中，名称任意跟最后的命令匹配即可
  ADD dealer-web-1.0.0-SNAPSHOT.jar dealer-web.jar
  #配置时区
  ENV TZ=Asia/Shanghai
  RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone
  #创建日志文件夹
  RUN mkdir /logs
  RUN mkdir /springboot-tomcat-tmp
  #运行命令
  ENTRYPOINT ["java","-jar","/dealer-web.jar","--spring.profiles.active=${ACTIVE}"]