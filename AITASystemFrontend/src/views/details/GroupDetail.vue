<template>
<div class="body py-5">
    <div class="container content">
      <div class="row">
        <div class="col-3 border-right left">
            <img class="img-fluid img-thumbnail image mb-4" v-if="groupData?.group_person_image_url" :src="formatImageUrl(groupData.group_person_image_url)"/>
            <ul>
                <li class="px-3 py-3">
                    <h6 class="fw-bold">姓名：</h6>
                    <span>{{ groupData?.group_person_name }}</span>
                </li>
                <li class="px-3 py-3">
                    <h6 class="fw-bold">所属团队：</h6>
                    <span>{{ groupData?.group_type }}</span>
                </li>
                <li class="px-3 py-3">
                    <h6 class="fw-bold">职位：</h6>
                    <span>{{ groupData?.group_role }}</span>
                </li>
            </ul>
        </div>
        <div class="col-7 p-4 right">
            <ul>
                <li class="my-3">
                    <h5>个人简介</h5>
                    <p>{{ groupData?.group_person_description }}</p>
                </li>
                <li class="my-3">
                    <h5>自我描述</h5>
                    <p>{{ groupData?.group_person_content }}</p>
                </li>
                <li class="my-3">
                    <h5>发布论文</h5>
                    <p>{{ groupData?.group_person_papers }}</p>
                </li>
            </ul>
        </div>
        <div class="col-2"></div>
      </div>
    </div>
</div>
</template>

<script lang="ts" setup>
import {ref,onBeforeMount,onMounted,defineComponent} from 'vue';
import {useRoute} from 'vue-router';
import axios from 'axios'; 
import {formatImageUrl} from '../../utils/ImgNorm'
import type { GroupData} from '../../utils/type'
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

<style scoped>
ul{
    list-style: none;
    padding-left: 0px;
}
.body{
    width:100%;
    height:100%;
    background: #f7f9fa;
    .content{
        background-color: #fff;
        .left{
            display: flex;
            flex-direction: column;
            align-items:center;
            padding-top:20px;
            .image{
                max-width: 250px;
            }
            li{
                display:flex;
                align-items:center;
                border-bottom: 1px solid #e8eaec;
                h6{
                    width:150px;
                }
                span{
                    color:#868b98;
                }
            }
        }
        .right{
            li{
                border-top: 1px solid #e8eaec;
                h5{
                    font-weight: bold;
                    padding:5px;
                    width:200px;
                    background: #e8eaec;
                    color: #333;
                }
                p{
                    margin-top:10px;
                }
            }
        }
    }
}
</style>

