from review.api import api
from flask import Flask
from flask import send_from_directory
from flask import request, redirect

app = Flask(__name__, static_folder='static')

@app.route('/')
def serve_home():
    return send_from_directory('review/webapp/static/client', 'index.html')

@app.route('/<path:path>')
def serve_client_files(path):
    return send_from_directory('review/webapp/static/client', path)

@app.route('/review', methods=['POST'])
def review_method():
    review = request.get_json()
    return api.publish_review(review)

if __name__ == "__main__":
    app.run(debug=True, port=80)

