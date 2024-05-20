import datetime
from flask import Flask, request, jsonify
from flask import Blueprint
import restful
from models import *
#from form import PublicPapersForm

papers=Blueprint('papers',__name__,url_prefix="/")   #创建蓝图

# 测试内容
@papers.route('/test')
def _test():
    return restful.params_error(message='请先传入邮箱')
    # return "test"


# 发布论文
@papers.route('/Papers/public',methods=['GET','POST'])
#  @login_required  
def public_papers():
    if request.method=='POST':
        form=PublicPapersForm(request.form)
        if form.validate():
            title=form.title.data
            content=form.content.data
            author=form.author.data
            paper=PapersModel(title=title,content=content,author=author)
            db.session.add(paper)
            db.session.commit()
            return restful.success()
        else:
            return restful.params_error(message=form.get_error())
    