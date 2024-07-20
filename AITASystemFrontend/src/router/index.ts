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
import PostPaper from '@/views/PostPaper.vue'
import DatasetDetail from '@/views/details/DatasetDetail.vue'


// 详情页
import GroupDetail from '@/views/details/GroupDetail.vue'
import PaperDetail from '@/views/details/PaperDetail.vue'
import HxxmDetail from '@/views/details/HxxmDetail.vue'
import ZxxmDetail from '@/views/details/ZxxmDetail.vue'

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
      path: "/groupdetail",
      name: "groupdetail",
      component: GroupDetail,
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
      path: "/dataset_detail",
      name: "dataset_detail",
      component: DatasetDetail,
    },
    {
      path: "/hxxm",
      name: "hengxiang",
      component: Hxxm,
    },
    {
      path: "/hxxm_detail",
      name: "hxxm_detail",
      component: HxxmDetail,
    },
    {
      path: "/zxxm",
      name: "zongxiang",
      component: Zxxm,
    },
    {
      path: "/zxxm_detail",
      name: "zxxm_detail",
      component: ZxxmDetail,
    },
    {
      path: "/papers",
      name: "papers",
      component: Papers,
    },
    {
      path: "/paper_detail",
      name: "paper_detail",
      component: PaperDetail,
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
