import logging
import sys
import time
import json

from review.gcp import pubsub, languageapi, spanner

logging.basicConfig(stream=sys.stdout, level=logging.INFO)
log = logging.getLogger()

def pubsub_callback(message):
    message.ack()

    log.info('Message received')
    log.info(message)

    data = json.loads(message.data)
    score = languageapi.analyze(str(data['review']))
    log.info('Score: {}'.format(score))

    data['score'] = score
    log.info(data['timestamp'])    

    spanner.save_review(data)
    log.info('Feedback saved')    

def main():
    pubsub.pull_review(pubsub_callback)
    
    while True:
        time.sleep(60)

if __name__ == '__main__':
    main()
