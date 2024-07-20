<template>
  <div class="group">
    <el-text class="group-title-text" size="large">教师队伍</el-text>
    <hr/>
    <el-row class="groupInfo">
        <el-col class="groupCol" v-for="teacher in teachers" :key="teacher.group_id" :span="8">
            <el-card class="group-card" :body-style="{ padding: '0px' }" @click="toDetail(teacher)">
                <el-image class="group-image" :src="formatImageUrl(teacher.group_person_image_url)" fit="cover">
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
                    <span>{{ teacher.group_person_name }}</span>
                    <div class="bottom">
                        <span>{{ teacher.group_person_description }}</span>
                    </div>
                </div>
            </el-card>
        </el-col>
    </el-row>
    <el-text class="group-title-text" size="large">学生队伍</el-text>
    <hr/>
    <el-row class="groupInfo">
        <el-col class="groupCol" v-for="student in students" :key="student.group_id" :span="8">
            <el-card class="group-card" :body-style="{ padding: '0px' }" @click="toDetail(student)" >
                <el-image class="group-image" :src="formatImageUrl(student.group_person_image_url)" fit="cover">
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
                    <span>{{ student.group_person_name }}</span>
                    <div class="bottom">
                        <span>{{ student.group_person_description }}</span>
                    </div>
                </div>
            </el-card>
        </el-col>
    </el-row>
  </div>
</template>

<script setup lang="ts" name="">
import { ElFormItem } from 'element-plus';
import { ref, reactive, toRefs, onBeforeMount, onMounted, watchEffect, computed } from 'vue';
import { useRoute, useRouter } from 'vue-router';
import { formatImageUrl } from '@/utils/ImgNorm'
import VueAxios from 'vue-axios';
import axios from 'axios'; 
import type {GroupData} from '../utils/type'

// 分别创建ref来存储教师和学生数据
let teachers = ref<GroupData[]>([]);
let students = ref<GroupData[]>([]);
// 跳转到详情页
const router = useRouter();
const toDetail = (group:GroupData) => {
  router.push({ 
    path: "/groupdetail", 
    query: { id: group.group_id } 
  });
  //router.push({ path: '/groupdetail'})
};


async function fetchGroupData() {
  try {
    const response = await axios.get<GroupData[]>('http://127.0.0.1:5000/datasets/query/group',{
        params: {
          group_type: route.query.type,
        },
    });
    separateGroups(response.data);
  } catch (error) {
    console.error('Failed to fetch group data:', error);
  }
}
// 当获取到原始的groups数据后，进行分组
function separateGroups(data: GroupData[]) {
  teachers.value = data.filter(group => group.group_role == 'teacher');
  students.value = data.filter(group => group.group_role == 'student');
}
onMounted(fetchGroupData);

/**
* 路由对象
*/
const route = useRoute();
// useRoute没有参数，返回一个包含当前路由信息的对象，
// 如路径（path）、查询参数（query）、参数（params）等
let {query} = toRefs(route)
// 将route对象中的query属性转换为一个响应式引用（ref），
// 并将其赋值给一个新的变量query

// 使用watchEffect监听route.query.type的变化
watchEffect(() => {
  fetchGroupData(); // 直接调用已定义的fetchGroupData函数
});

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