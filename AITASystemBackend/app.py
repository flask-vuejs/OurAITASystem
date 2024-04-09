import os
import sys
from flask import Flask, jsonify, request
import json
import uuid
from faker import Faker
from flask_sqlalchemy import SQLAlchemy

from footer import footer 

app = Flask(__name__)
app.config['SQLALCHEMY_DATABASE_URI'] = 'sqlite:///aitadata.sqlite3'
app.config['SQLALCHEMY_TRACK_MODIFICATIONS'] = False  # 关闭对模型修改的监控
db = SQLAlchemy(app)

app.register_blueprint(footer,url_prefix='/footer')



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


@app.route('/datasets/add_fake_data/group/')
def add_fake_data_group():  # 示例：添加虚拟数据到 Group 表中
    fake_group_person = Group(
        type="bioinformatic",
        role="student",
        person_name="老丁",
        person_description="少爷",
        person_image_url="xxx",
        person_content="老丁简称少爷",
        person_papers="暂无"
    )
    db.session.add(fake_group_person)
    db.session.commit()
    return "添加group数据库示例成功"


@app.route('/datasets/query/group/')
def query_group():  # 示例：从 Group 表中查询数据
    query = Group.query.filter_by(group_person_name="老丁").first()
    return f"name={query.group_person_name}"

# Flask 路由结束

# SQLAlchemy 对象开始


# 新闻条目
class News(db.Model):
    __tablename__ = 'news'
    news_id = db.Column(db.Integer, primary_key=True)    # 新闻 ID
    news_title = db.Column(db.String(100))   # 新闻标题
    news_content = db.Column(db.Text)    # 新闻内容
    news_author = db.Column(db.String(20))   # 新闻作者（从用户表中选择）
    news_date = db.Column(db.DateTime)   # 发布日期
    news_link = db.Column(db.String(100))    # 新闻链接（可以是/news?id=xxx）
    news_read_count = db.Column(db.Integer)  # 阅读数量
    news_image_url = db.Column(db.Text)  # 新闻图片地址
    label_id = db.Column(db.Integer)   # 新闻标签（动态、奖项等）(从标签表中选择）

    def __init__(self, title, content, author, date, link, read_count, image_url, label_id):
        self.news_title = title
        self.news_content = content
        self.news_author = author
        self.news_date = date
        self.news_link = link
        self.news_read_count = read_count
        self.news_image_url = image_url
        self.label_id = label_id


# 新闻标签
class NewsLabel(db.Model):
    __tablename__ = 'news_label'
    label_id = db.Column(db.Integer, primary_key=True)    # 标签 ID
    label_name = db.Column(db.String(20))   # 标签名称
    label_description = db.Column(db.Text)  # 标签描述

    def __init__(self, name, description):
        self.label_name = name
        self.label_description = description


# 软件类型
class Software(db.Model):
    __tablename__ = 'software'
    software_id = db.Column(db.Integer, primary_key=True)
    software_belong = db.Column(db.String(255))   # 所属类型（医学影像、关联预测等）
    software_type = db.Column(db.String(255))   # 软件类型（分类、预测、分割等）
    software_url = db.Column(db.String(255))    # 链接（点击跳转到模型页面）

    def __init__(self, belong, type, url):
        self.software_belong = belong
        self.software_type = type
        self.software_url = url


# 模型
class Models(db.Model):
    __tablename__ = 'models'
    models_id = db.Column(db.Integer, primary_key=True)
    models_disease = db.Column(db.String(255))  # 疾病类型
    models_name = db.Column(db.String(255))     # 模型名称（选择模型）
    models_input_type = db.Column(db.String(255))   # 输入类型（图片、文本、其他）
    models_input_num = db.Column(db.Integer)    # 输入数量
    models_path = db.Column(db.String(255))     # 模型路径
    models_parameters = db.Column(db.String(255))   # 模型运行参数

    def __init__(self, disease, name, input_type, input_num, path, parameters):
        self.models_disease = disease
        self.models_name = name
        self.models_input_type = input_type
        self.models_input_num = input_num
        self.models_path = path
        self.models_parameters = parameters


# 团队风采
class Group(db.Model):
    __tablename__ = 'group'
    group_id = db.Column(db.Integer, primary_key=True)
    group_type = db.Column(db.String(20))   # 所属团队（云计算、生信、石油工业）
    group_role = db.Column(db.String(20))   # 身份（教师、学生）
    group_person_name = db.Column(db.String(20))    # 姓名
    group_person_description = db.Column(db.String(20))     # 简介
    group_person_image_url = db.Column(db.Text)     # 照片链接地址
    group_person_content = db.Column(db.Text)   # 详细描述
    group_person_papers = db.Column(db.Text)    # 论文

    def __init__(self, type, role, person_name, person_description, person_image_url, person_content, person_papers):
        # self.group_id = id
        self.group_type = type
        self.group_role = role
        self.group_person_name = person_name
        self.group_person_description = person_description
        self.group_person_image_url = person_image_url
        self.group_person_content = person_content
        self.group_person_papers = person_papers


# SQLAlchemy 对象结束

if __name__ == '__main__':
    app.debug = True
    app.run()

