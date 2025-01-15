import os
from dotenv import load_dotenv


load_dotenv()


class Settings:
    BOT_TOKEN = os.environ.get("BOT_TOKEN")
    BOT_NAME = os.environ.get("BOT_NAME")
    BOT_USERNAME = os.environ.get("BOT_USERNAME")

settings = Settings()
