# base_config.py

import yaml
from netmiko import ConnectHandler
from utils.config_loader import load_config
from utils.cisco_connection import establish_connection

def apply_base_config(device):
    """
    Apply base configuration to the Cisco device.
    """
    base_config_commands = [
        'hostname TCRS_SW1',
        'no ip domain-lookup',
        'enable secret cisco123',
        'line console 0',
        'logging synchronous',
        'exec-timeout 0 0',
        'line vty 0 4',
        'logging synchronous',
        'exec-timeout 0 0'
    ]

    print(f"Connecting to device {device['hostname']}...")
    connection = establish_connection(device)
    print(f"Connected to device {device['hostname']}.")

    print("Sending base configuration commands...")
    output = connection.send_config_set(base_config_commands)
    print(output)

    print("Saving configuration...")
    connection.save_config()

    print(f"Base configuration applied to device {device['hostname']}.")
    connection.disconnect()

if __name__ == "__main__":
    config = load_config('config/device_config.yaml')
    
    for device in config['devices']:
        apply_base_config(device)
