from ..app import db


# 软件类型
class Software(db.Model):
    __tablename__ = 'software'
    software_id = db.Column(db.Integer, primary_key=True)
    software_belong = db.Column(db.String(255))   # 所属类型（医学影像、关联预测等）
    software_type = db.Column(db.String(255))   # 软件类型（分类、预测、分割等）
    software_url = db.Column(db.String(255))    # 链接（点击跳转到模型页面）


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

