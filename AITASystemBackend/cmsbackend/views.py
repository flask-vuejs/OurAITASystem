from flask import Blueprint,send_from_directory,request,jsonify
from .forms import ImageForm,AddPapersForm
import os 
import restful
from datetime import datetime
from config import BASE_DIR
from models import PapersModel
from exts import db

cmsapi=Blueprint('cmpapi',__name__,url_prefix="/cmsapi")
@cmsapi.route('/papers/img/upload',methods=['POST','GET'])
def upload_image():
    form=ImageForm(request.files)
    if form.validate():
        image=form.image.data
        filename=image.filename
        image_path=os.path.join(BASE_DIR,"media","papers",filename)
        image.save(image_path)
        return restful.ok(data={"image_url":filename})
    else:
        message=form.messages[0]
        return restful.params_error(message=message)

@cmsapi.route('/papers/<filename>')
def get_paper_image():
    return send_from_directory(BASE_DIR,"media","papers",filename)

@cmsapi.route('/papers/add')
def add_papers():
    form=AddPapersForm(request.form)
    if form.validate():
        name=form.name.data
        image_url=form.image_url.data
        link_url=form.link_url.data
        # 存入数据库操作...
        return restful.ok()
    else:
        message=form.messages[0]
        return restful.params_error(message=message)

# 论文列表
@cmsapi.route('/papers/list')     
def papers_list():
    page=request.args.get('page',default=1,type=int)
    # 分页参数
    per_page_count=10
    start=(page-1)*per_page_count
    end=start+per_page_count
    # 查询数据库
    query_obj=PapersModel.query.order_by(PapersModel.create_time.desc())
    total_count=query_obj.count()
    papers=query_obj.slice(start,end)
    papers_list=[]
    for paper in papers:
        papers_dict={
            "papers_id":paper.id,
            "title":paper.title,
            "image_url":paper.image_url,
            "content":paper.content,
            "author":paper.author,
            "create_time":datetime.strftime(paper.create_time, "%Y-%m-%d %H:%M:%S"),  # 将时间格式化
        }
        papers_list.append(papers_dict)
    return restful.ok(data={"papers_list":papers_list,"total_count":total_count,"page":page})

# 删除论文
@cmsapi.route('/papers/delete',methods=['POST','GET'])
def delete_papers():
    paper_id=request.form.get('id')
    try:
        paper=PapersModel.query.get(paper_id)
    except Exception as e:
        return restful.params_error(message='论文不存在！')    
    db.session.delete(paper)
    db.session.commit()
    return restful.ok()   



