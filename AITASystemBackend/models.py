from datetime import datetime
from exts import db


# 将ORM模型映射到数据库中
# 1，初始化迁移仓库：flask db init
# 2，将ORM模型生成迁移脚本：flask db migrate
# 3，运行迁移脚本：flask db upgrade
# flask db stamp 命令：强制更新 Alembic 版本表中的版本号，使其与数据库的实际状态相匹配

# 数据条目
class Data(db.Model):
    __tablename__ = 'data'
    data_id = db.Column(db.Integer, primary_key=True,autoincrement=True)    # 数据 ID
    data_title = db.Column(db.String(100), nullable=False)   # 数据标题
    data_abstract = db.Column(db.Text)    # 数据摘要
    data_content = db.Column(db.Text)    # 数据内容
    data_author = db.Column(db.String(20))   # 数据作者
    data_date = db.Column(db.DateTime)   # 发布日期
    data_link = db.Column(db.String(100))    # 数据链接
    data_read_count = db.Column(db.Integer)  # 阅读数量
    data_image_url = db.Column(db.Text)  # 数据图片地址
    data_type=db.Column(db.String(30))




# 数据标签
class DataLabel(db.Model):
    __tablename__ = 'data_label'
    label_id = db.Column(db.Integer, primary_key=True,autoincrement=True)    # 标签 ID
    label_name = db.Column(db.String(20))   # 标签名称
    label_description = db.Column(db.Text)  # 标签描述



# 论文模型
class PapersModel(db.Model):
    __tablename__ = 'papers'
    id = db.Column(db.Integer, primary_key=True,autoincrement=True)
    title = db.Column(db.String(200),nullable=False)
    image_url = db.Column(db.String(255),nullable=False) #图片链接
    content=db.Column(db.Text,nullable=False)
    create_time=db.Column(db.DateTime,default=datetime.now)
    author=db.Column(db.String(100),nullable=False)
    abstract = db.Column(db.Text, nullable=True)
    keywords = db.Column(db.String(255), nullable=True) 


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
   



# # # 轮播图模型
# class BannerModel(db.Model):
#     __tablename__ = 'banner'  
#     id = db.Column(db.Integer, primary_key=True,autoincrement=True)
#     name=db.Column(db.String(255),nullable=False)  # 轮播图名称
#     image_url = db.Column(db.String(255),nullable=False) #图片链接
#     link_url = db.Column(db.String(255),nullable=False)  #跳转链接
# #     priority = db.Column(db.Integer,default=0)  # 优先级
#     create_time = db.Column(db.DateTime,default=datetime.now) # 创建时间





# 新闻条目
class News(db.Model):
    __tablename__ = 'news'
    news_id = db.Column(db.Integer, primary_key=True,autoincrement=True)    # 新闻 ID
    news_title = db.Column(db.String(100), nullable=False)   # 新闻标题
    news_content = db.Column(db.Text)    # 新闻内容
    news_author = db.Column(db.String(20))   # 新闻作者（从用户表中选择）
    news_date = db.Column(db.DateTime)   # 发布日期
    news_link = db.Column(db.String(100))    # 新闻链接（可以是/news?id=xxx）
    news_read_count = db.Column(db.Integer)  # 阅读数量
    news_image_url = db.Column(db.Text)  # 新闻图片地址
    label_id = db.Column(db.Integer)   # 新闻标签（动态、奖项等）(从标签表中选择）


# 新闻标签
class NewsLabel(db.Model):
    __tablename__ = 'news_label'
    label_id = db.Column(db.Integer, primary_key=True,autoincrement=True)    # 标签 ID
    label_name = db.Column(db.String(20))   # 标签名称
    label_description = db.Column(db.Text)  # 标签描述




# 软件类型
class Software(db.Model):
    __tablename__ = 'software'
    software_id = db.Column(db.Integer, primary_key=True,autoincrement=True)
    software_belong = db.Column(db.String(255))   # 所属类型（医学影像、关联预测等）
    software_type = db.Column(db.String(255))   # 软件类型（分类、预测、分割等）
    software_url = db.Column(db.String(255))    # 链接（点击跳转到模型页面）



# 模型
class Models(db.Model):
    __tablename__ = 'models'
    models_id = db.Column(db.Integer, primary_key=True,autoincrement=True)
    models_disease = db.Column(db.String(255))  # 疾病类型
    models_name = db.Column(db.String(255))     # 模型名称（选择模型）
    models_input_type = db.Column(db.String(255))   # 输入类型（图片、文本、其他）
    models_input_num = db.Column(db.Integer)    # 输入数量
    models_path = db.Column(db.String(255))     # 模型路径
    models_parameters = db.Column(db.String(255))   # 模型运行参数




# 团队风采
class Group(db.Model):
    __tablename__ = 'group'
    group_id = db.Column(db.Integer, primary_key=True,autoincrement=True)
    group_type = db.Column(db.String(20))   # 所属团队（云计算、生信、石油工业）
    group_role = db.Column(db.String(20))   # 身份（教师、学生）
    group_person_name = db.Column(db.String(20))    # 姓名
    group_person_description = db.Column(db.String(20))     # 简介
    group_person_image_url = db.Column(db.Text)     # 照片链接地址
    group_person_content = db.Column(db.Text)   # 详细描述
    group_person_papers = db.Column(db.Text)    # 论文

class Zxxm(db.Model):
    """
    纵向科技项目模型
    """
    __tablename__ = 'zxxm'
    
    id = db.Column(db.Integer, primary_key=True, autoincrement=True)
    name = db.Column(db.String(255), nullable=False)  # 项目名称
    description = db.Column(db.Text)  # 项目描述，使用 Text 类型以支持长文本
    funding_agency = db.Column(db.String(255), nullable=False)  # 资助机构
    start_date = db.Column(db.DateTime, nullable=False)  # 项目开始日期
    end_date = db.Column(db.DateTime, nullable=False)  # 项目结束日期
    principal_investigator = db.Column(db.String(100))  # 项目负责人
    budget = db.Column(db.Float)  # 项目预算
    status = db.Column(db.String(50), nullable=False, default='Ongoing')  # 项目状态（例如：Ongoing, Completed, Cancelled）


class Hxxm(db.Model):
    """
    横向科技项目模型
    """
    __tablename__ = 'hxxm'
    
    id = db.Column(db.Integer, primary_key=True, autoincrement=True)
    name = db.Column(db.String(255), nullable=False)  # 项目名称
    description = db.Column(db.Text)  # 项目描述，使用 Text 类型以支持长文本
    client = db.Column(db.String(255), nullable=False)  # 委托方（企事业单位、兄弟单位等）
    start_date = db.Column(db.DateTime, nullable=False)  # 项目开始日期
    end_date = db.Column(db.DateTime, nullable=False)  # 项目结束日期
    project_manager = db.Column(db.String(100))  # 项目经理
    budget = db.Column(db.Float)  # 项目预算（可能包括收入和支出）



