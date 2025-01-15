import os
from dotenv import load_dotenv

load_dotenv()

class Settings:
    BOT_TOKEN = os.environ.get('BOT_TOKEN')
    BOT_NAME = os.environ.get('BOT_NAME')
    BOT_USERNAME = os.environ.get('BOT_USERNAME')
    CHAT_ID = os.environ.get('CHAT_ID')

settings = Settings()
