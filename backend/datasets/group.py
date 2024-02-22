from ..app import db


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


