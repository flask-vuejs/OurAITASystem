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

# 发布论文
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

#论文列表
@papers.route("/Papers/list")
def get_papers_list():
    papers=PapersModel.query.order_by(PapersModel.create_time.desc()).all()
    papers_list=[]
    for paper in papers:
        papers_dict={
            "papers_id":paper.id,
            "title":paper.title,
            "content":paper.content,
            "author":paper.author,
            "create_time":paper.create_time,
        }
        papers_list.append(papers_dict)
    if papers_list:
        return jsonify(papers_list)
    else:
        response = {"message": "No papers records found in the database."}
        return jsonify(response), 404


# 论文详情
@papers.route("/Papers/detail/<int:papers_id>")
def get_papers_detail(papers_id):
    try:
        paper=PapersModel.query.get(papers_id)
        if paper:
            # comment_count=CommentModel.query.filter_by(papers_id=papers_id).count()
            return jsonify({
                "title":paper.title,
                "content":paper.content,
                "author":paper.author,
                "create_time":paper.create_time
            })
    except:
        return "404"


# 论文发布评论
@papers.route("/comment")
def public_comment():
    data=request.get_json(silent=True)
    if form:
        content=data['content']
        papers_id=data['papers_id']
        try:
            paper=PapersModel.query.get(papers_id)
        except Exception as e:
            return restful.params_error(message='论文不存在')
        create_time=datetime.now()
        comment=CommentModel(
            content=content,
            create_time=create_time,
            papers_id=papers_id
        )
        db.session.add(comment)
        db.session.commit()
        return restful.ok()
    else:
        return restful.params_error(message='参数错误')

