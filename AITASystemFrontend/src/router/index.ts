import { createRouter, createWebHashHistory } from 'vue-router'
import Home from "@/views/Home.vue"
import Group from "@/views/Group.vue"
import Software from "@/views/Software.vue"
import Model from "@/views/Model.vue"
import Datasets from "@/views/Datasets.vue"
import Hxxm from '@/views/Hxxm.vue'
import Zxxm from '@/views/Zxxm.vue'
import Papers from '@/views/Papers.vue'
import News from '@/views/News.vue'
import Contact from '@/views/Contact.vue'
import Login from '@/views/Login.vue'
import PostPaper from '@/views/PostPaper.vue'

const router = createRouter({
  history: createWebHashHistory(import.meta.env.BASE_URL),
  routes: [
    {
      path: "/",
      redirect: "/home"
    },
    {
      path: "/home",
      name: 'home',
      component: Home,
    },
    {
      path:"/login",
      name: 'login',
      component:Login,
    },
    {
      path:"/postpaper",
      name: 'postpaper',
      component:PostPaper,
    },
    {
      path: "/group",
      name: "group",
      component: Group,
    },
    {
      path: "/software",
      name: "software",
      component: Software,
    },
    {
      path: "/model",
      name: "model",
      component: Model,
    },
    {
      path: "/datasets",
      name: "datasets",
      component: Datasets,
    },
    {
      path: "/hxxm",
      name: "hengxiang",
      component: Hxxm,
    },
    {
      path: "/zxxm",
      name: "zongxiang",
      component: Zxxm,
    },
    {
      path: "/papers",
      name: "papers",
      component: Papers,
    },
    {
      path: "/news",
      name: "news",
      component: News,
    },
    {
      path: "/contact",
      name: "contace",
      component: Contact,
    }
  ]
})

export default router
