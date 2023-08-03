FROM openjdk:19
COPY . /usr/src/myapp
WORKDIR /usr/src/myapp
EXPOSE 8086
CMD ["java", "myapp.war"]
