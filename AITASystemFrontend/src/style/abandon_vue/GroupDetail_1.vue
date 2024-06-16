
<style scoped>
.infoshow {
  margin-top: 40px;
  .el-row:not(:last-child) {
     margin-bottom: 20px; /* 设置行间距 */
   }
}
.top_left {
  text-align: center;
  height: 300px;
  .person_img {
   width: auto;
   height: 300px;
   object-fit: cover;
   border-radius: 5px; /* 给图片添加圆角 */
}
}



.top_right {
  height: 300px;
  padding: 10px;
  background-color: #f9f9f9; /* 轻微的背景色区分 */
  border-radius: 5px;
  box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1); /* 微小阴影增加深度感 */
  .info-list {
    list-style-type: none; /* 移除默认的列表标记 */
    padding: 0;
    margin: 0;
    li{
        margin-top: 25px;
        margin-bottom: 25px;
        height: 30px;
        .info-item{
            display: flex;
            margin-bottom: 10px;
            .el-icon{
                font-size:18px;
                margin-right: 5px;
            }
            .item-content{
                margin-left: 10px;
                .description{
                    font-size:20px;
                }
                .sub-text{
                    font-size:18px;
                    margin-left: 30px;
                    margin-bottom:2px;
                    color: #666; /* 可以选择一种较淡的颜色，让其看起来更次要 */
                }
            }
        }
    }
    .info-item:last-child{
        margin-bottom: 0;
    }
    .el-icon{
        margin-right: 50px;
    }
  }
}

/* 详细资料部分 */
.infoshow .content-title{
  font-size: 30px;
  margin-top: 30px;
  margin-bottom: 10px;
  color: #333;
  padding-left: 125px;
}

/* 调整列的内边距
.el-col > div {
  padding: 15px;
} */

/* 可以为内容区域添加更多样式 */
.content-area {
  background-color: #f9f9f9; /* 轻微的背景色区分 */
  border-radius: 5px;
  box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1); /* 微小阴影增加深度感 */
  /* background-color: #42b983; */
  font-size: 18px;
  line-height: 1.6;
  /* padding-left: 40px; */
}

/* 根据需要为papers添加样式 */
.papers-area {
  background-color: #e0e0e0; /* 轻微的背景色区分 */
  border-radius: 5px;
  box-shadow: 0 5px 10px rgba(0, 0, 0, 0.1); /* 微小阴影增加深度感 */
  /* background-color: aqua; */
  font-weight: bold;
  color:black;

}
</style>

<template>
<div v-if="groupData">
    <div class="infoshow">
        <el-row justify="center" :gutter="20">
                <el-col :span="8">
                <div class="top_left">
                    <img :src="formatImageUrl(groupData.group_person_image_url)" class="person_img">
                </div>
                </el-col>
                <el-col :span="16">
                <div class="top_right">
                    <h3>个人简介</h3>
                    <ul class="info-list">
                      <li>
                        <div class="info-item">
                            <el-icon><Avatar /></el-icon>
                            <div class="item-content">
                                <span class="description">姓名</span>
                                <span class="sub-text">{{ groupData.group_person_name }}</span>
                            </div>
                        </div>
                      </li>
                      <li>
                        <div class="info-item">
                            <el-icon><Position /></el-icon>
                            <div class="item-content">
                                <span class="description">所属团队</span>
                                <span class="sub-text">{{ groupData.group_type }}</span>
                            </div>
                        </div>
                      </li>
                      <li>
                        <div class="info-item">
                            <el-icon><User /></el-icon>
                            <div class="item-content">
                                <span class="description">角色</span>
                                <span class="sub-text">{{ groupData.group_role }}</span>
                            </div>
                        </div>
                      </li>
                      <li>
                        <div class="info-item">
                            <el-icon><MoreFilled /></el-icon>
                            <div class="item-content">
                                <span class="description">个人描述</span>
                                <span class="sub-text">{{ groupData.group_person_description }}</span>
                            </div>
                        </div>
                      </li>
                    </ul>
                </div>
                </el-col>
        </el-row>
        <div class="content-title">
            <h3>详细资料</h3>
        </div>
        <el-row :gutter="20"> 
            <el-col :span="1"></el-col>
            <el-col :span="7">
                <div class="content-area">
                    <!-- <span>{{ groupData.group_person_content }}</span> -->
                </div>
            </el-col>
            <el-col :span="16">
                <div class="papers-area">
                    <h3>发表论文</h3>
                    <span>{{ groupData.group_person_papers }}</span>
                </div>
            </el-col>
        </el-row>
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

<!-- <style scoped>
.top_left{
    width:150px;
    height:220px;
    display: flex;
    .person_img{
        width:100px;
        height:auto;
        object-fit: cover;
    }
}
</style> -->