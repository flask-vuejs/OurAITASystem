<template>
  <div class="project-list">
    <div class="project-item" v-for="(item, index) in projects" :key="index">
      <div class="project-content">
        <i :class="item.icon"></i>
        <div>
          <h3 class="project-title">{{ item.name }}</h3>
          <p class="project-description">{{ item.description }}</p>
        </div>
      </div>
      <div class="project-stats">
        <span><i class="fas fa-users"></i> {{ item.teamSize }} Team Members</span>
        <span><i class="fas fa-calendar-alt"></i> Started: {{ item.startDate }}</span>
        <span><i class="fas fa-thermometer-half"></i> Status: {{ item.status }}</span>
      </div>
    </div>
  </div>
</template>

<script setup lang="ts" name="">
import { ref, reactive, toRefs, onBeforeMount, onMounted, watchEffect, computed } from 'vue';
import { useRoute, useRouter } from 'vue-router';
const projects = reactive([
  { name: 'Ultimate Design Project', description: 'A commitment to innovative design.', teamSize: 15, startDate: '2021-06-15', status: 'Active', icon: 'fas fa-palette' },
  { name: 'Next-Gen AI Initiative', description: 'Advancing AI technology for future needs.', teamSize: 22, startDate: '2022-01-07', status: 'In Progress', icon: 'fas fa-robot' },
  { name: 'Eco-Friendly Agriculture', description: 'Sustainable farming practices.', teamSize: 8, startDate: '2022-05-20', status: 'Completed', icon: 'fas fa-seedling' },
  { name: 'Blockchain Logistics', description: 'Enhancing logistics with blockchain.', teamSize: 10, startDate: '2023-03-12', status: 'Planned', icon: 'fas fa-link' },
]);
/**
* 路由对象
*/
const route = useRoute();
/**
* 路由实例
*/
const router = useRouter();
//console.log('1-开始创建组件-setup')
/**
* 数据部分
*/
const data = reactive({})
onBeforeMount(() => {
  //console.log('2.组件挂载页面之前执行----onBeforeMount')
})
onMounted(() => {
  console.log('Enhanced component with detailed project stats and animations mounted.');
});
watchEffect(()=>{
})
// 使用toRefs解构
// let { } = { ...toRefs(data) } 
defineExpose({
  ...toRefs(data)
})

</script>


<style scoped lang="less">
.project-list {
  display: flex;
  flex-direction: column;
  align-items: center;
  padding: 30px;
  background: #f9f9f9;
}

.project-item {
  width: 95%;
  padding: 25px;
  margin: 15px 0;
  background: #ffffff;
  border-radius: 12px;
  border: 2px solid #e0e0e0;
  box-shadow: 0 4px 10px rgba(100,100,100,0.1);
  transition: all 0.35s cubic-bezier(.25,.8,.25,1);
  color: #333;
  cursor: pointer;
  
  &:hover {
    transform: translateY(-5px);
    border-color: #5c67f2;
    box-shadow: 0 6px 20px rgba(92,103,242,0.25);
  }
}

.project-content {
  display: flex;
  align-items: center;
  margin-bottom: 12px;

  .project-title {
    font-size: 1.6rem;
    color: #5c67f2;
    margin: 0;
  }

  .project-description {
    margin: 8px 0 0;
    font-size: 0.9rem;
    color: #555;
    opacity: 0.9;
  }
}

.project-stats {
  display: flex;
  justify-content: space-around;
  font-size: 0.9rem;
  color: #444;
}

.project-icon {
  font-size: 32px;
  color: #5c67f2;
  margin-right: 20px;

  animation: bounce 2s infinite ease-in-out;
}

@keyframes bounce {
  0%, 20%, 50%, 80%, 100% {
    transform: translateY(0);
  }
  40% {
    transform: translateY(-30px);
  }
  60% {
    transform: translateY(-15px);
  }
}
</style>