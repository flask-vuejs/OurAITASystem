from flask import Flask, request, jsonify
from flask import Blueprint
from models import Zxxm,Hxxm
import restful
from exts import db
hzxxm = Blueprint('hzxxm', __name__)

# 横向项目列表
@hzxxm.route('/hxxm/list', methods=['GET'])
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

# 横向详情
@hzxxm.route('/hxxm/detail', methods=['GET','POST'])
def hxxm_detail():
    id=request.args.get('id')
    if id:
        query=Hxxm.query.get(id)
        h_dict={
            'id':query.id,
            'name':query.name,
            'description':query.description,
            'client':query.client,
            'start_date':query.start_date.strftime('%Y-%m-%d'),
            'end_date':query.end_date.strftime('%Y-%m-%d'),
            'project_manager':query.project_manager,
            'budget':query.budget,
        }
        if h_dict:
            return restful.ok(data=h_dict)
        else :
            return restful.params_error(message='没有数据')
    else:
        return restful.params_error(message='id不存在')





# 纵向项目列表
@hzxxm.route('/zxxm/list', methods=['GET'])
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


# 纵向详情
@hzxxm.route('/zxxm/detail', methods=['GET','POST'])
def zxxm_detail():
    id=request.args.get('id')
    if id:
        query=Zxxm.query.get(id)
        z_dict={
            'id':query.id,
            'name':query.name,
            'description':query.description,
            'funding_agency':query.funding_agency,
            'start_date':query.start_date.strftime('%Y-%m-%d'),
            'end_date':query.end_date.strftime('%Y-%m-%d'),
            'principal_investigator':query.principal_investigator,
            'budget':query.budget,
            'status':query.status
        }
        if z_dict:
            return restful.ok(data=z_dict)
        else :
            return restful.params_error(message='没有数据')
    else:
        return restful.params_error(message='id不存在')

