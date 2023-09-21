from flask import Flask, request, Response, json, jsonify

# inisiasi nama file
app = Flask('main')
app.config.update(
    SECRET_KEY='aQ3IoxkYCESH1JcgWu2PKOH3Pj7UgiYF8P82gfyDuqMmRix54Rs0pvP8kLBBlJt3',
    DEBUG=True,
    JSONIFY_PRETTYPRINT_REGULAR=True,
)
