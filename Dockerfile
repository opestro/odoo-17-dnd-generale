# Use an appropriate base image
FROM odoo:17

# Update package list and install git


# Set the working directory
WORKDIR /mnt/extra-addons
COPY dz_accounting /mnt/extra-addons
# Define build arguments for GitHub credentials
#ARG GITHUB_USERNAME
#ARG GITHUB_TOKEN
# Clone the specific branch from the GitHub repository
#RUN git clone --branch dz_accounting https://${GITHUB_USERNAME}:${GITHUB_TOKEN}@github.com/opestro/odoo-17-dnd-generale.git dz_accounting /mnt/extra-addons

# Expose the Odoo port
EXPOSE 8069
# Define your entrypoint or CMD here
CMD ["odoo"]
