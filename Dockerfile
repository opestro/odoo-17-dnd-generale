# Use an appropriate base image
FROM odoo:17

# Set the working directory
WORKDIR /mnt/extra-addons

# Copy the current directory contents into the container at /app
COPY ./addons /mnt/extra-addons

# Copy the /addons directory into the container
COPY ./addons /app/addons
# Expose the Odoo port
EXPOSE 8069
# Define your entrypoint or CMD here
CMD ["odoo"]
