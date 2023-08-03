COPY --from=build /app .
CMD ["java","app.war"]
