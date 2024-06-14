# utils/cisco_connection.py

from netmiko import ConnectHandler

def establish_connection(device):
    """
    Establish an SSH connection to the Cisco device.
    """
    connection = ConnectHandler(
        device_type=device['device_type'],
        host=device['hostname'],
        username=device['username'],
        password=device['password'],
        secret=device['secret']
    )
    connection.enable()
    return connection
