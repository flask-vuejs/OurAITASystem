from flask import Flask, request, jsonify
from flask import Blueprint
from AIdata import *

datasets=Blueprint('datasets',__name__)   #创建蓝图


#从data表查数据
@datasets.route('/datasets')
def get_all_datasets():
    print("111")
    # 获取查询参数
    type_param = request.args.get('type')
    # 打印参数
    print("查询参数 type_param:", type_param)
    # 如果没有传递 type 参数，则默认查询所有数据
    if not type_param:
        datas = Data.query.all()
    else:
        # 根据 type 参数来过滤数据
        datas = Data.query.filter_by(data_type=type_param).all()

    data_list = []
    for data in datas:
        data_dict = {
            "data_id": data.data_id,
            "data_title": data.data_title,
            "data_content": data.data_content,
            "data_date": data.data_date,
            "data_author": data.data_author,
            "data_link": data.data_link,
            "data_read_count": data.data_read_count,
            "data_image_url": data.data_image_url,
        }
        data_list.append(data_dict)

    if data_list:
        return jsonify(data_list)
    else:
        response = {"message": "No data records found in the database."}
        return jsonify(response), 404