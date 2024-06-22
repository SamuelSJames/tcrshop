#!/bin/bash

# Exit immediately if a command exits with a non-zero status
set -e

# Ensure the script is run as root
if [ "$(id -u)" -ne 0 ]; then
  echo "This script must be run as root" >&2
  exit 1
fi

# Install necessary packages
echo "Installing necessary packages..."
apt-get update
apt-get install -y ifenslave vlan

# Load necessary kernel modules
echo "Loading kernel modules..."
modprobe bonding
modprobe 8021q

# Ensure kernel modules are loaded at boot
echo "Ensuring kernel modules load at boot..."
echo "bonding" >> /etc/modules
echo "8021q" >> /etc/modules

# Configure network interfaces
echo "Configuring network interfaces..."
cat <<EOL > /etc/network/interfaces
# Bonding interface
auto bond0
iface bond0 inet manual
    bond-mode 802.3ad
    bond-miimon 100
    bond-slaves ens1 ens2

# Physical interfaces
auto ens1
iface ens1 inet manual
    bond-master bond0

auto ens2
iface ens2 inet manual
    bond-master bond0

# VLAN interfaces on bond0
auto bond0.12
iface bond0.12 inet static
    address 192.168.12.10
    netmask 255.255.255.0
    vlan-raw-device bond0

auto bond0.14
iface bond0.14 inet static
    address 192.168.14.10
    netmask 255.255.255.0
    vlan-raw-device bond0

auto bond0.16
iface bond0.16 inet static
    address 192.168.16.10
    netmask 255.255.255.0
    vlan-raw-device bond0
EOL

# Restart networking service
echo "Restarting networking service..."
systemctl restart networking

# Check the status of the bonding interface
echo "Checking bond0 status..."
cat /proc/net/bonding/bond0

# Check the status of the VLAN interfaces
echo "Checking VLAN interfaces status..."
ip -d link show bond0.12
ip -d link show bond0.14
ip -d link show bond0.16

echo "Setup complete. The bond0 interface and VLANs should be configured and up."
