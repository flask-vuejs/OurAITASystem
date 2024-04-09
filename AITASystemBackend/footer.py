from flask import Blueprint
from flask import render_template
footer=Blueprint('footer',__name__)

@footer.route("/about")
def about():
    #return render_template("about.html", some_data=...)
    return render_template("https://www.upc.edu.cn/");

@footer.route("/terms")
def terms_of_service():
    # 返回条款页面内容或数据
    return render_template("https://www.upc.edu.cn/");

@footer.route("/privacy")
def privacy_policy():
    # 返回隐私政策页面内容或数据
    return render_template("https://www.upc.edu.cn/");

# https://madmalls.com/blog/post/post-curd-and-markdown/#3-curd