
import { createApp} from 'vue'
import { createPinia } from 'pinia'
////整体导入 Elementplus 组件库
import ElementPlus from 'element-plus'  //导入 ElementPlus 组件库的所有模块和功能
import 'element-plus/dist/index.css'   //导入 Elementplus 组件库所需的全局 CSS 样式
import * as ElementPlusIconsVue from '@element-plus/icons-vue' //导入 Elementplus 组件库中的所有图标

import App from './App.vue'
import router from './router'
// import http from '@/utils/http'

const app = createApp(App)
app.use(createPinia())
app.use(router)
app.use(ElementPlus)
for (const [key, component] of Object.entries(ElementPlusIconsVue)) {
    app.component(key, component)
}   // 注册 Elementplus 组件库中的所有图标到全局 vue 应用中


app.mount('#app')
