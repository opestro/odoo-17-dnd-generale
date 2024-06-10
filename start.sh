# start.sh
#!/bin/bash

# Execute pre-container startup commands
echo "Running pre-startup commands"
sudo chmod -R 777 addons
sudo chmod -R 777 etc
sudo chmod -R 777 postgresql