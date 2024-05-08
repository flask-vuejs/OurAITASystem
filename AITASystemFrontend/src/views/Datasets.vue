<template>
  <div class="data">{{ "数据集" }}</div>
  <ul v-if="dataList.length > 0">
     <li v-for="data in dataList" :key="data.data_id">
         <h3>{{ data.data_title }}</h3>
         <p>{{ data.data_content }}</p>
         <!-- 添加更多需要展示的属性... -->
      </li>
    </ul>
    <p v-else class="no-data-message">暂无数据集数据</p>
</template>

<script setup lang="ts" name="Datasets">
import { ref, reactive, toRefs, onBeforeMount, onMounted, watchEffect, computed } from 'vue';
import { useRoute, useRouter } from 'vue-router';
import axios from 'axios';
interface data {
       data_id: number;
       data_title: string;
       data_content: string;
       data_date: string;
       data_author: string;
       data_link: string;
       data_read_count: number;
       data_image_url: string;
       label_id: number;
     }
     let dataList = ref<data[]>([]);
     
const route1 = useRoute();
const typeParam = route1.query.type as string; // 使用 as string 可以指定参数类型为字符串，避免类型推断问题
// 然后可以在组件中使用 typeParam，比如在模板中显示
console.log('Type 参数值:', typeParam);

onMounted(() => {
       // 发起 Axios 请求获取新闻数据
       axios.get('http://127.0.0.1:5000/datasets', {
  params: {
    type: typeParam
  }
})
         .then((response) => {
           if (response.data) {
             dataList.value = response.data;  // 将获取到的数据赋值给 dataList
           } else {
             console.error('Failed to fetch data data.');
           }
         })
         .catch((error) => {
           console.error('An error occurred while fetching data:', error);
         });
     });
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

</style>