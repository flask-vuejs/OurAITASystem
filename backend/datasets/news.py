from ..app import db


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
    label_id = db.Column(db.Integer)   # 新闻标签（动态、奖项等）


# 新闻标签
class NewsLabel(db.Model):
    __tablename__ = 'news_label'
    label_id = db.Column(db.Integer, primary_key=True)    # 标签 ID
    label_name = db.Column(db.String(20))   # 标签名称
    label_description = db.Column(db.Text)  # 标签描述

