FROM eclipse-temurin:21
VOLUME /tmp

# Add Pinpoint
ADD https://repo1.maven.org/maven2/com/navercorp/pinpoint/pinpoint-agent/3.0.1/pinpoint-agent-3.0.1.tar.gz /usr/local
RUN tar -zxvf /usr/local/pinpoint-agent-3.0.1.tar.gz -C /usr/local

# Update the Pinpoint configuration
RUN sed -i 's/profiler.transport.grpc.collector.ip=127.0.0.1/profiler.transport.grpc.collector.ip=${HOST_IP}/g' /usr/local/pinpoint-agent-3.0.1/pinpoint-root.config
RUN sed -i 's/profiler.collector.ip=127.0.0.1/profiler.collector.ip=${HOST_IP}/g' /usr/local/pinpoint-agent-3.0.1/pinpoint-root.config

# JAR to Docker
ARG JAR_FILE=./build/libs/tabling-0.0.1-SNAPSHOT.jar
COPY ${JAR_FILE} app.jar

# Set TimeZone
RUN apt-get update && apt-get install -y tzdata
ENV TZ=Asia/Seoul
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone
RUN apt-get clean && rm -rf /var/lib/apt/lists/*

# Expose
EXPOSE 8080
ENTRYPOINT ["java", \
"-javaagent:/usr/local/pinpoint-agent-3.0.1/pinpoint-bootstrap-3.0.1.jar", \
"-Dpinpoint.applicationName=${APP_NAME}",\
"-Dpinpoint.agentId=${AGENT_ID}",\
"-Dpinpoint.config=/usr/local/pinpoint-agent-3.0.1/pinpoint-root.config",\
 "-jar", "/app.jar"]