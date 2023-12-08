from flask import Flask

app = Flask(__name__)

# Load configurations from the config module
app.config.from_object('config')  # You can create a config.py file for configuration settings

# Import routes and models to register them with the app
from app import routes, models

if __name__ == '__main__':
    app.run(debug=True)
