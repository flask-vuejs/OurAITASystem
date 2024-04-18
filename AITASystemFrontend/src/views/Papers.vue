<template>
  <div class="papers">
    <h2>{{ "论文界面" }}</h2>
    <!-- <md-editor v-model="text" /> -->
  </div>
  
</template>

<script setup lang="ts" name="">
import { ref, reactive, toRefs, onBeforeMount, onMounted, watchEffect, computed } from 'vue';
import { useRoute, useRouter } from 'vue-router';
import { defineComponent } from 'vue';
import MdEditor from 'md-editor-v3';
import 'md-editor-v3/lib/style.css';
// const text = ref('我是编辑内容');

</script>
<style scoped lang='less'>
.el-menu-vertical-demo{
  width:200px;
}
</style>

<!-- const activeIndex=ref('1')
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
}) -->

