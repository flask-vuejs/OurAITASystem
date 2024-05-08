import os
import sys
from faker import Faker
from flask import Flask, jsonify, request
import json
import uuid
from models import *
from AIdata import *
from init import create_app
app = create_app()

# 调用关系： app.py 调用 __init__.py 调用 xxx.py 调用 models.py 调用 exts.py


# Flask 路由起始

@app.route('/')
def hello_world():  # put application's code here
    return 'AITA系统后台服务'
   

@app.route('/home/')
def home():
    faker_provider = Faker(locale='zh_CN')
    # 创建了一个 Faker 对象，它是 faker 库的一个实例，用于生成随机但逼真的假数据
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
#     "status"：设置为字符串 "0"，通常表示请求成功。
#     "message"：设置为字符串 "success"，进一步明确请求处理成功。
#     "data"：设置为之前生成的 news_list，包含 10 条模拟新闻数据的列表。


@app.route('/create_datasets/')
def create_datasets():  # 创建数据库示例
    db.create_all()
    return "create datasets successfully"


@app.route('/recreate_datasets/')
def recreate_datasets():    # 重新创建数据库示例（⚠️注意：重新创建数据库会清空数据，谨慎操作）
    db.drop_all()
    db.create_all()
    return "recreate datasets successfully"



# 从news表中查询数据
@app.route('/all_news')
def get_all_news():
    # return 'hello world'
    datas = News.query.all()
    news_list=[]
    for data in datas:
        news_dict = {
            "news_id":data.news_id,
            "news_title":data.news_title,
            "news_content":data.news_content,
            "news_date":data.news_date,
            "news_author":data.news_author,
            "news_link":data.news_link,
            "news_read_count":data.news_read_count,
            "news_image_url":data.news_image_url,
            "label_id":data.label_id,
        }
        news_list.append(news_dict)
    if news_list:
        return jsonify(news_list)
    else:
        response = {"message": "No news records found in the database."}
        return jsonify(response), 404
# Flask 路由结束


#从data表查数据
@app.route('/datasets')
def get_all_datasets():
    print("111")
    # 获取查询参数
    type_param = request.args.get('type')
    # 打印参数
    print("查询参数 type_param:", type_param)
    # 如果没有传递 type 参数，则默认查询所有数据
    if not type_param:
        datas = Data.query.all()
    else:
        # 根据 type 参数来过滤数据
        datas = Data.query.filter_by(data_type=type_param).all()

    data_list = []
    for data in datas:
        data_dict = {
            "data_id": data.data_id,
            "data_title": data.data_title,
            "data_content": data.data_content,
            "data_date": data.data_date,
            "data_author": data.data_author,
            "data_link": data.data_link,
            "data_read_count": data.data_read_count,
            "data_image_url": data.data_image_url,
        }
        data_list.append(data_dict)

    if data_list:
        return jsonify(data_list)
    else:
        response = {"message": "No data records found in the database."}
        return jsonify(response), 404

if __name__ == '__main__':
    #app.debug = True
    app.run(debug=True)

