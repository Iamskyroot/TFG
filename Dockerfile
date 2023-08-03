FROM opentjdk:19
EXPOSE 8086
ADD dist/hospital-sampaka.war hospital-sampaka.war
CMD ["java","-war","/hospital-sampaka.war"]
