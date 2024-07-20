<template>
  <div class="main-page">
    <NoticeBar class="notice-bar" :text="noticeInfo"/>
    <!-- <br> -->
    <el-row :gutter="20">
      <el-col :span="16">
        <el-card class="message-card">
          <template #header>
            <div class="message-card-header">
              <span>AITA动态</span>
              <!-- <el-button class="message-card-button" text>更多</el-button> -->
              <el-link href="/news">更多</el-link>
            </div>
          </template>
          <div class="message-card-content-box">
            <ul class="message-card-content-ul">
              <li v-for="news in newsList" :key="news.news_id" class="message-card-content-li">
                <a :href="news.news_link" target="_block" class="message-card-content-a">{{ news.news_title }}</a>
              </li>
            </ul>
          </div>
        </el-card>
      </el-col>
      <el-col :span="8">
        <el-card class="message-card">
          <template #header>
            <div class="message-card-header">
              <span>获取奖项</span>
              <!-- <el-button class="message-card-button" text>更多</el-button> -->
              <el-link href="/news">更多</el-link>
            </div>
          </template>
          <div class="message-card-content-box">
            <ul class="message-card-content-ul">
              <li v-for="award in awardList" :key="award.id" class="message-card-content-li">
                <a :href="award.link" target="_block" class="message-card-content-a">{{ award.title }}</a>
              </li>
            </ul>
          </div>
        </el-card>
      </el-col>
    </el-row>
    <el-card class="paper-scroll-card">
      <template #header>
        <div class="message-card-header">
          <span>论文展示</span>
          <el-link href="/papers">更多</el-link>
        </div>
      </template>
      <vue3-seamless-scroll :list="imageList" class="paper-scroll" direction="left" hover>
      <div class="paper-scroll-item" >
        <div v-for="image in imageList" :key="image.id">
          <a href=""><img :src="formatImageUrl(image.image_url)" alt="Paper Image" :title="image.title"/></a>
        </div>
      </div>
    </vue3-seamless-scroll>
    </el-card>
  </div>
</template>

<script setup lang="ts" name="Home">
import { ref, reactive, toRefs, onBeforeMount, onMounted, watchEffect, computed } from 'vue';
import { useRoute, useRouter } from 'vue-router';
import axios from 'axios';
import {Vue3SeamlessScroll} from "vue3-seamless-scroll";
import {formatImageUrl} from '../utils/ImgNorm'

// 获取论文列表
interface Papers{
    id:number;
    title:string;
    author:string;
    content:string;
    create_time:string;
    image_url:string;
}
let imageList=ref<Papers[]>([])
async function getPapers(){
    try{
      const res = await axios.get('http://127.0.0.1:5000/Papers/list')
      imageList.value = res.data
    }catch(err){
      console.log(err)
    }
}
// 获取新闻列表
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
const newsList = ref<News[]>([]);
  const getNews = async () => {
  try {
    const response = await axios.get('http://127.0.0.1:5000/all_news');
    if (response.data) {
      newsList.value = response.data;
    } 
  } catch (error) {
    console.error(error);
  }
};
onMounted(()=>{
  getPapers()
  getNews()
})

  let awardList = ref([
    {
      id: "asdassdfasd01",
      title: "测试奖项 01",
      date: "2024-01-01",
      link: "testAward/001"
    },
    {
      id: "asdassdfasd02",
      title: "测试奖项 02",
      date: "2024-01-01",
      link: "testAward/002"
    },
    {
      id: "asdassdfasd03",
      title: "测试奖项 03",
      date: "2024-01-01",
      link: "testAward/003"
    },
    {
      id: "asdassdfasd04",
      title: "测试奖项 04",
      date: "2024-01-01",
      link: "testAward/004"
    },
    {
      id: "asdassdfasd05",
      title: "测试奖项 05",
      date: "2024-01-01",
      link: "testAward/005"
    },
  ])

  let noticeInfo = ref("人工智能理论与应用创新研究团队                 人工智能理论与应用创新研究团队                        人工智能理论与应用创新研究团队")



</script>

<style scoped>
.message-card-header {
  display: flex;
  justify-content: space-between;
  align-items: center;
}
.message-card-content-box {
  height: 130px;
  overflow: hidden;
  .message-card-content-ul {
    list-style: none;
    .message-card-content-li {
      font-size: 18px;
      padding-bottom: 10px;
      .message-card-content-a {
        display: inline-block;
        @include text-ellipsis(1);
        color: var(--el-text-color-secondary);
        text-decoration: none;
      }
      & a:hover {
        color: var(--el-color-primary);
        cursor: pointer;
      }
    }
  }
}
.paper-scroll {
  /* height: 270px;
  width: 500px; */
  width: 100%;
  height: 200px;
  margin: 10px auto;
  overflow: hidden;
}
.paper-scroll-item {
  display: flex;
  img {
  width: auto;
  height: 200px;
  object-fit: cover;
  margin: 0 10px;
  }
}
.paper-scroll-card {
  margin: 50px 0;
}


</style>