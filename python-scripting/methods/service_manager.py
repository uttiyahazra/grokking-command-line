#Write a Python script to define a class with instance, class, and static methods for managing services

import subprocess

class ServiceManager:
    count = 0

    def __init__(self, name):
        self.name = name

    def start(self):  # instance method
        subprocess.run(["systemctl", "start", self.name])
        print(f"Started {self.name}")
        ServiceManager.increment()

    @classmethod
    def increment(cls):  # class method
        cls.count += 1
        print(f"Total services started: {cls.count}")

    @staticmethod
    def info():  # static method
        print("ServiceManager controls systemd services")

svc = ServiceManager("nginx")
svc.start()
ServiceManager.info()
