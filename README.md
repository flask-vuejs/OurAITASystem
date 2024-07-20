# AITASystem
##前台：
>AITASystemFrontend -- 前端网页
>AITASystemBackend -- 后端服务
##后台：
>其中 AITASystemBackend/cmsbackend 是后台管理系统的后端
>后台管理系统的前端地址：https://github.com/flask-vuejs/ouraitasystem-cms
---
##前台需要的安装包
>前端css用到了bootstrap4：
>npm install bootstrap
>npm i bootstrap-icons
---
>用于markdown转html的渲染插件：markdown-it,不过需要先切换npm源：
>npm config set registry https://registry.npmmirror.com
>npm install markdown-it --save
>npm install --save @types/markdown-it
---
>其他必须的安装
>npm install vue-router@4 --save
>npm install element-plus@2.2.19 --save
>npm install axios@1.2.1 --save
>npm install vuex@4.0.2 --save
>npm install pinia@2.0.27 --save
>npm install vue3-seamless-scroll
>npm install vant@4.0.0 --save
>npm install ant-design-vue@3.2.14 --save
---
##后台需要的安装包：
>npm install --save querystring
>npm install vue-router@4 --save
>npm install element-plus@2.2.19 --save
>npm install axios@1.2.1 --save
>需要的编辑器插件：
>npm install easymde --save
>我还尝试安装了wangeditor（如下）,但是效果不好，前端html渲染时会无效（不知道为什么）：
>npm install wangeditor --save
>npm install @wangeditor/editor-for-vue
