# Tom's Computer Repair Shop (TCRShop)

Welcome to the official repository of **Tom's Computer Repair Shop (TCRShop)**. This project is designed to demonstrate skills in network design and system administration. The setup includes a comprehensive network infrastructure for a small business environment. ***note:*** Although IPFire is an exceptional statefull firewall, it is not one I would recommend. Their are some advanced vlan techniques I had to use to meet the customers request. As a rule IPFire doesn't have a striaght forward way of configuring vlans through the WEB-UI however, I've managed a work around using iptables..

## Project Overview

This project simulates the network and server infrastructure for a small computer repair shop. The network will consist of an IPFire firewall router, Cisco IOS multilayer switch, office devices, security devices, and a Point of Sale (POS) system. Additionally, an on-site server will be deployed to handle various services.

## Network Components

- **IPFire Firewall Router**: Provides network security and management.
- **Cisco IOS Multilayer Switch**: Manages network traffic and VLANs.
- **Office Devices**: Workstations, printers, and other peripherals.
- **Security Devices**: Cameras and NVR (Network Video Recorder).
- **POS System**: For handling transactions.

## Server Components

- **Log Server**: Centralized logging for all network devices.
- **SSH Server**: Secure remote access to the network.
- **NVR**: Network Video Recorder for security cameras.
- **NFS**: Network File System for file sharing.

## Tools and Technologies

- **Git & GitHub**: Version control and project collaboration.
- **iptables**: Firewall configuration and management.
- **VLANs**: Virtual LANs for network segmentation.
- **NFS**: Network File System for file sharing.
- **Syslog**: Centralized logging.

## Project Structure


