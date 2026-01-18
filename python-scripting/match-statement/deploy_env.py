#Write a Python script to handle deployment environment logic using match-case statements

env = "prod"

match env:
    case "dev":
        print("Deploying to development cluster")
    case "test":
        print("Deploying to staging cluster")
    case "prod":
        print("Deploying to production cluster with monitoring enabled")
    case _:
        print("Unknown environment — aborting deployment")
