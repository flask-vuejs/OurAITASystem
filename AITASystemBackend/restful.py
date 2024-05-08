from flask import Flask, request, jsonify

class HttpCode(object):
    #响应正常
    ok=200
    #没有登录错误
    unloginerror=401
    #没有权限错误
    permissionerror=403
    #服务器错误
    servererror=500
    #客户端参数错误
    paramserror=400

def _restful_result(code,message,data):
    # 将字典转换为JSON格式的HTTP响应---浏览器接收到的是可读的JSON数据
    # code:api调用的状态码
    # message:api调用的请求结果的描述性信息
    # data:api调用的返回数据
    return jsonify({"code":code,"message":message or "","data":data or {}})

def ok(message=None,data=None):
    return _restful_result(code=HttpCode.ok,message=message,data=data)

def unlogin_error(message="没有登录！"):
    return _restful_result(code=HttpCode.unloginerror,message=message,data=None)

def permission_error(message="没有权限访问！"):
    return _restful_result(code=HttpCode.permissionerror,message=message,data=None)

def params_error(message="参数错误！"):
    return _restful_result(code=HttpCode.paramserror,message=message,data=None)

def server_error(message="服务器开小差啦！"):
    return _restful_result(code=HttpCode.servererror,message=message or "服务器内部错误",data=None)

