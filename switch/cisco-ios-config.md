# SWITCH Directory Configuration Files
![Switch](/tcrshop/assets/cisco_48.png)

## Purpose
The `SWITCH` directory contains configuration files for various tasks on a Cisco IOS switch. Each file includes commands to configure a specific feature or function. Users can copy and paste the example settings into the terminal to apply the configurations. Remember they are just example of what you can apply to your network.

## Configuration Files

### 1. vlan.cfg
**Purpose:** Configure VLANs on the switch.

**Contents:**
```plaintext
vlan 10
 name Sales
vlan 20
 name Engineering
vlan 30
 name Marketing
exit
