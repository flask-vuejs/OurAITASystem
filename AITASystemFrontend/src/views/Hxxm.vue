<template>
  <div class="project-list">
    <div class="project-item" v-for="(item, index) in hxxms" :key="index">
      <div @click.prevent="to_detail(item.id)">
        <div class="project-content">
          <i ></i>
          <!-- :class="item.icon" -->
          <div>
            <h3 class="project-title">{{ item.name }}</h3>
            <p class="project-description">{{ item.description }}</p>
          </div>
        </div>
        <div class="project-stats">
          <span><i class="fas fa-users"></i>负责人： {{ item.project_manager }}</span>
          <span><i class="fas fa-calendar-alt"></i> Started: {{ item.start_date }}</span>
          <span><i class="fas fa-thermometer-half"></i> Ended: {{ item.end_date }}</span>
        </div>
      </div>
    </div>
  </div>
</template>

<script setup lang="ts" name="">
import { ref, reactive, toRefs, onBeforeMount, onMounted, watchEffect, computed } from 'vue';
import { useRoute, useRouter } from 'vue-router';
import type {Hxxm} from '../utils/type'
import {formatImageUrl} from '../utils/ImgNorm'
import axios from 'axios'

// 跳转到详情页
const router=useRouter()
const to_detail=(id:number)=>{
  router.push({ 
    path: "/hxxm_detail",
    query:{
      id:id
    }
  });
}


const hxxms = ref<Hxxm[]>([]); 

async function getHxxms() {
  try{
    const res:any=await axios.get<any>('http://127.0.0.1:5000/hxxm/list')
    if(res['data']['code']==200){
      hxxms.value=res['data']['data']
      //console.log(hxxms.value)
    }
  }catch(e){
    console.log(e)
  }
}

onMounted(()=>{
  getHxxms()
})
</script>


<style scoped lang="less">
.project-list {
  display: flex;
  flex-direction: column;
  align-items: center;
  padding: 30px;
  background: #f9f9f9;
}

.project-item {
  width: 95%;
  padding: 25px;
  margin: 15px 0;
  background: #ffffff;
  border-radius: 12px;
  border: 2px solid #e0e0e0;
  box-shadow: 0 4px 10px rgba(100,100,100,0.1);
  transition: all 0.35s cubic-bezier(.25,.8,.25,1);
  color: #333;
  cursor: pointer;
  
  &:hover {
    transform: translateY(-5px);
    border-color: #5c67f2;
    box-shadow: 0 6px 20px rgba(92,103,242,0.25);
  }
}

.project-content {
  display: flex;
  align-items: center;
  margin-bottom: 12px;

  .project-title {
    font-size: 1.6rem;
    color: #5c67f2;
    margin: 0;
  }

  .project-description {
    margin: 8px 0 0;
    font-size: 0.9rem;
    color: #555;
    opacity: 0.9;
  }
}

.project-stats {
  display: flex;
  justify-content: space-between;
  font-size: 0.9rem;
  color: #444;
}

.project-icon {
  font-size: 32px;
  color: #5c67f2;
  margin-right: 20px;

  animation: bounce 2s infinite ease-in-out;
}

@keyframes bounce {
  0%, 20%, 50%, 80%, 100% {
    transform: translateY(0);
  }
  40% {
    transform: translateY(-30px);
  }
  60% {
    transform: translateY(-15px);
  }
}
</style>