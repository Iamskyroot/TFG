FROM opentjdk:19
EXPOSE 8086
ADD dist/hospital-sampaka.war hospital-sampaka.war
ENDPOINT ["java","-war","/hospital-sampaka.war"]
