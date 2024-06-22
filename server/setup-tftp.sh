#!/bin/bash

# Update package list and install TFTP server
echo "Updating package list and installing TFTP server..."
sudo apt-get update
sudo apt-get install -y tftpd-hpa

# Create the TFTP directory if it doesn't exist
TFTP_DIR="/srv/tftp"
if [ ! -d "$TFTP_DIR" ]; then
    echo "Creating TFTP directory at $TFTP_DIR..."
    sudo mkdir -p $TFTP_DIR
fi

# Set permissions for the TFTP directory
echo "Setting permissions for the TFTP directory..."
sudo chown -R tftp:tftp $TFTP_DIR
sudo chmod -R 777 $TFTP_DIR

# Backup the original TFTP configuration file
TFTP_CONFIG="/etc/default/tftpd-hpa"
if [ ! -f "$TFTP_CONFIG.bak" ]; then
    echo "Backing up the original TFTP configuration file..."
    sudo cp $TFTP_CONFIG $TFTP_CONFIG.bak
fi

# Update TFTP configuration
echo "Updating TFTP configuration..."
sudo tee $TFTP_CONFIG <<EOF
TFTP_USERNAME="tftp"
TFTP_DIRECTORY="/srv/tftp"
TFTP_ADDRESS=":69"
TFTP_OPTIONS="--secure"
EOF

# Restart TFTP service
echo "Restarting TFTP service..."
sudo systemctl restart tftpd-hpa

# Enable TFTP service to start on boot
echo "Enabling TFTP service to start on boot..."
sudo systemctl enable tftpd-hpa

# Check the status of the TFTP service
echo "Checking the status of the TFTP service..."
sudo systemctl status tftpd-hpa | grep "Active:"

# Check if the TFTP service is running on the correct port
echo "Verifying that the TFTP service is running on port 69..."
sudo netstat -uapn | grep :69

echo "TFTP setup and installation completed."
