# routing_config.py

import yaml
from netmiko import ConnectHandler
from utils.config_loader import load_config
from utils.cisco_connection import establish_connection

def configure_routing(device):
    """
    Apply routing configuration to the Cisco device.
    """
    routing_config_commands = [
        'router ospf 1',
        'network 192.168.10.0 0.0.0.255 area 0',
        'network 192.168.20.0 0.0.0.255 area 0',
        'router eigrp 100',
        'network 192.168.30.0 0.0.0.255',
        'network 192.168.40.0 0.0.0.255'
    ]

    print(f"Connecting to device {device['hostname']}...")
    connection = establish_connection(device)
    print(f"Connected to device {device['hostname']}.")

    print("Sending routing configuration commands...")
    output = connection.send_config_set(routing_config_commands)
    print(output)

    print(f"Routing configuration applied to device {device['hostname']}.")
    connection.disconnect()

if __name__ == "__main__":
    config = load_config('config/device_config.yaml')
    
    for device in config['devices']:
        configure_routing(device)
