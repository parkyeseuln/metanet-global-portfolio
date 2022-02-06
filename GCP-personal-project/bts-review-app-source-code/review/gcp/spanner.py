import re
from google.cloud import spanner

spanner_client = spanner.Client()
instance = spanner_client.instance('review-instance')
database = instance.database('review-database')

def save_review(data):
    with database.batch() as batch:
        review_id = str(data['timestamp'])
        batch.insert(
            table='review',
            columns=(
                'reviewId',
                'review'
                'rating',
                'score',
                'timestamp'
            ),
            values=[
                (
                    review_id,
                    data['review'],
                    data['rating'],
                    data['score'],
                    data['timestamp'],
                )
            ]
        )
        

