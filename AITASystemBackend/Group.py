from flask import Flask, request, jsonify
from flask import Blueprint
from models import Group
from exts import db
group=Blueprint('group',__name__)   #创建蓝图

@group.route('/datasets/query/group/')
def query_group():  # 示例：从 Group 表中查询数据
    param_type=request.args.get('group_type')
    if param_type:
        query=Group.query.filter_by(group_type=param_type).all()
    else:
        query = Group.query.all()
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
        return jsonify(group_list)
    else:
        response = {"message": "No group member found in the database."}
        return jsonify(response), 404

@group.route('/datasets/add_data/group/')
def add_fake_data_group():  # 示例：添加虚拟数据到 Group 表中
    group_person = Group(
        type="petroleumsoftware",
        role="teacher",
        person_name="石油工业软件老师2",
        person_description="三进团队成员",
        person_image_url="https://images.pexels.com/photos/11278221/pexels-photo-11278221.jpeg?auto=compress&cs=tinysrgb&w=800&lazy=load",
        person_content="老师",
        person_papers="无"
    )
    db.session.add(group_person)
    db.session.commit()
    return "添加group数据库示例成功"



# cloudcomputing
# bioinformatic
# petroleumsoftware