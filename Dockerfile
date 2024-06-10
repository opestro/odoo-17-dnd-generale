# Use an appropriate base image
FROM odoo:17

# Update package list and install git
RUN apt-get update && apt-get install -y git

# Set the working directory
WORKDIR /mnt/extra-addons

# Clone the specific branch from the GitHub repository
RUN git clone --branch dz_accounting https://github.com/opestro/odoo-17-dnd-generale.git dz_accounting /mnt/extra-addons

# Expose the Odoo port
EXPOSE 8069
# Define your entrypoint or CMD here
CMD ["odoo"]
