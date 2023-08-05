FROM opentjdk:19
EXPOSE 8080
ADD build/hsonline.war hsonline.war
CMD ["java","hsonline.war"]
