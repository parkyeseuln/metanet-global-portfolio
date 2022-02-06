import json
import logging
import os
project_id = os.getenv('GCLOUD_PROJECT')

from google.cloud import pubsub_v1
from flask import current_app

publisher = pubsub_v1.PublisherClient()
topic_path = publisher.topic_path(project_id, 'review')
sub_client = pubsub_v1.SubscriberClient()
sub_path = sub_client.subscription_path(project_id, 'worker-subscription')

def publish_review(review):
    payload = json.dumps(review, indent=2,
                         sort_keys=True)
    data = payload.encode('utf-8')
    future = publisher.publish(topic_path, data=data)
    return future.result()

def pull_review(callback):
    sub_client.subscribe(sub_path, callback=callback)
    
