#  flask-wtf基于wtforms 的表单验证
from wtforms import Form, StringField, PasswordField, validators


# # 注册wtf验证
# class RegisterForm(Form):
#     email = StringField(validators=[Email(message="请输入正确的邮箱！")])
#     email_captcha=StringField(validators=[Length(min=6, max=6,message="验证码错误！")])
#     username = StringField(validators=[Length(min=3, max=20, message="用户名长度在3-20之间！")])
#     password=StringField(validators=[Length(min=6, max=20, message="密码长度在6-20之间！")])
#     repeat_password=StringField(validators=[EqualTo('password',message="两次密码不一致！")])
#     graph_captcha=StringField(validators=[Length(min=4, max=4,message="请输入正确长度的图形验证码！")])
#     # password = PasswordField('New Password', [
#     #     validators.DataRequired(),
#     #     validators.EqualTo('confirm', message='Passwords must match')
#     # ])
#     # confirm = PasswordField('Repeat Password')

# 论文wtf验证
# class PublicPapersForm(Form):
#     title = StringField(validators=[Length(min=3, max=200, message="标题长度在3-200之间！")])
#     content = StringField(validators=[InputRequired(message="内容不能为空！")])
#     author = StringField(validators=[Length(min=2, max=20, message="作者长度在2-20之间！")])
#     # create_time = StringField(validators=[Length(min=3, max=20, message="时间长度在3-20之间！")])
#     # papers_id = StringField(validators=[Length(min=3, max=20, message="id长度在3-20之间！")])