
from flask import Flask
from flask_cors import CORS
from flask_migrate import Migrate
from flask_wtf import CSRFProtect
from exts import db
from Papers import papers  
from Group import group
from cmsbackend import views
from datasets import datasets
def create_app():
    app = Flask(__name__,static_folder='media') #指定静态文件路径为media
    CORS(app, resources={r'/*': {'origins': '*'}}, supports_credentials=True)
    app.config.from_object(__name__)
    # 数据库连接部分的解释： '数据库类型+驱动程序名：//数据库用户名:密码@主机地址:端口号/连接的数据库名'
    # 根据自己本地的mysql 数据库连接信息进行修改
    app.config['SQLALCHEMY_DATABASE_URI'] = 'mysql+pymysql://root:123@localhost:3306/mydb1'
    app.config['SQLALCHEMY_TRACK_MODIFICATIONS'] = False  # 关闭对模型修改的监控
    # 添加一个路由来直接服务于'media'文件夹中的文件
    @app.route('/media/<path:filename>')
    def serve_media(filename):
        return send_from_directory(app.static_folder, filename)
    
    
    csrf = CSRFProtect()
    csrf.init_app(app)
    # 排除cmsapi的csrf验证
    csrf.exempt(views.cmsapi)
    db.init_app(app)
    migrate=Migrate(app,db)
    app.register_blueprint(papers)
    app.register_blueprint(views.cmsapi)
    app.register_blueprint(group)
    app.register_blueprint(datasets)
    return app