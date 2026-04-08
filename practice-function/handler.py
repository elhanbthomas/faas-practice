def handle(event, context):
    return {
        "statusCode": 200,
        "body": f"Hello from OpenFaaS! you sent {event.body.decode('utf-8')}"
    }
