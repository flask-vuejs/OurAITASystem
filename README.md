# AITASystem<br/>
##前台：<br/>
>AITASystemFrontend -- 前端网页<br/>
运行命令:npm run dev<br/>
>AITASystemBackend -- 后端服务<br/>
运行命令：set flask_app=app.py&&flask run --debug<br/>
##后台：<br/>
>其中 AITASystemBackend/cmsbackend 是后台管理系统的后端<br/>
>后台管理系统的前端地址：https://github.com/flask-vuejs/ouraitasystem-cms<br/>
>运行命令：npm run serve <br/>
---<br/>
##前台前端vue3需要的安装包<br/>
>前端css用到了bootstrap4：<br/>
>npm install bootstrap<br/>
>npm i bootstrap-icons<br/>
---<br/>
>用于markdown转html的渲染插件：markdown-it,不过需要先切换npm源：<br/>
>npm config set registry https://registry.npmmirror.com<br/>
>npm install markdown-it --save<br/>
>npm install --save @types/markdown-it<br/>
---<br/>
>其他必须的安装<br/>
>npm install vue-router@4 --save<br/>
>npm install element-plus@2.2.19 --save<br/>
>npm install axios@1.2.1 --save<br/>
>npm install vuex@4.0.2 --save<br/>
>npm install pinia@2.0.27 --save<br/>
>npm install vue3-seamless-scroll<br/>
>npm install vant@4.0.0 --save<br/>
>npm install ant-design-vue@3.2.14 --save<br/>
---<br/>
##后台前端vue3需要的安装包：<br/>
>npm install --save querystring<br/>
>npm install vue-router@4 --save<br/>
>npm install element-plus@2.2.19 --save<br/>
>npm install axios@1.2.1 --save<br/>
>需要的编辑器插件：<br/>
>npm install easymde --save<br/>
>我还尝试安装了wangeditor（如下）,但是效果不好，前端html渲染时会无效（不知道为什么）：<br/>
>npm install wangeditor --save<br/>
>npm install @wangeditor/editor-for-vue<br/>
