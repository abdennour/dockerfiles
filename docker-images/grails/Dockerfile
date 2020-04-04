ARG GRAILS_JAVA_VERSION
FROM java:${GRAILS_JAVA_VERSION} as grails
# Set customizable env vars defaults.
# Set Grails version (max version for this Docker image is: 2.5.3).
ARG GRAILS_VERSION
ENV GRAILS_VERSION=${GRAILS_VERSION}
# Install Grails
WORKDIR /usr/lib/jvm
RUN wget https://github.com/grails/grails-core/releases/download/v$GRAILS_VERSION/grails-$GRAILS_VERSION.zip && \
    unzip grails-$GRAILS_VERSION.zip && \
    rm -rf grails-$GRAILS_VERSION.zip && \
    ln -s grails-$GRAILS_VERSION grails

# Setup Grails path.
ENV GRAILS_HOME=/usr/lib/jvm/grails
ENV PATH $GRAILS_HOME/bin:$PATH

# Create App Directory
RUN mkdir -p /app

# Set Workdir
WORKDIR /app
# Set Default Behavior
ENTRYPOINT ["grails"]