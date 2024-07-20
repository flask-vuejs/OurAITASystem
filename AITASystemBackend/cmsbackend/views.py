from flask import Blueprint,send_from_directory,request,jsonify
from .forms import ImageForm,AddPapersForm,EditBannerForm
import os 
import restful
from datetime import datetime
from config import BASE_DIR
from models import *
from exts import db


cmsapi=Blueprint('cmpapi',__name__,url_prefix="/cmsapi")
# @cmsapi.route('/papers/img/upload',methods=['POST','GET'])
# def upload_image():
#     form=ImageForm(request.files)
#     if form.validate():
#         image=form.image.data
#         filename=image.filename
#         image_path=os.path.join(BASE_DIR,"media","papers",filename)
#         image.save(image_path)
#         return restful.ok(data={"image_url":filename})
#     else:
#         message=form.messages[0]
#         return restful.params_error(message=message)


@cmsapi.route('/papers/img/upload',methods=['POST','GET'])
def paper_image():
    image=request.files['image']
    if image:
        image.save(os.path.join(BASE_DIR,"media","papers",image.filename))
    return restful.ok(data={"image_url":"/media/papers/"+image.filename})

@cmsapi.route('/datasets/img/upload',methods=['POST','GET'])
def dataset_image():
    image=request.files['image']
    if image:
        image.save(os.path.join(BASE_DIR,"media","datasets",image.filename))
    return restful.ok(data={"image_url":"/media/datasets/"+image.filename})

@cmsapi.route('/news/img/upload',methods=['POST','GET'])
def news_image():
    image=request.files['image']
    if image:
        image.save(os.path.join(BASE_DIR,"media","news",image.filename))
    return restful.ok(data={"image_url":"/media/news/"+image.filename})

@cmsapi.route('/group/img/upload',methods=['POST','GET'])
def group_image():
    image=request.files['image']
    if image:
        image.save(os.path.join(BASE_DIR,"media","group",image.filename))
    return restful.ok(data={"image_url":"/media/group/"+image.filename})

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

# 论文表单
@cmsapi.route('/papers/form')
def get_paper_form():
    id=request.args.get('paper_id')
    if id:
        query=PapersModel.query.get(id)
        data={
            "id":query.id,
            "title":query.title,
            "author":query.author,
            "abstract":query.abstract,
            "keywords":query.keywords,
            "content":query.content,
            "image_url":query.image_url,
            "create_time":query.create_time.strftime("%Y-%m-%d %H:%M:%S"),
        }
        return restful.ok(data=data)

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
            "create_time":datetime.strftime(paper.create_time, "%Y-%m-%d %H:%M:%S"),
            'abstract':paper.abstract,
            'keywords':paper.keywords
        }
        papers_list.append(papers_dict)
    return restful.ok(data={"papers_list":papers_list,"total_count":total_count,"page":page})

# 添加论文
@cmsapi.route('/papers/add',methods=['POST','GET'])
def add_papers():
    form=request.form
    title=form['title']
    author=form['author']
    abstract=form['abstract']
    keywords=form['keywords']
    content=form['content']
    image_url=form['image_url']
    create_time=datetime.now()
    if not title:
        return restful.params_error(message="标题不能为空！")
    paper=PapersModel(title=title,author=author,abstract=abstract,keywords=keywords,content=content,image_url=image_url,create_time=create_time)
    db.session.add(paper)
    db.session.commit()
    paper_dict={
        "papers_id":paper.id,
        'title':paper.title,
        'author':paper.author,
        'abstract':paper.abstract,
        'keywords':paper.keywords,
        'content':paper.content,
        'image_url':paper.image_url,
        'create_time':paper.create_time.strftime("%Y-%m-%d %H:%M:%S")
    }
    return restful.ok(data=paper_dict)

#修改论文
@cmsapi.route('/papers/edit',methods=['POST','GET'])
def edit_papers():
    form=request.form
    id=form['papers_id']
    if not id:
        return restful.params_error(message="没有传入id！")
    try:
        paper=PapersModel.query.get(id)
    except Exception as e:
        return restful.params_error(message="论文不存在！")
    paper.title=form['title']
    paper.author=form['author']
    paper.abstract=form['abstract']
    paper.keywords=form['keywords']
    paper.content=form['content']
    paper.image_url=form['image_url']
    db.session.commit()
    paper_dict={
        "papers_id":paper.id,
        'title':paper.title,
        'author':paper.author,
        'abstract':paper.abstract,
        'keywords':paper.keywords,
        'content':paper.content,
        'image_url':paper.image_url,
        'create_time':paper.create_time.strftime("%Y-%m-%d %H:%M:%S"),
    }
    return restful.ok(data=paper_dict)

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



# 团队列表
@cmsapi.route('/group/list')
def get_group_list():
    # group_type=request.args.get('group_type')
    # if group_type:
    #     query=Group.query.filter_by(group_type=group_type).all()
    # else:
    query=Group.query.all()
    group_list=[]
    for i in query:
        group_dict={
            "group_id":i.group_id,
            "group_type":i.group_type,
            "group_role":i.group_role,
            "group_person_name":i.group_person_name,
            "group_person_description":i.group_person_description,
            "group_person_image_url":i.group_person_image_url,
            "group_person_content":i.group_person_content,
            "group_person_papers":i.group_person_papers,
        }
        group_list.append(group_dict)
    if group_list:
        return restful.ok(data=group_list)
# 添加团队成员
@cmsapi.route('/group/add',methods=['POST','GET'])
def add_group():
    form=request.form
    # print(form)
    # return restful.ok()
    group_type=form['group_type']
    group_role=form['group_role']
    group_person_name=form['group_person_name']
    group_person_description=form['group_person_description']
    group_person_image_url=form['group_person_image_url']
    group_person_content=form['group_person_content']
    group=Group(group_type=group_type,group_role=group_role,group_person_name=group_person_name,group_person_description=group_person_description,group_person_image_url=group_person_image_url,group_person_content=group_person_content)
    db.session.add(group)
    db.session.commit()
    group_dict={
            "group_id":group.group_id,
            "group_type":group.group_type,
            "group_role":group.group_role,
            "group_person_name":group.group_person_name,
            "group_person_description":group.group_person_description,
            "group_person_image_url":group.group_person_image_url,
            "group_person_content":group.group_person_content,
            "group_person_papers":group.group_person_papers,
    }
    return restful.ok(data=group_dict)

# 编辑团队成员
@cmsapi.route('/group/edit',methods=['POST','GET'])
def edit_group():
    form=request.form
    group_id=form['group_id']
    if not group_id:
        return restful.params_error(message='没有传入group_id！')
    try:
        group=Group.query.get(group_id)
    except Exception as e:
        return restful.params_error(message='团队成员不存在！')    
    group.group_type=form['group_type']
    group.group_role=form['group_role']
    group.group_person_name=form['group_person_name']
    group.group_person_description=form['group_person_description']
    group.group_person_image_url=form['group_person_image_url']
    group.group_person_content=form['group_person_content']
    db.session.commit()
    group_dict={
        "group_id":group.group_id,
        "group_type":group.group_type,
        "group_role":group.group_role,
        "group_person_name":group.group_person_name,
        "group_person_description":group.group_person_description,
        "group_person_image_url":group.group_person_image_url,
        "group_person_content":group.group_person_content,
        "group_person_papers":group.group_person_papers
    }
    return restful.ok(data=group_dict)

# 删除团队成员
@cmsapi.route('/group/delete',methods=['POST','GET'])
def delete_group():
    group_id=request.form.get('id')
    #print(group_id)
    try:
        group=Group.query.get(group_id)
    except Exception as e:
        return restful.params_error(message='团队成员不存在！')    
    db.session.delete(group)
    db.session.commit()
    return restful.ok()


# 新闻列表
@cmsapi.route('/news/list')
def get_news_list():
    datas = News.query.all()
    news_list=[]
    for data in datas:
        news_dict = {
            "news_id":data.news_id,
            "news_title":data.news_title,
            "news_content":data.news_content,
            "news_date":data.news_date.strftime('%Y-%m-%d %H:%M:%S'),
            "news_author":data.news_author,
            "news_link":data.news_link,
            "news_read_count":data.news_read_count,
            "news_image_url":data.news_image_url,
            "label_id":data.label_id,
        }
        news_list.append(news_dict)
    if news_list:
        return restful.ok(data=news_list)
# 编辑新闻
@cmsapi.route('/news/edit',methods=['POST','GET'])
def edit_news():
    form=request.form
    news_id=form['news_id']
    if not news_id:
        return restful.params_error(message='没有传入news_id！')
    try:
        news=News.query.get(news_id)
    except Exception as e:
        return restful.params_error(message='新闻不存在！')    
    news.news_title=form['news_title']
    news.news_content=form['news_content']
    news.news_author=form['news_author']
    news.news_link=form['news_link']
    news.news_image_url=form['news_image_url']
    news.label_id=form['label_id']
    db.session.commit()
    news_dict={
            "news_id":news.news_id,
            "news_title":news.news_title,
            "news_content":news.news_content,
            "news_date":news.news_date.strftime('%Y-%m-%d %H:%M:%S'),
            "news_author":news.news_author,
            "news_link":news.news_link,
            "news_read_count":news.news_read_count,
            "news_image_url":news.news_image_url,
            "label_id":news.label_id
    }
    return restful.ok(data=news_dict)


# 添加新闻
@cmsapi.route('/news/add',methods=['POST','GET'])
def add_news():
    form=request.form
    # print(form)
    #news_id=form['news_id']
    news_content=form['news_content']
    news_title=form['news_title']
    # 使用 datetime.now() 获取当前时间
    news_date = datetime.now()
    # 如果需要将日期时间格式化为字符串，可以使用 strftime 方法
    # news_date_str = news_date.strftime('%Y-%m-%d %H:%M:%S')
    news_read_count=0
    news_author=form['news_author']
    news_link=form['news_link']
    news_image_url=form['news_image_url']
    label_id=form['label_id']
    if not news_title:
       return restful.params_error(message="新闻标题不能为空！")
    # 存入数据库
    news=News(news_title=news_title,news_content=news_content,news_author=news_author,news_date=news_date,news_link=news_link,news_image_url=news_image_url,news_read_count=news_read_count,label_id=label_id)
    db.session.add(news)
    db.session.commit()
    news_dict={
        "news_id":news.news_id,
        "news_content":news.news_content,
        "news_title":news.news_title,
        "news_date":news.news_date.strftime('%Y-%m-%d %H:%M:%S'),
        "news_author":news.news_author,
        "news_link":news.news_link,
        "news_image_url":news.news_image_url,
        "news_read_count":news.news_read_count,
        "label_id":news.label_id,
    }
    return restful.ok(data=news_dict)


# 删除新闻
@cmsapi.route('/news/delete',methods=['POST','GET'])
def delete_news():
    news_id=request.form.get('id')
    # print(news_id)
    if not news_id:
        return restful.params_error(message="没有传入news_id！")
    try:
        news=News.query.get(news_id)
    except Exception as e:
        return restful.params_error(message='新闻不存在！')    
    db.session.delete(news)
    db.session.commit()
    return restful.ok()



# 数据集列表
@cmsapi.route('/datasets/list')
def get_datasets_list():
    datas=Data.query.all()
    if datas:
        data_list = []
        for data in datas:
            data_dict = {
                "data_id": data.data_id,
                "data_title": data.data_title,
                "data_abstract": data.data_abstract,
                "data_content": data.data_content,
                "data_author":data.data_author,
                "data_date": data.data_date.strftime('%Y-%m-%d %H:%M:%S'),
                "data_link": data.data_link,
                "data_read_count": data.data_read_count,
                "data_image_url": data.data_image_url,
                "data_type":data.data_type 
            }
            data_list.append(data_dict)
        if data_list:
            return restful.ok(data=data_list)
# 删除数据集
@cmsapi.route('/datasets/delete',methods=['POST','GET'])
def delete_datasets():
    data_id=request.form.get('id')
    if not data_id:
        return restful.params_error(message="没有传入data_id！")
    try:
        data=Data.query.get(data_id)
    except Exception as e:
        return restful.params_error(message='数据集不存在！')    
    db.session.delete(data)
    db.session.commit()
    return restful.ok()


# 添加数据集
@cmsapi.route('/datasets/add',methods=['POST','GET'])
def add_datasets():
    form=request.form
    data_title=form['data_title']
    data_abstract=form['data_abstract']
    data_content=form['data_content']
    data_author=form['data_author']
    data_date = datetime.now()
    data_link=form['data_link']
    data_read_count=0
    data_image_url=form['data_image_url']
    data_type=form['data_type']
    if not data_title:
       return restful.params_error(message="数据集标题不能为空！")
    dataset=Data(data_title=data_title,data_content=data_content,data_author=data_author,data_date=data_date,data_link=data_link,data_read_count=data_read_count,data_image_url=data_image_url,data_type=data_type)
    db.session.add(dataset)
    db.session.commit()
    data_dict={
        "data_id":dataset.data_id,
        "data_title":dataset.data_title,
        "data_abstract":dataset.data_abstract,
        "data_content":dataset.data_content,
        "data_author":dataset.data_author,
        "data_date":dataset.data_date.strftime('%Y-%m-%d %H:%M:%S'),
        "data_link":dataset.data_link,
       "data_read_count":dataset.data_read_count,
        "data_image_url":dataset.data_image_url,
        "data_type":dataset.data_type 
    }
    return restful.ok(data=data_dict)


# 编辑数据集
@cmsapi.route('/datasets/edit',methods=['POST','GET'])
def edit_datasets():
    form=request.form
    data_id=form['data_id']
    if not data_id:
        return restful.params_error(message="没有传入data_id！")
    try:
        dataset=Data.query.get(data_id)
    except Exception as e:
        return restful.params_error(message='数据集不存在！') 
    dataset.data_title=form['data_title']
    dataset.data_abstract=form['data_abstract']
    dataset.data_content=form['data_content']
    dataset.data_author=form['data_author']
    dataset.data_link=form['data_link']
    dataset.data_image_url=form['data_image_url']
    dataset.data_type=form['data_type']
    db.session.commit()
    data_dict={
        "data_id":dataset.data_id,
        "data_title":dataset.data_title,
        "data_abstract":dataset.data_abstract,
        "data_content":dataset.data_content,
        "data_author":dataset.data_author,
        "data_date":dataset.data_date.strftime('%Y-%m-%d %H:%M:%S'),
        "data_link":dataset.data_link,
        "data_read_count":dataset.data_read_count,
        "data_image_url":dataset.data_image_url,
        "data_type":dataset.data_type 
    }
    return restful.ok(data=data_dict)


# 获取横向项目列表
@cmsapi.route('/hxxm/list')
def hxxm_list():
    query=Hxxm.query.all()
    h_list=[]
    for i in query:
        h_dict={
            'id':i.id,
            'name':i.name,
            'description':i.description,
            'client':i.client,
            'start_date':i.start_date.strftime('%Y-%m-%d'),
            'end_date':i.end_date.strftime('%Y-%m-%d'),
            'project_manager':i.project_manager,
            'budget':i.budget,
        }
        h_list.append(h_dict)
    if h_list:
        return restful.ok(data=h_list)
    else:
        return restful.params_error(message='没有数据')

# 添加横向项目
@cmsapi.route('/hxxm/add',methods=['POST','GET'])
def add_hxxm():
    form=request.form
    name=form['name']
    description=form['description']
    client=form['client']
    start_date=form['start_date']
    end_date=form['end_date']
    start_date = datetime.fromisoformat(start_date.replace('T', ' ').replace('Z', ''))  # 转换 start_date
    end_date = datetime.fromisoformat(end_date.replace('T', ' ').replace('Z', ''))      # 转换 end_date
    project_manager=form['project_manager']
    budget=form['budget']
    if not name:
        return restful.params_error(message='项目名称不能为空！')
    hxxm=Hxxm(name=name,description=description,client=client,start_date=start_date,end_date=end_date,project_manager=project_manager,budget=budget)
    db.session.add(hxxm)
    db.session.commit()
    hxxm_dict={
        'id':hxxm.id,
        'name':hxxm.name,
        'description':hxxm.description,
        'client':hxxm.client,
        'start_date':hxxm.start_date.strftime('%Y-%m-%d'),
        'end_date':hxxm.end_date.strftime('%Y-%m-%d'),
        'project_manager':hxxm.project_manager,
        'budget':hxxm.budget,
    }
    return restful.ok(data=hxxm_dict)

# 编辑横向项目
@cmsapi.route('/hxxm/edit',methods=['POST','GET'])
def edit_hxxm():
    form=request.form
    id=form['id']
    if not id:
        return restful.params_error(message='没有传入id！')
    try:
        hxxm=Hxxm.query.get(id)
    except Exception as e:
        return restful.params_error(message='横向项目不存在！')
    hxxm.name=form['name']
    hxxm.description=form['description']
    hxxm.client=form['client']
    start_date=form['start_date']
    end_date=form['end_date']
    hxxm.start_date = datetime.fromisoformat(start_date.replace('T', ' ').replace('Z', ''))  # 转换 start_date
    hxxm.end_date = datetime.fromisoformat(end_date.replace('T', ' ').replace('Z', ''))      # 转换 end_date
    hxxm.project_manager=form['project_manager']
    hxxm.budget=form['budget']
    db.session.commit()
    hxxm_dict={
        'id':hxxm.id,
        'name':hxxm.name,
        'description':hxxm.description,
        'client':hxxm.client,
        'start_date':hxxm.start_date.strftime('%Y-%m-%d'),
        'end_date':hxxm.end_date.strftime('%Y-%m-%d'),
        'project_manager':hxxm.project_manager,
        'budget':hxxm.budget,
    }
    return restful.ok(data=hxxm_dict)

#删除横向项目
@cmsapi.route('/hxxm/delete',methods=['POST','GET'])
def delete_hxxm():
    id=request.form['id']
    if not id:
        return restful.params_error(message='没有传入id！')
    try:
        hxxm=Hxxm.query.get(id)
    except Exception as e:
        return restful.params_error(message='横向项目不存在！')
    db.session.delete(hxxm)
    db.session.commit()
    return restful.ok()

# 纵向项目列表
@cmsapi.route('/zxxm/list')
def zxxm_list():
    query=Zxxm.query.all()
    z_list=[]
    for i in query:
        z_dict={
            'id':i.id,
            'name':i.name,
            'description':i.description,
            'funding_agency':i.funding_agency,
            'start_date':i.start_date.strftime('%Y-%m-%d'),
            'end_date':i.end_date.strftime('%Y-%m-%d'),
            'principal_investigator':i.principal_investigator,
            'budget':i.budget,
            'status':i.status
        }
        z_list.append(z_dict)
    if z_list:
        return restful.ok(data=z_list)
    else:
        return restful.params_error(message='没有数据')


# 添加纵向项目
@cmsapi.route('/zxxm/add',methods=['POST','GET'])
def add_zxxm():
    form=request.form
    name=form['name']
    description=form['description']
    funding_agency=form['funding_agency']
    start_date=form['start_date']
    end_date=form['end_date']
    start_date = datetime.fromisoformat(start_date.replace('T', ' ').replace('Z', ''))  # 转换 start_date
    end_date = datetime.fromisoformat(end_date.replace('T', ' ').replace('Z', ''))      # 转换 end_date
    principal_investigator=form['principal_investigator']
    budget=form['budget']
    status=form['status']
    if not name:
        return restful.params_error(message='项目名称不能为空！')
    zxxm=Zxxm(name=name,description=description,funding_agency=funding_agency,start_date=start_date,end_date=end_date,principal_investigator=principal_investigator,budget=budget,status=status)
    db.session.add(zxxm)
    db.session.commit()
    zxxm_dict={
        'id':zxxm.id,
        'name':zxxm.name,
        'description':zxxm.description,
        'funding_agency':zxxm.funding_agency,
        'start_date':zxxm.start_date.strftime('%Y-%m-%d'),
        'end_date':zxxm.end_date.strftime('%Y-%m-%d'),
        'principal_investigator':zxxm.principal_investigator,
        'budget':zxxm.budget,
        'status':zxxm.status
    }
    return restful.ok(data=zxxm_dict)

# 编辑纵向项目
@cmsapi.route('/zxxm/edit',methods=['POST','GET'])
def edit_zxxm():
    form=request.form
    id=form['id']
    if not id:
        return restful.params_error(message='没有传入id！')
    try:
        zxxm=Zxxm.query.get(id)
    except Exception as e:
        return restful.params_error(message='纵向项目不存在！')
    zxxm.name=form['name']
    zxxm.description=form['description']
    zxxm.funding_agency=form['funding_agency']
    start_date=form['start_date']
    end_date=form['end_date']
    # print('传入的end_date: ', end_date)
    # print('修改前的end_date: ',zxxm.end_date)
    zxxm.start_date = datetime.fromisoformat(start_date.replace('T', ' ').replace('Z', ''))  # 转换 start_date
    zxxm.end_date = datetime.fromisoformat(end_date.replace('T', ' ').replace('Z', ''))      # 转换 end_date
    zxxm.principal_investigator=form['principal_investigator']
    zxxm.budget=form['budget']
    zxxm.status=form['status']
    db.session.commit()
    zxxm_dict={
        'id':zxxm.id,
        'name':zxxm.name,
        'description':zxxm.description,
        'funding_agency':zxxm.funding_agency,
        'start_date':zxxm.start_date.strftime('%Y-%m-%d'),
        'end_date':zxxm.end_date.strftime('%Y-%m-%d'),
        'principal_investigator':zxxm.principal_investigator,
        'budget':zxxm.budget,
        'status':zxxm.status
    }
    #print('修改后的end_date: ',zxxm_dict['end_date'])
    return restful.ok(data=zxxm_dict)


# 删除纵向项目
@cmsapi.route('/zxxm/delete',methods=['POST','GET'])
def delete_zxxm():
    id=request.form['id']
    if not id:
        return restful.params_error(message='没有传入id！')
    try:
        zxxm=Zxxm.query.get(id)
    except Exception as e:
        return restful.params_error(message='纵向项目不存在！')
    db.session.delete(zxxm)
    db.session.commit()
    return restful.ok()