<template>
<div class="body bg-light py-5">
<div class="container p-5 content">
    <div class="col-8 project-details">
      <div class="project-header">
        <h1 class="mb-5">{{ zxxm?.name }}</h1>
        <p>{{ zxxm?.description }}</p>
      </div>
      <div class="project-info">
        <div class="info-item">
          <span class="label">资助机构:</span>
          <span class="value">{{ zxxm?.funding_agency }}</span>
        </div>
        <div class="info-item">
          <span class="label">项目负责人:</span>
          <span class="value">{{ zxxm?.principal_investigator }}</span>
        </div>
        <div class="info-item">
          <span class="label">项目预算:</span>
          <span class="value">{{ zxxm?.budget }}元</span>
        </div>
        <div class="info-item">
          <span class="label">开始日期:</span>
          <span class="value">{{ zxxm?.start_date }}</span>
        </div>
        <div class="info-item">
          <span class="label">结束日期:</span>
          <span class="value">{{ zxxm?.end_date }}</span>
        </div>
        <div class="info-item">
          <span class="label">项目状态:</span>
          <span class="value">{{ zxxm?.status }}</span>
        </div>
      </div>
    </div>
</div>
</div>
</template>

<script setup lang="ts">
import { ref, reactive, onMounted,onBeforeMount } from 'vue'
import axios from 'axios'
import { useRoute } from 'vue-router'
import type { Zxxm } from '../../utils/type'

// 接收路由参数
const route=useRoute()
const zxxm_id=ref('')
onBeforeMount(()=>{
    zxxm_id.value=route.query.id as string
})

const zxxm=ref<Zxxm>()
async function getZxxm(){
    try{
        const res=await axios.get('http://127.0.0.1:5000/zxxm/detail',{
            params:{
                id:zxxm_id.value
            }
        })
        if(res['data']['code']==200){
            zxxm.value=res['data']['data']
        }
        console.log(zxxm.value)
    }catch(e){
        console.log(e)
    }
}

onMounted(()=>{
    getZxxm()
})



</script>

<style lang="less" scoped>
.content{
  background-color: #fff;
}
.project-details {
  width:800px;
  margin:0 auto;
  display: flex;
  flex-direction: column;
  align-items: center;
  padding: 2rem;

  .project-header {
    text-align: center;
    margin-bottom: 2rem;

    h1 {
      font-size: 2rem;
      color: #333;
    }

    p {
      font-size: 1.2rem;
      color: #666;
    }
  }

  .project-info {
    display: flex;
    flex-direction: column;
    justify-content: space-around;
    width: 100%;
    max-width: 800px;

    .info-item {
      display: flex;
      flex-direction: row;
      align-items: center;
      margin: 1rem 0;
      .label {
        display: block;
        width:300px;
        font-weight: bold;
        color: #555;
      }
      .value {
        margin-top: 0.5rem;
      }
    }
  }
}
</style>