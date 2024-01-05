import boto3

dynamodb = boto3,resouce('dynamodb')
table = dynamodb.Table('Table-CRC')

response = table.update_item(Key={ "id":"1"}, 
                  UpdateExpression='SET view_count = view_count + :incr', 
                  ExpressionAttributeValues={':incr': {"N": "1"}} 
                  )
return response
