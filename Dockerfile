# Use the Python 3.7.7-stretch base image
FROM python:3.7.7-stretch AS BASE

# Update and install necessary packages
RUN apt-get update \
    && apt-get --assume-yes --no-install-recommends install \
        build-essential \
        curl \
        git \
        jq \
        libgomp1 \
        vim

# Set the working directory to /app
WORKDIR /app

# Upgrade pip
RUN pip install --no-cache-dir --upgrade pip

# Install Rasa with a specific version
RUN pip install rasa==2.8.1

# Copy configuration files into the image
ADD config.yml config.yml
ADD domain.yml domain.yml
ADD credentials.yml credentials.yml
ADD endpoints.yml endpoints.yml
