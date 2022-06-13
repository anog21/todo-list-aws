import json
import decimalencoder
import todoList


def translate(event, context):
    """logic for the translate"""
    # create a response
    item = todoList.get_translated(event['pathParameters']['id'],
                    event['pathParameters']['language']
                    )
    if item:
        response = {
            "statusCode": 200, 
            "body": json.dumps(item, 
                               cls=decimalencoder.DecimalEncoder)
        }
    else:
        response = {
            "statusCode": 404,
            "body": ""
        }
    return response