import datetime
from flask import Flask, request, jsonify
from flask import Blueprint
import restful
from models import *
from form import PublicPapersForm

papers=Blueprint('papers',__name__,url_prefix="/")   #创建蓝图

# 测试内容
@papers.route('/test')
def _test():
    return restful.params_error(message='请先传入邮箱')
    # return "test"

# # 发布论文
# @papers.route('/Papers/public',methods=['GET','POST'])
# #  @login_required  
# def public_papers():
#     if request.method=='POST':
#         datas=request.get_json(silent=True)
#         form=PublicPapersForm(datas)
#         if form.validate():
#             title=datas.title.data
#             content=datas.content.data
#             author=datas.author.data
#             create_time=datetime.now()
#             paper=PapersModel(title=title,content=content,author=author,create_time=create_time)
#             db.session.add(paper)
#             db.session.commit()
#             return restful.ok()
#         else:
#             return restful.params_error(message='不符合wtf验证')


@papers.route('/Papers/public', methods=['GET', 'POST'])
def public_papers():
    # print(request.form.to_dict())
    if request.method == 'POST':
        data=request.get_json(silent=True)
        title = data['title']
        content = data['htmlContent']
        author = data['author']

        # print(request.form)
        # title = request.form.get('title')
        # content = request.form.get('content')
        # author = request.form.get('author')

        if title and content and author:  # 简单的非空验证
            create_time = datetime.now()
            paper = PapersModel(
                title=title,
                content=content,
                author=author,
                create_time=create_time
            )
            print(paper)
            db.session.add(paper)
            db.session.commit()
            return restful.ok()
        else:
            return restful.params_error(message='必填字段未填写完整')

#     # 如果需要，此处添加处理 GET 请求的逻辑    