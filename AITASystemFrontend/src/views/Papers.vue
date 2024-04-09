<template>
  <div class="papers">{{ "论文界面" }}</div>
  <el-menu
    :default-active="activeIndex"
    class="el-menu-demo"
    mode="horizontal"
  >
  <el-menu-item index="1">首页</el-menu-item>

  <el-sub-menu index="2">
    <template #title>我的</template>
     <el-menu-item index="2-1">计划1</el-menu-item>
     <el-menu-item index="2-2">计划2</el-menu-item>
     <el-menu-item index="2-3">计划3</el-menu-item>
  <el-sub-menu index="2-4">
    <template #title>计划4</template>
    <el-menu-item index="2-4-1">任务1</el-menu-item>
     <el-menu-item index="2-4-2">任务2</el-menu-item>
     <el-menu-item index="2-4-3">任务3</el-menu-item>
  </el-sub-menu>
  </el-sub-menu>
  <el-menu-item index="3" disabled>信息</el-menu-item>
  <el-menu-item index="4">联系</el-menu-item>
  </el-menu>
</template>

<script setup lang="ts" name="">
import { ref, reactive, toRefs, onBeforeMount, onMounted, watchEffect, computed } from 'vue';
import { useRoute, useRouter } from 'vue-router';
const activeIndex=ref('1')
/**
* 路由对象
*/
const route = useRoute();
/**
* 路由实例
*/
const router = useRouter();
//console.log('1-开始创建组件-setup')
/**
* 数据部分
*/
const data = reactive({})
onBeforeMount(() => {
  //console.log('2.组件挂载页面之前执行----onBeforeMount')
})
onMounted(() => {
  //console.log('3.-组件挂载到页面之后执行-------onMounted')
})
watchEffect(()=>{
})
// 使用toRefs解构
// let { } = { ...toRefs(data) } 
defineExpose({
  ...toRefs(data)
})

</script>
<style scoped lang='less'>
.el-menu-vertical-demo{
  width:200px;
}
</style>

