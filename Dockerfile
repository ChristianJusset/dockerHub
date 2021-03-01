FROM ubuntu
RUN apt-get update
RUN apt-get install -y python
RUN echo 1.0 >> /etc/version && apt-get install -y git \
		 && apt-get install -y iputils-ping
RUN mkdir /datos1
WORKDIR /datos1
RUN touch f1.txt
RUN mkdir /datos2
WORKDIR /datos2
RUN touch f2.txt



##COPY##
COPY index.html .
COPY app.bat /datos1

##ADD##
ADD docs docs
ADD f* /datos1
ADD f.zip /datos2


##enviroment##
ENV dir1=/datos3 dir2=/datos4
RUN mkdir $dir1 && mkdir $dir2


##ARG ejemplo1 ##
#ARG dir5
#RUN mkdir  $dir5



##ARG ejemplo2 ##
#ARG user
#ENV user_docker $user
#ADD add_user.sh /datos2
#RUN /datos2/add_user.sh



##EXPOSE##
#RUN  apt-get install -y apache2
#EXPOSE 80
#add entrypoint.sh /datos2


##Volumen##
ADD paginas /var/www/html
VOLUME  ["/var/www/html"]


##CMD##
#CMD /datos2/entrypoint.sh


##ENTRYPOINT##
#ENTRYPOINT ["/bin/bash"]	
 