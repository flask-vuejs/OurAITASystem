import { createRouter, createWebHistory } from 'vue-router'
import Home from "@/views/Home.vue"
import Group from "@/views/Group.vue"
import Software from "@/views/Software.vue"
import Model from "@/views/Model.vue"


const router = createRouter({
  history: createWebHistory(import.meta.env.BASE_URL),
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
    }
  ]
})

export default router
