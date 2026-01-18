#Write a Python script to demonstrate creating and importing a custom module for DevOps utilities

# utils.py
def greet(name):
    return f"Hello, {name}"

def check_port(port):
    import socket
    sock = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
    result = sock.connect_ex(("localhost", port))
    return result == 0

# main.py
import utils

print(utils.greet("Uttiya"))
print("Port 80 open:", utils.check_port(80))
