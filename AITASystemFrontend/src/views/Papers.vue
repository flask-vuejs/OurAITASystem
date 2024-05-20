<template>
  <div class="papers-container">
    <div v-if="paperList && paperList.length > 0" class="papers-list">
      <div v-for="paper in paperList" :key="paper.id" class="paper-item">
        <div class="paper-content">
          <div class="paper-header">
            <h3 class="paper-title">{{ paper.title }}</h3>
            <p class="author-tag">Author: {{ paper.author }}</p>
          </div>
          <p class="content-excerpt">{{ paper.content }}</p>
          <div class="paper-meta">
            <p class="create-time">Create Time: {{ paper.create_time }}</p>
          </div>
        </div>
        <img v-if="paper.image" :src="paper.image" alt="Paper Image" class="paper-image-left" />
      </div>
    </div>
    <p v-else>No papers found.</p>
  </div>
</template>

<script setup lang="ts">
import {defineComponent,ref} from 'vue'
import {useRoute} from 'vue-router'
// import {testPapers} from '../testData'
import axios from 'axios';
import { createEditor } from '@wangeditor/editor';
import { pa } from 'element-plus/es/locale';
import { onMounted } from 'vue';
interface Papers{
    id:number;
    title:string;
    author:string;
    content:string;
    create_time:string;
    image?:string;
}
const mockPapers: Papers[] = [
  {
    id: 1,
    title: '论文标题1',
    author: '作者A',
    content: '这是论文1的内容摘要...',
    create_time: '2023-04-01',
    image: './public/personal.jpg',
  },
  {
    id: 2,
    title: '论文标题2',
    author: '作者B',
    content: '这是论文2的内容摘要...',
    create_time: '2023-04-02',
    image: './public/personal.jpg',
  },
  // 可以继续添加更多模拟数据...
];
// const route = useRoute()
let paperList=ref<Papers[]|null>([])
async function getPapers(){
    try{
      const res = await axios.get('http://127.0.0.1:5000/Papers/list')
      paperList.value = res.data
      console.log(paperList.value)
      console.log(typeof paperList)
    }catch(err){
      console.log(err)
    }
}
onMounted(()=>{
  getPapers()
  //paperList.value = mockPapers;
})
</script>


<style scoped>
.papers-container {
  padding: 4rem 2rem;
  background-color: #f8f9fa;
  min-height: 100vh;
  display: flex;
  justify-content: center;
}

.papers-list {
  max-width: 1200px;
  width: 100%;
}

.paper-item {
  background-color: white;
  box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
  border-radius: 8px;
  padding: 2rem;
  margin-bottom: 3rem;
  transition: all 0.3s ease;
  display: flex; /* 添加此行以启用Flex布局 */
  align-items: flex-start; /* 使项目在交叉轴上对齐顶部 */
  
  &:hover {
    transform: translateY(-5px);
    box-shadow: 0 8px 12px rgba(0, 0, 0, 0.15);
  }
}

.paper-content {
  flex: 1; /* 允许内容区域灵活扩展 */
  margin-left: 2rem; /* 为内容与图片间添加间距 */
  flex-wrap: wrap; /* 允许内容换行 */
}

.paper-image-left {
  margin-right: 2rem; /* 图片与内容间的右边距 */
  max-width: 30%; /* 控制图片最大宽度，可根据需要调整 */
  height: auto;
  object-fit: cover;
  border-radius: 8px;
  margin-top: 0; /* 移除顶部外边距 */
}

.paper-header {
  display: flex;
  align-items: center;
  gap: 1rem;
  margin-bottom: 1.5rem;
}

.paper-title {
  color: #343a40;
  font-size: 24px;
  font-weight: bold;
}

.author-tag {
  color: #6c757d;
  font-size: 16px;
}

.content-excerpt {
  color: #6c757d;
  line-height: 1.6;
  margin-bottom: 1.5rem;
}

.paper-meta {
  display: flex;
  align-items: center;
  justify-content: space-between;
}

.create-time {
  color: #6c757d;
  font-size: 14px;
}

.paper-image {
  max-width: 100%;
  height: auto;
  border-radius: 8px;
  margin-top: 2rem;
  object-fit: cover;
}

@media (max-width: 768px) {
  .papers-list {
    padding: 1rem;
  }

  .paper-item {
    padding: 1.5rem;
  }

  .paper-title {
    font-size: 18px;
  }

  .author-tag {
    font-size: 14px;
  }
}
</style>