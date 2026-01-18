#Write a Python script to demonstrate global vs local variables in a deployment context

GLOBAL_ENV = "production"

def deploy_service(service):
    local_env = "staging"
    print(f"Deploying {service} to local env: {local_env}")
    print(f"Global env remains: {GLOBAL_ENV}")

deploy_service("nginx")