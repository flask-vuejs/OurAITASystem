<style scoped>
*{
    margin: 0;
    padding: 0;
    box-sizing: border-box;
    font-family: 'Poppins', sans-serif;
}
a{
    text-decoration: none;
    color: #333;
}
a:hover{
    color: aqua;
}
ul li{
    list-style: none;
}
.container{
    position: relative;
    width: 100%;
    /* min-height: 100vh; */
    padding: 10px 15px;
    background: #fff;
    .nav{
        padding:15px 0;
    }
    .row{
        display: flex;
        width:80%;
        margin:0 auto;
        /* background-color: bisque; */
        padding:20px 0;
        .col-left{
            /* background-color: aqua; */
            img{
                width: 80%;
                height: auto;
                object-fit: cover;
            }
            .mt{
                /* margin-top: 5px; */
                color:#aaa;
                font-weight: 900;
                margin-left: 10px;
            }
        }
        .col-right{
            /* background-color: aquamarine; */
            padding: 0 15px;
            .info{
                h1{
                    font-size: 22px;
                    color:#333;
                    font-weight: normal;
                    margin-bottom: 10px;
                    line-height: 30px;
                }
                h2{
                    font-size: 22px;
                    font-weight: normal;
                    color:#707070;
                }
                .badge{
                    color: #fff;
                    background-color: #6c757d;
                    display:inline-block;
                    font-size:80%;
                    font-weight: 700;
                    line-height: 1;
                    text-align: center;
                    border-radius: .25rem;
                    padding:0.1rem 0.2rem;
                    margin-right: 20px;
                }
                p{
                    font-size: 17px;
                    color:#8d8d8d;
                    margin-bottom: 20px;
                }
                .info-item{
                    color:#666;
                    font-size:16px;
                    height:25px;
                    letter-spacing: 1px;
                    label{
                        display: inline-block;
                        width:130px;
                        text-align: left;
                        font-weight: bold;
                    }
                    span{
                        display: inline-block;
                        position:absolute;
                        margin-left: 10px;
                    }
                }
            }
        }
    }
}
</style>

<template>
    <div class="container">
        <div v-if="data">
            <div class="nav"></div>
            <el-row class="row">
                <el-col :span="8" class="col-left">
                    <img :src="data.data_image_url" alt="">
                    <div class="mt">
                        <el-icon><View /></el-icon>
                        <span>{{ data.data_read_count }}</span>
                    </div>
                </el-col>
                <el-col :span="16" class="col-right">
                    <div class="info">
                        <div>
                            <h1>{{data.data_title}}</h1>
                            <h2>{{ data.data_type }}</h2>
                            <div style="margin-bottom: 30px;">
                                <span class="badge">CNNVD</span>
                                <span class="badge">信息</span>
                                <span class="badge">安全</span>
                            </div>
                            <p>{{ data.data_content }}</p>
                        </div>
                        <ul>
                            <li class="info-item">
                                <label>数据集发布者：</label>
                                <span>{{ data.data_author }}</span>
                            </li>
                            <li class="info-item">
                                <label>发布时间：</label>
                                <span>{{ data.data_date }}</span>
                            </li>
                            <li class="info-item">
                                <label>数据集链接：</label>
                                <span> 
                                    {{ data.data_link }}
                                    <!-- <a :href="data.data_link"></a>  -->
                                </span>
                            </li>
                            <li class="info-item">
                                <label>数据集大小：</label>
                                <span>118M</span>
                            </li>
                        </ul>
                    </div>
                </el-col>
            </el-row>
            <div class="details"></div>
        </div>
        <div v-else>加载中...</div>
    </div>
</template>

<script lang="ts" setup>
import { ref, reactive, onMounted } from 'vue'
import axios from 'axios'
import { useRoute } from 'vue-router'
import { onBeforeMount } from 'vue';
// 图片地址规范化
const server_host='http://127.0.0.1:5000'
const formatImageUrl=(image_url:string)=>{
        if(image_url.startsWith('http')){
          return image_url
        }else{
          return server_host+image_url
        }
}

// 接收路由参数
const route = useRoute()
const data_id=ref('')
onBeforeMount(()=>{
  data_id.value=route.query.id as string
})

interface Data {
  data_id: number;
  data_title: string;
  data_content: string;
  data_date: string;
  data_author: string;
  data_link: string;
  data_read_count: number;
  data_image_url: string;
  data_type:string,
//   label_id: number;
}

let data = ref<Data>();
async function getData() {
  const res = await axios.get('http://127.0.0.1:5000/datasets/detail',{
    params: {
      id: data_id.value
    }
  });
  let result=res.data
  let code=result.code
//   console.log(result)
  if(code==200){
    data.value = result.data
  }
}

onMounted(() => {
  getData();
});
</script>