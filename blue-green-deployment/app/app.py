from flask import Flask
import os

app = Flask(__name__)

@app.route('/')
def home():
    app_env = os.getenv("APP_ENV", "default")
    return f"Hello from {app_env}!"

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=8080)
