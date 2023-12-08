import os

class Config:
    SECRET_KEY = 'your_secret_key'
    SQLALCHEMY_DATABASE_URI = 'postgresql+psycopg2://your_database_user:your_database_password@localhost:5432/your_database_name'
    SQLALCHEMY_TRACK_MODIFICATIONS = False
