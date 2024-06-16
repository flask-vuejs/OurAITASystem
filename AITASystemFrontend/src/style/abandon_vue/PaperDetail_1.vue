<style scoped>
*{
    margin: 0;
    padding: 0;
    box-sizing: border-box;
    font-family: 'Poppins', sans-serif;
}
ul li{
    list-style: none;
}
.paper-detail{
    background: #f5f5f5;
    width:100%;
    height: 100%;
    font-size: 16px;
    .public-width{
        width:80%;
        margin:0 auto;
    }
    header{
        width:100%;
        box-shadow:2px 3px 5px #ccc;
        background-color: #fff;
        .header{
            display:flex;
            justify-content: space-between;
            align-items: center;
            /* width: 80%; */
            padding:20px 0;
            /* margin:0 auto; */
        }
        .logo{
            h3{
                font-size: 22px;
                letter-spacing: 2px;
                color:#333;
            }
        }
    }
    .content{
        margin-top:20px;
        /* background: aqua; */
        padding: 20px 0;
        .title{
            /* background-image: url('@/style/images/paper_title.png');
            background-size:cover;
            color:#fff; */
            background-color:#fff;
            display: flex;
            /* 设置主轴方向为纵向 */
            flex-direction: column; 
            justify-content: space-between;
            align-items: center;
            .title_top{
                padding:50px 0;
                font-size: 30px;
                font-weight: bold;
                letter-spacing: 8px;
            }
            .title_bottom{
                font-size: 18px;
                letter-spacing: 2px;
                ul li{
                    display: inline-block;
                    margin: 0 110px;
                }
            }
        }
        .content_detail{
            background:#fff;
            margin-top:20px;
            padding: 20px 50px;
        }
    }
}
</style>

<template>
<div class="paper-detail">
    <div v-if="paper">
        <header>
            <div class="header public-width">
                <div class="logo">
                    <h3>论文详情</h3>
                </div>
                <div class="nav"></div>
            </div>
        </header>
        <div class="content public-width">
            <div class="title">
                <div class="title_top">{{ paper.title }}</div>
                <div class="title_bottom">
                    <ul>
                        <li>作者：{{ paper.author }}</li>
                        <li>时间：{{ paper.create_time }}</li>
                    </ul>
                </div>
            </div>
            <div class="content_detail">
                <span>{{ paper.content }}</span>
            </div>
        </div>
    </div>
    <div v-else>Loading...</div>
</div>
</template>

<script lang="ts" setup>
import {useRoute} from 'vue-router'
import {onBeforeMount, ref} from 'vue'
import axios from 'axios'
import { onMounted } from 'vue';

const route = useRoute()
const paper_id=ref('')
onBeforeMount(()=>{
    paper_id.value=route.query.id as string
    console.log(paper_id.value)
})

interface Papers{
    id:number;
    title:string;
    author:string;
    content:string;
    create_time:string;
    image_url?:string;
}
const paper=ref<Papers>()
async function getPaper(){
    try{
        const response=await axios.get('http://127.0.0.1:5000/Papers/detail',{
            params:{
                paper_id:paper_id.value
            },
        });
        let result=response.data;
        console.log(result);
        let code=result.code;
        if(code==200){
            paper.value=result.data;
        }
    }catch(error){
        console.error('Error fetching group data:',error);
    }
}
onMounted(()=>{
    getPaper();
})
</script>