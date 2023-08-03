FROM opentjdk:17
EXPOSE 8086
COPY --from=build /app .
CMD ["java","app.war"]
