<template>
  <div class="papers-container">
    <div v-if="paperList && paperList.length > 0" class="papers-list">
      <div v-for="paper in paperList" :key="paper.id" class="paper-item">
        <h3>{{ paper.title }}</h3>
        <p><strong>Author:</strong> {{ paper.author }}</p>
        <p><strong>Content:</strong> {{ paper.content }}</p>
        <p><strong>Create Time:</strong> {{ paper.create_time }}</p>
        <!-- If you want to render an image when available -->
        <img v-if="paper.image" :src="paper.image" alt="Paper Image" class="paper-image">
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
const route = useRoute()
let paperList=ref<Papers[]|null>([])
async function getPapers(){
    try{
      const res = await axios.get('http://127.0.0.1:5000/Papers/list')
      paperList.value = res.data
      console.log(paperList)
      console.log(typeof paperList)
    }catch(err){
      console.log(err)
    }
}
onMounted(()=>{
  getPapers()
})
</script>


<style scoped>
.papers-container {
  /* Add your container styles */
}

.papers-list {
  /* Add list styling */
}

.paper-item {
  /* Style each paper item */
  margin-bottom: 20px;
}

.paper-image {
  /* Style for the image if present */
  max-width: 100%;
  height: auto;
}
</style>