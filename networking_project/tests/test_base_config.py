# tests/test_base_config.py

import pytest
from scripts.base_config import apply_base_config

# Mock device configuration for testing
MOCK_DEVICE = {
    'hostname': 'mock_device',
    'username': 'admin',
    'password': 'password',
    'secret': 'enable_password',
    'device_type': 'cisco_ios'
}

def test_apply_base_config():
    """
    Test the apply_base_config function.
    """
    # Run the apply_base_config function with the mock device configuration
    apply_base_config(MOCK_DEVICE)

    # Add assertions or checks here to verify the configuration changes
    # For example, you can check if specific commands were applied successfully
    # You can also use Netmiko's `send_command` to fetch configuration from the device and verify it

    # Example assertion:
    assert True  # Placeholder assertion for demonstration purposes

if __name__ == "__main__":
    pytest.main(["-v", "-s", "--disable-warnings"])
