#!/bin/bash

# Copy custom addons to the desired location
cp -r /mnt/custom-addons/* /mnt/extra-addons/

# Set permissions for the copied addons
chmod -R 777 /mnt/extra-addons

# Execute the original entrypoint
exec "$@