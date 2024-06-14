# interface_config.py

import yaml
from netmiko import ConnectHandler
from utils.config_loader import load_config
from utils.cisco_connection import establish_connection

def configure_interfaces(device):
    """
    Apply interface configuration to the Cisco device.
    """
    interface_config_commands = [
    'interface GigabitEthernet3/3',
    'description Connection to firewall. This is a Trunk',
    'switchport',
    'switchport trunk encapsulation dot1q',
    'switchport trunk allowed vlan 1,12,14,16',
    'switchport mode trunk',
    'no shutdown',
    'interface GigabitEthernet0/0',
    'description Connection to MacBook',
    'switchport',
    'switchport mode access',
    'no shutdown'
]


    print(f"Connecting to device {device['hostname']}...")
    connection = establish_connection(device)
    print(f"Connected to device {device['hostname']}.")

    print("Sending interface configuration commands...")
    output = connection.send_config_set(interface_config_commands)
    print(output)

    print(f"Interface configuration applied to device {device['hostname']}.")
    connection.disconnect()

if __name__ == "__main__":
    config = load_config('config/device_config.yaml')
    
    for device in config['devices']:
        configure_interfaces(device)
