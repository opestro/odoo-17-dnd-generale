# Use a lightweight Ubuntu image as a base
FROM ubuntu:22.04

# Prevent interactive prompts during package installation
ENV DEBIAN_FRONTEND=noninteractive

# Update package list and install dependencies
RUN apt-get update && apt-get install -y --no-install-recommends \
    software-properties-common \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg \
    git \
    python3 \
    python3-pip \
    python3-dev \
    build-essential \
    libxml2-dev \
    libxslt1-dev \
    zlib1g-dev \
    libsasl2-dev \
    libldap2-dev \
    libssl-dev \
    libffi-dev \
    && rm -rf /var/lib/apt/lists/*

# Install Odoo dependencies
RUN pip3 install wheel

# Clone Odoo source code from GitHub
RUN git clone --depth 1 --branch 17.0 https://github.com/odoo/odoo.git /opt/odoo

# Set the working directory
WORKDIR /opt/odoo

# Copy the local dz_accounting directory to the container
COPY /addons/dz_accounting /mnt/extra-addons/

# Move contents of dz_accounting to /mnt/extra-addons
#RUN mv /addons/* /mnt/extra-addons/

# Install Python dependencies
#RUN pip3 install -r requirements.txt

# Expose the Odoo port
EXPOSE 8069

# Command to start Odoo
CMD ["./odoo-bin", "-c", "/etc/odoo/odoo.conf"]