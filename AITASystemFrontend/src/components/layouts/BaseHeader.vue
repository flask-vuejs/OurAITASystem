<template>
  <div class="header">
    <el-menu class="main-menu" mode="horizontal" :default-active="router.currentRoute.value.fullPath" :ellipsis="false" :router="true">
      <a href="/">
        <img class="main-menu-logo" src="/logo.png">
      </a>
      <div class="flex-grow"/>
      <el-menu-item index="/home">首页</el-menu-item>
      <el-sub-menu index="/group">
        <template #title>团队风采</template>
        <el-menu-item index="/group?type=cloudcomputing">云计算</el-menu-item>
        <el-menu-item index="/group?type=bioinformatic">生物信息学</el-menu-item>
        <!-- <el-menu-item index="/group/petroleumsoftware">石油工业软件</el-menu-item> -->
        <el-menu-item index="/group?type=petroleumsoftware">石油工业软件</el-menu-item>
      </el-sub-menu>
      <el-sub-menu index="/software">
        <template #title>软件平台</template>
        <el-menu-item index="/software?type=medicalimage">医学图像</el-menu-item>
        <el-menu-item index="/software?type=multiomicsanalysis">多组学分析</el-menu-item>
        <el-menu-item index="/software?type=correlationprediction">关联预测</el-menu-item>
      </el-sub-menu>
      <el-sub-menu index="/datasets">
        <template #title>数据集</template>
        <el-menu-item index="/datasets?type=medicalimage">医学图像</el-menu-item>
        <el-menu-item index="/datasets?type=multiomicsanalysis">多组学分析</el-menu-item>
        <el-menu-item index="/datasets?type=correlationprediction">关联预测</el-menu-item>
      </el-sub-menu>
      <el-sub-menu index="/project">
        <template #title>项目</template>
        <el-menu-item index="/hxxm">横向项目</el-menu-item>
        <el-menu-item index="/zxxm">纵向项目</el-menu-item>
      </el-sub-menu>
      <!-- <el-menu-item index="/papers">发表论文</el-menu-item> -->
      <el-menu-item index="/papers">论文展示</el-menu-item>
      <el-menu-item index="/news">新闻动态</el-menu-item>
      <el-menu-item index="/contact">联系我们</el-menu-item>
      <!-- <el-menu-item index="/login">登录</el-menu-item> -->
    </el-menu>
  </div>
  
  
</template>

<script setup lang="ts" name="">
  import { ref, reactive, toRefs, onBeforeMount, onMounted, watchEffect, computed } from 'vue';
  import {useRoute, useRouter} from "vue-router"
  let router = useRouter()

</script>
<style scoped>
.flex-grow {
  flex-grow: 1;
}
.header {
  height: 100%
}
.main-menu {
  height: 100%;
}
.main-menu-logo {
  height: 100%;
  margin: auto;
}
</style>