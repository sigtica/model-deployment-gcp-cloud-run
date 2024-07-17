from flask import Flask, jsonify
import os

app = Flask(__name__)

@app.route('/', methods=['GET'])
def default():
    # load model here

    # send back response
    probability = 0 # for example, send back probability predicted by a model

    return jsonify({'probability': probability})


if __name__ == "__main__":
    app.run(debug=True, host='0.0.0.0', port=int(os.environ.get('PORT', 8080)))
