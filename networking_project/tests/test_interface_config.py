# tests/test_interface_config.py

import pytest
from scripts.interface_config import configure_interfaces

# Mock device configuration for testing
MOCK_DEVICE = {
    'hostname': 'mock_device',
    'username': 'admin',
    'password': 'password',
    'secret': 'enable_password',
    'device_type': 'cisco_ios'
}

def test_configure_interfaces():
    """
    Test the configure_interfaces function.
    """
    # Run the configure_interfaces function with the mock device configuration
    configure_interfaces(MOCK_DEVICE)

    # Add assertions or checks here to verify the configuration changes
    # For example, you can check if specific interface configurations were applied successfully
    # You can also use Netmiko's `send_command` to fetch interface configuration from the device and verify it

    # Example assertion:
    assert True  # Placeholder assertion for demonstration purposes

if __name__ == "__main__":
    pytest.main(["-v", "-s", "--disable-warnings"])
