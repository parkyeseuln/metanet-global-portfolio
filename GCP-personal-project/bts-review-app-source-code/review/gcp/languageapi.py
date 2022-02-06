from google.cloud import language_v1

lang_client = language_v1.LanguageServiceClient()

def analyze(text):

    doc = language_v1.types.Document(content=text,
                    type_='PLAIN_TEXT')
    sentiment = lang_client.analyze_sentiment(
                    document=doc).document_sentiment
    return sentiment.score
