<template>
  <div class="news">{{ "新闻动态" }}</div>
  <ul v-if="newsList.length > 0">
     <li v-for="news in newsList" :key="news.news_id">
         <h3>{{ news.news_title }}</h3>
         <p>{{ news.news_content }}</p>
         <!-- 添加更多需要展示的新闻属性... -->
      </li>
    </ul>
    <p v-else class="no-news-message">暂无新闻数据</p>
</template>

<script setup lang="ts" name="">
import { ref, reactive, toRefs, onBeforeMount, onMounted, watchEffect, computed } from 'vue';
import { useRoute, useRouter } from 'vue-router';
import axios from 'axios';
interface News {
       news_id: number;
       news_title: string;
       news_content: string;
       news_date: string;
       news_author: string;
       news_link: string;
       news_read_count: number;
       news_image_url: string;
       label_id: number;
     }
     let newsList = ref<News[]>([]);
onMounted(() => {
       // 发起 Axios 请求获取新闻数据
       axios.get('http://127.0.0.1:5000/all_news')
         .then((response) => {
           if (response.data) {
             newsList.value = response.data;  // 将获取到的新闻数据赋值给 newsList
           } else {
             console.error('Failed to fetch news data.');
           }
         })
         .catch((error) => {
           console.error('An error occurred while fetching news:', error);
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