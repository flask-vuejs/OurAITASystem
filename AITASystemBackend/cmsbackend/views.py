from flask import Blueprint,send_from_directory,request,jsonify
from .forms import ImageForm,AddPapersForm,EditBannerForm
import os 
import restful
from datetime import datetime
from config import BASE_DIR
from models import PapersModel,BannerModel
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

# 使用flask.send_from_directory函数来提供静态文件服务，或者在你的应用中配置静态文件路由
# @cmsapi.route('/media/<path:path>')
# def serve_media(path):
#     return send_from_directory('aitasystembackend/media', path)



# 轮播图添加
@cmsapi.route('/banner/add',methods=['POST','GET'])
def add_banner():
    form=AddPapersForm(request.form)
    if form.validate():
        name=form.name.data
        image_url=form.image_url.data
        link_url=form.link_url.data
        # 存入数据库
        banner=BannerModel(name=name,image_url=image_url,link_url=link_url)
        db.session.add(banner)
        db.session.commit()
        banner_dict={
            "name":name,
            "image_url":image_url,
            "link_url":link_url,
        }
        return restful.ok(data=banner_dict)
    else:
        message=form.messages[0]
        return restful.params_error(message=message)
# 轮播图列表
@cmsapi.route('/banner/list')      
def banner_list():  
    banners=BannerModel.query.order_by(BannerModel.create_time.desc()).all()
    banner_list=[]
    for banner in banners:
        banner_dict={
            "banner_id":banner.id,
            "name":banner.name,
            "image_url":banner.image_url,
            "link_url":banner.link_url,
            "create_time":banner.create_time.strftime("%Y-%m-%d %H:%M:%S"),
        }
        banner_list.append(banner_dict)
    return restful.ok(data=banner_list)
# 轮播图删除
@cmsapi.route('/banner/delete',methods=['POST','GET'])
def delete_banner():
    banner_id=request.form.get('banner_id')
    if not banner_id:
        return restful.params_error(message="没有传入banner_id！")
    try:
        banner=BannerModel.query.get(banner_id)
    except Exception as e:
        return restful.params_error(message="此轮播图不存在！")
    db.session.delete(banner)
    db.session.commit()
    return restful.ok()
# 轮播图编辑
@cmsapi.route('/banner/edit',methods=['POST','GET'])
def edit_banner():
    form=EditBannerForm(request.form)
    if form.validate():
        # 通过banner_id获取需要修改的轮播图
        banner_id=form.banner_id.data
        try:
            banner=BannerModel.query.get(banner_id)
        except Exception as e:
            return restful.params_error(message="此轮播图不存在！")
        name=form.name.data
        image_url=form.image_url.data
        link_url=form.link_url.data
        # 修改数据
        banner.name=name
        banner.image_url=image_url
        banner.link_url=link_url
        db.session.commit()
        # 返回数据
        banner_dict={
            "banner_id":banner.id,
            "name":banner.name,
            "image_url":banner.image_url,
            "link_url":banner.link_url,
            "create_time":banner.create_time.strftime("%Y-%m-%d %H:%M:%S"),
        }
        return restful.ok(data=banner_dict)
    else:
        return restful.params_error(message=form.messages[0])

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



