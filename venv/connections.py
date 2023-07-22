from flask import Flask, render_template, request, Response, json, jsonify

# inisiasi nama file
app = Flask('main')
app.config.update(
    SECRET_KEY='cbccb8d102517992ff1ad412d4bc89eedb6420c15f228dc12813d13842f1b488',
    DEBUG=True,
    JSONIFY_PRETTYPRINT_REGULAR=True,
)
