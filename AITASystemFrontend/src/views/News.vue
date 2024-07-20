<template>
<div class="body bg-light">
  <div class="news-container">
    <h2 class="news-header">{{ "新闻动态" }}</h2>
    <div v-if="newsList.length > 0" class="news-grid">
      <div v-for="(news, index) in newsList" :key="news.news_id" class="news-card" @click="toggleNews(index)">
        <!-- 检查图片数组并展示第一张图片 -->
        <div class="news-thumbnail" 
        v-if="news.news_image_url && news.news_image_url.length > 0" 
        :style="{ backgroundImage: 'url(' + formatImageUrl(news.news_image_url) + ')' }"
        >
      </div>
        <!-- 可以添加一个else条件显示默认图片或不显示图片 -->
        <div v-if="!news.news_image_url || news.news_image_url.length === 0" class="news-thumbnail default-thumbnail">
        </div>
        
        <div class="news-content" @click="redirectToLink(news.news_link)">
          <h3 class="news-title">{{ news.news_title }}</h3>
          <!-- <transition name="content">
            <p class="news-body" v-if="activeIndex === index">{{ news.news_content }}</p>
          </transition> -->
          <div class="news-meta">
            <span class="news-author">作者: {{ news.news_author }}</span>
            <span class="news-date">日期: {{ news.news_date }}</span>
            <a :href="news.news_link" target="_blank" class="news-link">阅读全文</a>
            <span class="news-read-count">{{ news.news_read_count }}次阅读</span>
          </div>
        </div>
      </div>
    </div>
    <p v-else class="no-news">暂无新闻数据</p>
  </div>
</div>
</template>

<script setup lang="ts">
import { ref, onMounted,onBeforeMount } from 'vue';
import axios from 'axios';
import {formatImageUrl} from '../utils/ImgNorm'
import type {News} from '../utils/type'


const newsList = ref<News[]>([]);
const activeIndex = ref<number | null>(null); // 用于跟踪当前展开的新闻索引

const getNewsData = async () => {
  try {
    const response = await axios.get('http://127.0.0.1:5000/all_news');
    if (response.data) {
      newsList.value = response.data;
    } else {
      console.error('Failed to fetch news data.');
    }
  } catch (error) {
    console.error('An error occurred while fetching news:', error);
  }
};
onMounted(() => {
  getNewsData();
});
// onMounted(() => {
//   axios.get('http://127.0.0.1:5000/all_news')
//     .then((response) => {
//       if (response.data) {
//         newsList.value = response.data;
//       } else {
//         console.error('Failed to fetch news data.');
//       }
//     })
//     .catch((error) => {
//       console.error('An error occurred while fetching news:', error);
//     });
// });

const toggleNews = (index: number) => {
  activeIndex.value = activeIndex.value === index ? null : index;
};
const redirectToLink = (link: string) => {
  window.open(link, '_blank');
};

onBeforeMount(() => {
  document.addEventListener('click', (event) => {
    const target = event.target as HTMLElement;
    if (target.classList.contains('news-meta') || target.classList.contains('news-link')) {
      event.stopPropagation();
    }
  });
});
</script>

<style scoped>
.body{
  width:100%;
  height:100%;
}
.news-container {
  padding: 20px;
  max-width: 1200px;
  margin: auto;
}

.news-header {
  text-align: center;
  margin-bottom: 40px;
  font-size: 2em;
}

.news-grid {
  display: grid;
  grid-template-columns: repeat(auto-fill, minmax(320px, 1fr));
  grid-gap: 20px;
}

.news-card {
  border: 1px solid #e1e1e1;
  border-radius: 8px;
  overflow: hidden;
  transition: box-shadow 0.3s ease;
  cursor: pointer;
}

.news-card:hover {
  box-shadow: 0 5px 15px rgba(0,0,0,0.1);
}

.news-thumbnail {
  height: 200px;
  background-size: cover;
  background-position: center;
}

.news-content {
  padding: 15px;
}

.news-title {
  margin-top: 0;
  font-size: 1.5em;
}

.news-body {
  font-size: 1em;
  line-height: 1.6;
  margin: 15px 0;
}

.news-meta {
  display: flex;
  flex-wrap: wrap;
  align-items: center;
  justify-content: space-between;
  font-size: 0.85em;
  color: #666;
}

.news-link {
  color: #007bff;
  text-decoration: none;
}

.news-read-count {
  background: #f1f1f1;
  padding: 3px 8px;
  border-radius: 15px;
}

.content-enter-active, .content-leave-active {
  transition: all 0.3s ease;
}

.content-enter, .content-leave-to /* .content-leave-active in <2.1.8 */ {
  max-height: 0;
  overflow: hidden;
  opacity: 0;
}

/* 响应式布局 */
@media (max-width: 768px) {
  .news-grid {
    grid-template-columns: 1fr;
  }
}

.news-thumbnail.default-thumbnail {
  background-color: #f0f0f0; /* 默认背景颜色，或者可以设置为默认图片 */
  background-image: url('path_to_default_image.jpg'); /* 设置默认图片路径 */
  background-size: cover;
  background-position: center;
}
</style>