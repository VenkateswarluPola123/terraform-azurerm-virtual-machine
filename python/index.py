def lambda_handler(event, context):
   message = 'Hello From Lambda {} !'.format(event['key1'])
   return {
       'message' : message
   }
