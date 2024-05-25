from datetime import datetime
from exts import db

# 数据条目
class Data(db.Model):
    __tablename__ = 'data'
    data_id = db.Column(db.Integer, primary_key=True)    # 数据 ID
    data_title = db.Column(db.String(100), nullable=False)   # 数据标题
    data_content = db.Column(db.Text)    # 数据内容
    data_author = db.Column(db.String(20))   # 数据作者（从用户表中选择）
    data_date = db.Column(db.DateTime)   # 发布日期
    data_link = db.Column(db.String(100))    # 数据链接（可以是/data?id=xxx）
    data_read_count = db.Column(db.Integer)  # 阅读数量
    data_image_url = db.Column(db.Text)  # 数据图片地址
    data_type=db.Column(db.String(20))
    def __init__(self, title, content, author, date, link, read_count, image_url,type):
        self.data_title = title
        self.data_content = content
        self.data_author = author
        self.data_date = date
        self.data_link = link
        self.data_read_count = read_count
        self.data_image_url = image_url
        self.data_type = type



# 数据标签
class DataLabel(db.Model):
    __tablename__ = 'data_label'
    label_id = db.Column(db.Integer, primary_key=True)    # 标签 ID
    label_name = db.Column(db.String(20))   # 标签名称
    label_description = db.Column(db.Text)  # 标签描述

    def __init__(self, name, description):
        self.label_name = name
        self.label_description = description


# 论文模型
class PapersModel(db.Model):
    __tablename__ = 'papers'
    id = db.Column(db.Integer, primary_key=True,autoincrement=True)
    title = db.Column(db.String(200),nullable=False)
    image_url = db.Column(db.String(255),nullable=False) #图片链接
    content=db.Column(db.Text,nullable=False)
    create_time=db.Column(db.DateTime,default=datetime.now)
    author=db.Column(db.String(100),nullable=False)
    # author_id=db.Column(db.String(100),db.ForeignKey('users.id'))   // 登录注册写完后再添加

# 评论模型
class CommentModel(db.Model):
    __tablename__ = 'comment'
    id = db.Column(db.Integer, primary_key=True,autoincrement=True)
    content=db.Column(db.Text,nullable=False)
    create_time=db.Column(db.DateTime,default=datetime.now)
    papers_id=db.Column(db.Integer,db.ForeignKey('papers.id'))
    # author_id=db.Column(db.String(100),db.ForeignKey('users.id'))   // 登录注册写完后再添加
    paper=db.relationship('PapersModel',backref=db.backref('comments',
    order_by="CommentModel.create_time.desc()",cascade="delete,delete-orphan"))       
   



# # 轮播图模型
class BannerModel(db.Model):
    __tablename__ = 'banner'  
    id = db.Column(db.Integer, primary_key=True,autoincrement=True)
    name=db.Column(db.String(255),nullable=False)  # 轮播图名称
    image_url = db.Column(db.String(255),nullable=False) #图片链接
    link_url = db.Column(db.String(255),nullable=False)  #跳转链接
#     priority = db.Column(db.Integer,default=0)  # 优先级
    create_time = db.Column(db.DateTime,default=datetime.now) # 创建时间





# 新闻条目
class News(db.Model):
    __tablename__ = 'news'
    news_id = db.Column(db.Integer, primary_key=True)    # 新闻 ID
    news_title = db.Column(db.String(100), nullable=False)   # 新闻标题
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

