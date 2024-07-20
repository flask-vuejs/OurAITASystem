# OurAITASystem(深度学习在线加载平台--开发进行中)使用指南<br/>
## 前台：<br/>
><mark>AITASystemFrontend -- 前端网页</mark><br/>
运行命令:npm run dev<br/>
><mark>AITASystemBackend -- 后端服务</mark><br/>
运行命令：set flask_app=app.py&&flask run --debug<br/>

## 后台：<br/>
><mark>其中 AITASystemBackend/cmsbackend 是后台管理系统的后端</mark><br/>
><mark>后台管理系统的前端地址：https://github.com/flask-vuejs/ouraitasystem-cms</mark><br/>
>运行命令：npm run serve <br/>

---<br/>

## 前台前端vue3需要的安装包<br/>
><mark>前端css用到了bootstrap4：</mark><br/>
>npm install bootstrap<br/>
>npm i bootstrap-icons<br/>
---<br/>
><mark>用于markdown转html的渲染插件：markdown-it,不过需要先切换npm源：</mark><br/>
>npm config set registry https://registry.npmmirror.com<br/>
>npm install markdown-it --save<br/>
>npm install --save @types/markdown-it<br/>
---<br/>
><mark>其他必须的安装</mark><br/>
>npm install vue-router@4 --save<br/>
>npm install element-plus@2.2.19 --save<br/>
>npm install axios@1.2.1 --save<br/>
>npm install vuex@4.0.2 --save<br/>
>npm install pinia@2.0.27 --save<br/>
>npm install vue3-seamless-scroll<br/>
>npm install vant@4.0.0 --save<br/>
>npm install ant-design-vue@3.2.14 --save<br/>

---<br/>

## 后台前端vue3需要的安装包：<br/>
>npm install --save querystring<br/>
>npm install vue-router@4 --save<br/>
>npm install element-plus@2.2.19 --save<br/>
>npm install axios@1.2.1 --save<br/>
><mark>需要的编辑器插件：</mark><br/>
>npm install easymde --save<br/>
><mark>我还尝试安装了wangeditor（如下）,但是效果不好（所以项目中放弃使用），前端html渲染时会无效（不知道为什么）：</mark><br/>
>npm install wangeditor --save<br/>
>npm install @wangeditor/editor-for-vue<br/>

## 注意事项：
><mark>后端由于采用flask框架，所以涉及到---将ORM模型映射到数据库中:</mark><br/>
>1，初始化迁移仓库：flask db init<br/>
>2，将ORM模型生成迁移脚本：flask db migrate<br/>
>3，运行迁移脚本：flask db upgrade<br/>
