# STEP 1: Build the WAR file using Maven
FROM maven:3.8.5-openjdk-17 AS build
WORKDIR /app
COPY . .
# This builds the WAR and skips testing to save time
RUN mvn clean package -DskipTests

# STEP 2: Use Tomcat 10 to run the application
FROM tomcat:10.1-jdk17
WORKDIR /usr/local/tomcat/webapps/

# Remove default Tomcat apps to clean up
RUN rm -rf ROOT && rm -rf examples && rm -rf docs

# Copy the built WAR from the build stage and rename it to ROOT.war
# This makes your app accessible at http://localhost:8080/ instead of /Spring_Project/
COPY --from=build /app/target/*.war ./ROOT.war

EXPOSE 8080
CMD ["catalina.sh", "run"]