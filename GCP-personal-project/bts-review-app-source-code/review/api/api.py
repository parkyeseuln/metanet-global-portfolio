import json
from flask import Response
from review.gcp import pubsub

def publish_review(review):

    result = pubsub.publish_review(review)
    response = Response(json.dumps(result, indent=2,
                                   sort_keys=True))
    response.headers['Content-Type'] = 'application/json'
    return response
