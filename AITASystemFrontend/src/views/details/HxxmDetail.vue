<template>
<div class="body bg-light py-5">
<div class="container p-5 content">
  <div class="project-details">
    <div class="project-header">
      <h1 class="mb-5">{{ hxxm?.name }}</h1>
      <p>{{ hxxm?.description }}</p>
    </div>
    <div class="project-info">
      <div class="info-item">
        <span class="label">客户:</span>
        <span class="value">{{ hxxm?.client }}</span>
      </div>
      <div class="info-item">
        <span class="label">项目经理:</span>
        <span class="value">{{ hxxm?.project_manager }}</span>
      </div>
      <div class="info-item">
        <span class="label">预算:</span>
        <span class="value">{{ hxxm?.budget }}元</span>
      </div>
      <div class="info-item">
        <span class="label">开始日期:</span>
        <span class="value">{{ hxxm?.start_date }}</span>
      </div>
      <div class="info-item">
        <span class="label">结束日期:</span>
        <span class="value">{{ hxxm?.end_date }}</span>
      </div>
    </div>
  </div>
</div>
</div>
</template>

<script setup lang="ts" name="">
import { ref, reactive, onMounted,onBeforeMount } from 'vue'
import axios from 'axios'
import { useRoute } from 'vue-router'
import type {Hxxm} from '../../utils/type'

// 接收路由参数
const route = useRoute()
const hxxm_id=ref('')
onBeforeMount(()=>{
    hxxm_id.value=route.query.id as string
})

const hxxm=ref<Hxxm>()
async function getHxxm(){
    try{
        const res=await axios.get('http://127.0.0.1:5000/hxxm/detail',{
            params:{
                id:hxxm_id.value
            }
        })
        console.log(res)
        if(res['data']['code']==200){
            hxxm.value=res['data']['data']
        }
    }catch(e){
        console.log(e)
    }
}

onMounted(()=>{
    getHxxm()
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