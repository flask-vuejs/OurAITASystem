
<style src="@/style/index.css"  scoped></style>

<style scoped>
.container{
    position: relative;
    width: 100%;
    max-width: 1400px;
    min-height: 800px;
    background: #fff;
    margin:50px;
    box-shadow: 0 35px 55px rgba(0, 0, 0, 0.1);
    .top{
        position:relative;
        width:100%;
        height:400px;
        background: linear-gradient(45deg, #231fbf, #69175f);
        padding:50px;
        h2{
            font-size:2em;
            color:#fff;
            text-transform: uppercase;
            line-height:0.7em;
            letter-spacing: 0.1em;
        }
        .group{
            position:relative;
            display: grid;
            gap:40px;
            width:100%;
            grid-template-columns: 1fr 3fr;
            margin-top:40px;
            .imgBx{
                position:relative;
                width: 100%;
                img{
                    width:98%;
                }
            }
            p{
                font-size:1.2em;
                color:#fff;
            }
        }
    }
    .bottom{
        position:relative;
        display: grid;
        margin:50px 50px 0;
        gap:40px;
        grid-template-columns: 2fr 3fr;
        /* background-color: #231fbf; */
        h4{
                font-size:1.1em;
                text-transform:uppercase;
                letter-spacing: 0.25em;
                color:#fff;
                background-color: #231fbf;
                font-weight: 600;
                padding: 0 15px;
                margin-top: 40px;
                display: inline-flex;
          }
        .left_side{
            margin-top: 50px;
            .des_info{
                position:relative;
                display:flex;
                flex-direction: column;
                gap:20px;
                margin:20px 0;
                li{
                    list-style: none;
                    display: flex;
                    gap:10px;
                    .icon{
                        color:#231fbf;
                    }
                    .text{
                        color:#555;
                    }
                }
            }
        }
        .right_side{
            .adjstMargin{
                margin-top:-10px;
                margin-left: -30px;
            }
            .papers_list{
                background: #eee8e8;
                box-shadow: 0 35px 55px rgba(0, 0, 0, 0.1);
            }
        }
    }
}
</style>


<template>
<div v-if="groupData">
    <div class="container">
        <div class="top">
            <h2>{{ groupData.group_person_name }}</h2>
            <div class="group">
                <div class="leftSide">
                    <div class="imgBx">
                        <img :src="formatImageUrl(groupData.group_person_image_url)">
                    </div>
                </div>
                <div class="rightSide">
                    <p>{{ groupData.group_person_content }}</p>
                </div>
            </div>
        </div>
        <div class="bottom">
            <div class="left_side">
                <h4>Description</h4>
                <ul class="des_info">
                    <li>
                        <el-icon class="icon"><Avatar /></el-icon>
                        <span class="text">{{ groupData.group_person_name }}</span>
                    </li>
                    <li>
                        <el-icon class="icon"><House /></el-icon>
                        <span class="text">{{ groupData.group_type }}</span>
                    </li>
                    <li>
                        <el-icon class="icon"><Ticket /></el-icon>
                        <span class="text">{{ groupData.group_role }}</span>
                    </li>
                    <li>
                        <el-icon class="icon"><EditPen /></el-icon>
                        <span class="text">{{ groupData.group_person_description }}</span>
                    </li>
                </ul>
            </div>
            <div class="right_side">
                <h4 class="adjstMargin">论文展示</h4>
                <div class="papers_list"></div>
            </div>
        </div>
    </div>
</div>
<div v-else>
    <!-- 显示加载中或错误信息 -->
    Loading...
</div>
</template>

<script lang="ts" setup>
import {ref,onBeforeMount,onMounted,defineComponent} from 'vue';
import {useRoute} from 'vue-router';
import axios from 'axios'; 

// import 'element-plus/dist/index.css';
// 图片地址规范化
const server_host='http://127.0.0.1:5000'
const formatImageUrl=(image_url:string)=>{
        if(image_url.startsWith('http')){
          return image_url
        }else{
          return server_host+image_url
        }
}
interface GroupData {
  group_id: number;
  group_type: string;
  group_role: string;
  group_person_name: string;
  group_person_description: string;
  group_person_image_url: string;
  group_person_content: string;
  group_person_papers: string;
};
let groupData=ref<GroupData>();

async function getGroupData(){
    try{
        const response=await axios.get('http://127.0.0.1:5000/datasets/query/group/detail',{
            params:{
                group_id:groupId.value
            },
        });
        //console.log('Group Data:',response.data);
        let result=response.data;
        let code=result.code;
        if(code==200){
            groupData.value=result.data;
            //console.log('Group Data:',groupData.value);
        }
    }catch(error){
        console.error('Error fetching group data:',error);
    }
}
onMounted(()=>{
    getGroupData();
})


// 获取路由参数
const route = useRoute();
const groupId=ref<string>('');
onBeforeMount(()=>{
    groupId.value=route.query.id as string;
    console.log('Group_ID:',groupId.value);
})

</script>

