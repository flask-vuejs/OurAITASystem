<template>
<div class="bg-light py-5 body">
    <div class="container my-5 main">
      <div class="row">
        <div class="col-7 p-4 left">
          <h3 class="fw-bold mb-4">数据集介绍</h3>
          <div>{{ data?.data_abstract }}</div>
          <h3 class="fw-bold my-4">数据集文档</h3>
          <div v-html="data?.data_content"></div>
        </div>
        <div class="col-1"></div>
        <div class="col-4 p-4 right">
          <h3 class="fw-bold mb-4">信息</h3>
          <ul>
            <li class="py-3">
              <h5 class="fw-bold mb-3">Title</h5>
              <div>{{ data?.data_title }}</div>
            </li>
            <li class="py-3">
              <h5 class="fw-bold mb-3">技术领域</h5>
              <div>{{ data?.data_type }}</div>
            </li>
            <li class="py-3">
              <h5 class="fw-bold mb-3">贡献者</h5>
              <div>{{ data?.data_author }}</div>
            </li>
            <li class="py-3">
              <h5 class="fw-bold mb-3">上传日期</h5>
              <div>{{ data?.data_date }}</div>
            </li>
            <li class="py-3">
              <h5 class="fw-bold mb-3">链接</h5>
              <div><a :href="data?.data_link" target="_blank" >链接跳转</a></div>
            </li>
          </ul>
        </div>  
      </div>
    </div>
</div>
</template>


<script lang="ts" setup>
import { ref, reactive, onMounted,onBeforeMount } from 'vue'
import axios from 'axios'
import { useRoute } from 'vue-router'
import {formatImageUrl} from '../../utils/ImgNorm'
import type {Data} from '../../utils/type'
// 接收路由参数
const route = useRoute()
const data_id=ref('')
onBeforeMount(()=>{
  data_id.value=route.query.id as string
})

let data = ref<Data>();
async function getData() {
  const res = await axios.get('http://127.0.0.1:5000/datasets/detail',{
    params: {
      id: data_id.value
    }
  });
  let result=res.data
  let code=result.code
  if(code==200){
    data.value = result.data
  }
}

onMounted(() => {
  getData();
});
</script>

<style scoped>
.body{
  ul{
    list-style: none;
  }
  width:100%;
  height:100%;
  .main{
    font-family: "Microsoft yahei";
    .left{
      background-color: #fff;
      border: 2px solid #dcdee2;
      border-radius: 4px;
    }
    .right{
      background-color: #fff;
      border: 2px solid #dcdee2;
      border-radius: 4px;
      li{
        border-bottom: 1px solid #f1f4f9;
        h5{
          color: #6477a6;
          /* margin-bottom: 8px; */
        }
      }
    }
  }
}
</style>