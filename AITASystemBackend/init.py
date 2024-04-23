
from flask import Flask
from flask_cors import CORS
from flask_migrate import Migrate

from exts import db
from Papers import papers  

def create_app():
    app = Flask(__name__)
    CORS(app, resources={r'/*': {'origins': '*'}}, supports_credentials=True)
    app.config.from_object(__name__)
    # 数据库连接部分的解释： '数据库类型+驱动程序名：//数据库用户名:密码@主机地址:端口号/连接的数据库名'
    # 根据自己本地的mysql 数据库连接信息进行修改
    app.config['SQLALCHEMY_DATABASE_URI'] = 'mysql+pymysql://root:123@localhost:3306/mydb1'
    app.config['SQLALCHEMY_TRACK_MODIFICATIONS'] = False  # 关闭对模型修改的监控
    db.init_app(app)
    migrate=Migrate(app,db)
    app.register_blueprint(papers)
    return app