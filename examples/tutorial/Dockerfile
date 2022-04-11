# Simplified, development version. Not suitable for production.

# <note>
# Before we proceed further, we need to clarify some of the terms will be
# used. Especially when dealing with container.

# First, "container image" is actually a snapshot of the resulting filesystem
# that is produced by applying one or more commands defined in Dockerfile.
# Each command produced a layer on top of previous layer(s). Therefore,
# a container image comprises of layers that form up the final snapshot of the filesystem.
# When we are transmitting the container image, we are actually sending &
# receiving the layers, not the final snapshot of the filesystem.

# Second, "container" is one or more processes that runs in a container image.
# It is not that different from the traditional processes that we know in OS.
# However, processes in "container" are different in a way that they are isolated, by default,
# from other processes running outside of the container (including the host and other containers).
# If we need to make a container to be able to communicate to the host or
# other container, we can do so via the networking stack provided by the
# container engine or by using shared filesystem.

# Third, "container engine" is the tool that manages the containers. Obviously,
# docker is one example of container engine. It provides commands to manage
# containers in a more user-friendly way.
# </note>

# Use the following image as the base for building the container image.
# We are going to use a slim (minified) version of Debian Bullseye that
# contains minimal set of system packages, including Python version 3.10.

# But why use this particular image? See the image size on Docker Hub.
# Compare it to the non-slim variant.
# We can have a long discussion on this. But in short, we want the
# smallest image size that contains all required packages to run the
# app and (hopefully) secure. In the times where supply-chain attack is
# prevalent, we want to ensure that our dependencies, both system and
# app, are secure and not bloated.
FROM docker.io/python:3.10.4-slim-bullseye

# Set the active working directory for the shell running in the container.
WORKDIR /opt/flaskr

# Copy the files & folders into the filesystem in the container image.
COPY . .

# By using the shell provided from the base image, install the app dependencies.
# The dependencies will be installed inside the container image.
RUN pip install -r requirements.txt

# Document the port that will be served by a process that is running in the
# container.
EXPOSE 5000

# Tell the container engine (e.g. docker, podman) the first command that will
# be invoked when the engine starts the container. In this case, since the
# current working directory has been set into /opt/flaskr, then tell the
# shell in the container to run entrypoint.sh script file in /opt/flaskr.
ENTRYPOINT [ "/bin/bash", "./entrypoint.sh" ]

# <note>
# The example above is a very simple example of Dockerfile. Some capabilities
# are not yet explored, including:
#
# - Running the process in the container as a non-root user
# - Multi-stage build
# </note>
