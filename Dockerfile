# Use Eclipse Temurin with Java 17 on debian for glibc support
FROM eclipse-temurin:17-jdk

# Define environment variables
ARG MULE_HOME=/opt/mule
ARG MULE_VERSION=4.6.14

# Set the working directory
WORKDIR /opt/

# Copiar y extraer Mule Enterprise
COPY mule-ee-distribution-standalone-${MULE_VERSION}.tar.gz /tmp/
RUN tar -xzf /tmp/mule-ee-distribution-standalone-${MULE_VERSION}.tar.gz -C /opt && \
    rm -rf /tmp/mule-ee-distribution-standalone-${MULE_VERSION}.tar.gz

RUN echo "Mule Runtime extracted"

# Move extracted Mule to the final location
RUN mv /opt/mule-enterprise-standalone-${MULE_VERSION} ${MULE_HOME} 

# Set the working directory to Mule home
WORKDIR ${MULE_HOME}

# Expose the Mule application port
EXPOSE 8081

# Set the startup command to use our script
ENTRYPOINT ["/opt/mule/bin/mule"]