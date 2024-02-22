import os
import sys
from flask import Flask, jsonify, request
import json
import uuid
from faker import Faker
from flask_sqlalchemy import SQLAlchemy

if sys.platform.startswith('win'):  # 如果是 Windows 系统，使用三个斜线
    prefix = 'sqlite:///'
else:  # 否则使用四个斜线
    prefix = 'sqlite:////'
app = Flask(__name__)
app.config['SQLALCHEMY_DATABASE_URI'] = prefix + os.path.join(app.root_path, "datasets", 'data.db')
app.config['SQLALCHEMY_TRACK_MODIFICATIONS'] = False  # 关闭对模型修改的监控
db = SQLAlchemy(app)

@app.route('/')
def hello_world():  # put application's code here
    return 'Hello World!'

@app.route('/home')
def home():
    faker_provider = Faker(locale='zh_CN')
    news_list = []
    for i in range(10):
        news = {
            "id": str(uuid.uuid4()),
            "name": faker_provider.name(),
            "date": faker_provider.date(),
            "link": faker_provider.url()
        }
        news_list.append(news)

    return jsonify({"status": "0", "message": "success", "data": news_list})

if __name__ == '__main__':
    app.debug = True
    app.run()
