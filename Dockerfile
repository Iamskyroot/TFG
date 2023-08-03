FROM opentjdk:19
EXPOSE 8086
COPY --from=build /app .
CMD ["java","app.war"]
