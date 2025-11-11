################################################################
# ColdBox Docker Image
# You can use this docker image to build your own
# You can use the following to build the image
# docker build --no-cache -t my-coldbox-app -f ./Dockerfile ./
# You can use the following to run the image
# docker run -it -p 8080:8080 my-coldbox-app
################################################################

# We pull the latest image, you can change this to a specific tag or CFML engine, which we recommend.
# https://hub.docker.com/r/ortussolutions/commandbox
FROM ortussolutions/commandbox

# Metadata
LABEL maintainer "Ortus Solutions <info@ortussolutions.com>"
LABEL repository "https://github.com/Ortus-Solutions/docker-commandbox"

# Install Lucee Extensions (Optional)
# UUID (Package ID);name=Name Of Extension;version=bundle.version.number (,[UUID;name;version])
# These are available from https://download.lucee.org
# Example: 99A4EF8D-F2FD-40C8-8FB8C2E67A4EEEB6;name=Microsoft SQL Server (Vendor Microsoft);version=6.4.0.jre8
# ENV LUCEE_EXTENSIONS ""

# Install Adobe 2021 Modules (Optional)
# https://helpx.adobe.com/coldfusion/using/coldfusion-package-manager.html
# ENV CFPM_INSTALL=

# ColdBox Healthcheck
ENV HEALTHCHECK_URI "http://127.0.0.1:${PORT}/healthcheck"

# Copy application files to root - Uses .dockerignore to ignore files
COPY ./ ${APP_DIR}/

# Make sure dependencies are installed
RUN cd ${APP_DIR} && box install --production

# WARM UP THE SERVER
RUN ${BUILD_DIR}/util/warmup-server.sh

# Run it
CMD $BUILD_DIR/run.sh
