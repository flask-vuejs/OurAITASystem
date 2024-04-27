<template>
  <div class="group">
    <el-text class="group-title-text" size="large">教师队伍</el-text>
    <hr/>
    <el-row class="groupInfo">
        <el-col class="groupCol" v-for="teacherInfo in teacherInfoList" :key="teacherInfo.id" :span="8">
            <el-card class="group-card" :body-style="{ padding: '0px' }">
                <el-image class="group-image" :src="teacherInfo.photoUrl" fit="cover">
                    <template #placeholder>
                        <div class="image-slot">Loading<span class="dot">...</span></div>
                    </template>
                    <template #error>
                        <div class="image-slot">
                            <el-icon><Picture /></el-icon>
                        </div>
                    </template>
                </el-image>
                <div style="padding: 14px">
                    <span>{{ teacherInfo.name }}</span>
                    <div class="bottom">
                        <span>{{ teacherInfo.detail }}</span>
                    </div>
                </div>
            </el-card>
        </el-col>
    </el-row>
    <el-text class="group-title-text" size="large">学生队伍</el-text>
    <hr/>
    <el-row class="groupInfo">
        <el-col class="groupCol" v-for="studentInfo in studentInfoList" :key="studentInfo.id" :span="8">
            <el-card class="group-card" :body-style="{ padding: '0px' }">
                <el-image class="group-image" :src="studentInfo.photoUrl" fit="cover">
                    <template #placeholder>
                        <div class="image-slot">Loading<span class="dot">...</span></div>
                    </template>
                    <template #error>
                        <div class="image-slot">
                            <el-icon><Picture /></el-icon>
                        </div>
                    </template>
                </el-image>
                <div style="padding: 14px">
                    <span>{{ studentInfo.name }}</span>
                    <div class="bottom">
                        <span>{{ studentInfo.detail }}</span>
                    </div>
                </div>
            </el-card>
        </el-col>
    </el-row>
  </div>
  <div>
  <h2>{{ groupData?.group_person_name }}</h2>
  <p>Group ID: {{ groupData?.group_id }}</p>
</div>
</template>

<script setup lang="ts" name="">
    import { ElFormItem } from 'element-plus';
    import { ref, reactive, toRefs, onBeforeMount, onMounted, watchEffect, computed } from 'vue';
    import { useRoute, useRouter } from 'vue-router';
    import VueAxios from 'vue-axios';
    
    import axios from 'axios'; 
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
let groupData = ref<GroupData | null>(null);


async function fetchGroupData() {
  try {
    const response = await axios.get<GroupData>('http://127.0.0.1:5000/datasets/query/group');
    groupData.value = response.data;
    console.log(groupData);
    console.log('Type of groupData:', typeof groupData);
  } catch (error) {
    console.error('Failed to fetch group data:', error);
  }
}
onMounted(fetchGroupData);

    /**
    * 路由对象
    */
    const route = useRoute();
    let {query} = toRefs(route)

    type teacherInfoInter = {
        id:string,
        name:string,
        photoUrl:string,
        detail:string
    }
    type studentInfoInter = {
        id: string,
        name: string,
        photoUrl: string,
        detail: string
    }

    let teacherInfoList:Array<teacherInfoInter> = reactive([{id: "", name: "", photoUrl:"", detail:""}])
    let studentInfoList:Array<studentInfoInter> = reactive([{id: "", name: "", photoUrl:"", detail:""}])

    watchEffect(()=>{
        if(route.query.type == "cloudcomputing"){
            Object.assign(teacherInfoList, [
                {
                    id: "001",
                    name: "云计算测试01",
                    photoUrl: "https://images.pexels.com/photos/11278221/pexels-photo-11278221.jpeg?auto=compress&cs=tinysrgb&w=800&lazy=load",
                    detail: "什么什么人",
                },
                {
                    id: "002",
                    name: "云计算测试02",
                    photoUrl: "https://images.pexels.com/photos/11278221/pexels-photo-11278221.jpeg?auto=compress&cs=tinysrgb&w=800&lazy=load",
                    detail: "什么什么人",
                },
                {
                    id: "002",
                    name: "云计算测试02",
                    photoUrl: "https://images.pexels.com/photos/11278221/pexels-photo-11278221.jpeg?auto=compress&cs=tinysrgb&w=800&lazy=load",
                    detail: "什么什么人",
                },
                {
                    id: "002",
                    name: "云计算测试02",
                    photoUrl: "https://images.pexels.com/photos/11278221/pexels-photo-11278221.jpeg?auto=compress&cs=tinysrgb&w=800&lazy=load",
                    detail: "什么什么人",
                },
                {
                    id: "002",
                    name: "云计算测试02",
                    photoUrl: "https://images.pexels.com/photos/11278221/pexels-photo-11278221.jpeg?auto=compress&cs=tinysrgb&w=800&lazy=load",
                    detail: "什么什么人",
                },
                {
                    id: "002",
                    name: "云计算测试02",
                    photoUrl: "https://images.pexels.com/photos/11278221/pexels-photo-11278221.jpeg?auto=compress&cs=tinysrgb&w=800&lazy=load",
                    detail: "什么什么人",
                },
                {
                    id: "002",
                    name: "云计算测试02",
                    photoUrl: "https://images.pexels.com/photos/11278221/pexels-photo-11278221.jpeg?auto=compress&cs=tinysrgb&w=800&lazy=load",
                    detail: "什么什么人",
                },
                {
                    id: "003",
                    name: "云计算测试03",
                    photoUrl: "https://images.pexels.com/photos/11278221/pexels-photo-11278221.jpeg?auto=compress&cs=tinysrgb&w=800&lazy=load",
                    detail: "什么什么人",
                }
            ])
            Object.assign(studentInfoList, [
                {
                    id: "001",
                    name: "云计算测试01",
                    photoUrl: "https://images.pexels.com/photos/11278221/pexels-photo-11278221.jpeg?auto=compress&cs=tinysrgb&w=800&lazy=load",
                    detail: "什么什么人",
                },
                {
                    id: "002",
                    name: "云计算测试02",
                    photoUrl: "https://images.pexels.com/photos/11278221/pexels-photo-11278221.jpeg?auto=compress&cs=tinysrgb&w=800&lazy=load",
                    detail: "什么什么人",
                },
                {
                    id: "002",
                    name: "云计算测试02",
                    photoUrl: "https://images.pexels.com/photos/11278221/pexels-photo-11278221.jpeg?auto=compress&cs=tinysrgb&w=800&lazy=load",
                    detail: "什么什么人",
                },
                {
                    id: "002",
                    name: "云计算测试02",
                    photoUrl: "https://images.pexels.com/photos/11278221/pexels-photo-11278221.jpeg?auto=compress&cs=tinysrgb&w=800&lazy=load",
                    detail: "什么什么人",
                },
                {
                    id: "002",
                    name: "云计算测试02",
                    photoUrl: "https://images.pexels.com/photos/11278221/pexels-photo-11278221.jpeg?auto=compress&cs=tinysrgb&w=800&lazy=load",
                    detail: "什么什么人",
                },
                {
                    id: "002",
                    name: "云计算测试02",
                    photoUrl: "https://images.pexels.com/photos/11278221/pexels-photo-11278221.jpeg?auto=compress&cs=tinysrgb&w=800&lazy=load",
                    detail: "什么什么人",
                },
                {
                    id: "002",
                    name: "云计算测试02",
                    photoUrl: "https://images.pexels.com/photos/11278221/pexels-photo-11278221.jpeg?auto=compress&cs=tinysrgb&w=800&lazy=load",
                    detail: "什么什么人",
                },
                {
                    id: "003",
                    name: "云计算测试03",
                    photoUrl: "https://images.pexels.com/photos/11278221/pexels-photo-11278221.jpeg?auto=compress&cs=tinysrgb&w=800&lazy=load",
                    detail: "什么什么人",
                }
            ])
        }
        if(route.query.type == "bioinformatic"){
            Object.assign(teacherInfoList, [
                {
                    id: "001",
                    name: "生信测试01",
                    photoUrl: "https://images.pexels.com/photos/11278221/pexels-photo-11278221.jpeg?auto=compress&cs=tinysrgb&w=800&lazy=load",
                    detail: "什么什么人",
                },
                {
                    id: "002",
                    name: "生信测试02",
                    photoUrl: "https://images.pexels.com/photos/11278221/pexels-photo-11278221.jpeg?auto=compress&cs=tinysrgb&w=800&lazy=load",
                    detail: "什么什么人",
                },
                {
                    id: "003",
                    name: "生信测试03",
                    photoUrl: "https://images.pexels.com/photos/11278221/pexels-photo-11278221.jpeg?auto=compress&cs=tinysrgb&w=800&lazy=load",
                    detail: "什么什么人",
                }
            ])
            Object.assign(studentInfoList, [
                {
                    id: "001",
                    name: "云计算测试01",
                    photoUrl: "https://images.pexels.com/photos/11278221/pexels-photo-11278221.jpeg?auto=compress&cs=tinysrgb&w=800&lazy=load",
                    detail: "什么什么人",
                },
                {
                    id: "002",
                    name: "云计算测试02",
                    photoUrl: "https://images.pexels.com/photos/11278221/pexels-photo-11278221.jpeg?auto=compress&cs=tinysrgb&w=800&lazy=load",
                    detail: "什么什么人",
                },
                {
                    id: "002",
                    name: "云计算测试02",
                    photoUrl: "https://images.pexels.com/photos/11278221/pexels-photo-11278221.jpeg?auto=compress&cs=tinysrgb&w=800&lazy=load",
                    detail: "什么什么人",
                },
                {
                    id: "002",
                    name: "云计算测试02",
                    photoUrl: "https://images.pexels.com/photos/11278221/pexels-photo-11278221.jpeg?auto=compress&cs=tinysrgb&w=800&lazy=load",
                    detail: "什么什么人",
                },
                {
                    id: "002",
                    name: "云计算测试02",
                    photoUrl: "https://images.pexels.com/photos/11278221/pexels-photo-11278221.jpeg?auto=compress&cs=tinysrgb&w=800&lazy=load",
                    detail: "什么什么人",
                },
                {
                    id: "002",
                    name: "云计算测试02",
                    photoUrl: "https://images.pexels.com/photos/11278221/pexels-photo-11278221.jpeg?auto=compress&cs=tinysrgb&w=800&lazy=load",
                    detail: "什么什么人",
                },
                {
                    id: "002",
                    name: "云计算测试02",
                    photoUrl: "https://images.pexels.com/photos/11278221/pexels-photo-11278221.jpeg?auto=compress&cs=tinysrgb&w=800&lazy=load",
                    detail: "什么什么人",
                },
                {
                    id: "003",
                    name: "云计算测试03",
                    photoUrl: "https://images.pexels.com/photos/11278221/pexels-photo-11278221.jpeg?auto=compress&cs=tinysrgb&w=800&lazy=load",
                    detail: "什么什么人",
                }
            ])
        }
        if(route.query.type == "petroleumsoftware"){
            Object.assign(teacherInfoList, [
                {
                    id: "001",
                    name: "石油工业软件测试01",
                    photoUrl: "https://images.pexels.com/photos/11278221/pexels-photo-11278221.jpeg?auto=compress&cs=tinysrgb&w=800&lazy=load",
                    detail: "什么什么人",
                },
                {
                    id: "002",
                    name: "石油工业软件测试02",
                    photoUrl: "https://images.pexels.com/photos/11278221/pexels-photo-11278221.jpeg?auto=compress&cs=tinysrgb&w=800&lazy=load",
                    detail: "什么什么人",
                },
                {
                    id: "003",
                    name: "石油工业软件测试03",
                    photoUrl: "https://images.pexels.com/photos/11278221/pexels-photo-11278221.jpeg?auto=compress&cs=tinysrgb&w=800&lazy=load",
                    detail: "什么什么人",
                }
            ])
            Object.assign(studentInfoList, [
                {
                    id: "001",
                    name: "云计算测试01",
                    photoUrl: "https://images.pexels.com/photos/11278221/pexels-photo-11278221.jpeg?auto=compress&cs=tinysrgb&w=800&lazy=load",
                    detail: "什么什么人",
                },
                {
                    id: "002",
                    name: "云计算测试02",
                    photoUrl: "https://images.pexels.com/photos/11278221/pexels-photo-11278221.jpeg?auto=compress&cs=tinysrgb&w=800&lazy=load",
                    detail: "什么什么人",
                },
                {
                    id: "002",
                    name: "云计算测试02",
                    photoUrl: "https://images.pexels.com/photos/11278221/pexels-photo-11278221.jpeg?auto=compress&cs=tinysrgb&w=800&lazy=load",
                    detail: "什么什么人",
                },
                {
                    id: "002",
                    name: "云计算测试02",
                    photoUrl: "https://images.pexels.com/photos/11278221/pexels-photo-11278221.jpeg?auto=compress&cs=tinysrgb&w=800&lazy=load",
                    detail: "什么什么人",
                },
                {
                    id: "002",
                    name: "云计算测试02",
                    photoUrl: "https://images.pexels.com/photos/11278221/pexels-photo-11278221.jpeg?auto=compress&cs=tinysrgb&w=800&lazy=load",
                    detail: "什么什么人",
                },
                {
                    id: "002",
                    name: "云计算测试02",
                    photoUrl: "https://images.pexels.com/photos/11278221/pexels-photo-11278221.jpeg?auto=compress&cs=tinysrgb&w=800&lazy=load",
                    detail: "什么什么人",
                },
                {
                    id: "002",
                    name: "云计算测试02",
                    photoUrl: "https://images.pexels.com/photos/11278221/pexels-photo-11278221.jpeg?auto=compress&cs=tinysrgb&w=800&lazy=load",
                    detail: "什么什么人",
                },
                {
                    id: "003",
                    name: "云计算测试03",
                    photoUrl: "https://images.pexels.com/photos/11278221/pexels-photo-11278221.jpeg?auto=compress&cs=tinysrgb&w=800&lazy=load",
                    detail: "什么什么人",
                }
            ])
        }
    })

</script>

<style scoped>
.group-card{
    width:200px;
    margin: 0 auto;
    .bottom {
        margin-top: 13px;
        line-height: 12px;
        display: flex;
        justify-content: space-between;
        align-items: center;
        font-size: 15px;
        color: #999;
    }
}
.group-image {
    height: 250px;
    width:100%;
    margin: 0 auto;
}
.image-slot {
    display: flex;
    justify-content: center;
    align-items: center;
    width: 100%;
    height: 100%;
    background: var(--el-fill-color-light);
    color: var(--el-text-color-secondary);
    font-size: 30px;
    .el-icon {
    font-size: 30px;
    }
}
.groupInfo {
    width: 80%;
    margin: 50px auto;
    .groupCol {
        margin: 40px 0;
    }
}
.group-title-text {
    font-size: 45px;
}
</style>