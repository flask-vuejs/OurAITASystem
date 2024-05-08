from wtforms import Form,ValidationError
from wtforms.fields import StringField,IntegerField,FileField
from flask_wtf.file import FileAllowed,FileSize
from wtforms.validators import InputRequired,Length

class BaseForm(Form):
  @property
  def messages(self):
    message_list = []
    if self.errors:
      for errors in self.errors.values():
        message_list.extend(errors)
    return message_list


# 图片验证
class ImageForm(BaseForm):
    image = FileField(
        validators=[
        FileAllowed(['jpg','png','jpeg'],
        message="只能上传 jpg,png,jpeg 格式的图片！"),
        FileSize(max_size=1024*1024*5,message="图片大小不能超过5M！")
        ]
    )

# 添加论文验证
class AddPapersForm(BaseForm):
    name = StringField(
        validators=[
            InputRequired(message="论文名称不能为空！")
        ]
    )
    image_url = StringField(
        validators=[
            InputRequired(message="图片地址不能为空！")
        ]
    )
    link_url=StringField(
        validators=[
            InputRequired(message="论文地址不能为空！")
        ]
    )  