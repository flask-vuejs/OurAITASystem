<template>
  <div class="software">
    <h2 class="software-title">{{ viewType }}</h2>
    <hr/>
    <div class="software-main">
        <el-carousel class="software-main-carousel" :interval="4000" type="card">
            <el-carousel-item v-for="modelType in modelTypeList" :key="modelType.id">
                <a :href="modelType.url">
                    <div class="software-main-image-container">
                        <el-image class="software-main-image" :src="modelType.imageUrl" fit="cover">
                            <template #placeholder>
                                <div class="image-slot">Loading<span class="dot">...</span></div>
                            </template>
                            <template #error>
                                <div class="image-slot">
                                    <el-icon><Picture /></el-icon>
                                </div>
                            </template>
                        </el-image>
                        <div class="software-main-image-text-container">
                            <!-- <el-text class="software-main-image-text">{{ modelType.name }}</el-text> -->
                            <span class="software-main-image-text">{{ modelType.name }}</span>
                        </div>
                    </div>
                </a>
            </el-carousel-item>
        </el-carousel>
    </div>
  </div>
</template>

<script setup lang="ts" name="">
import { ref, reactive, toRefs, onBeforeMount, onMounted, watchEffect, computed } from 'vue';
import { useRoute, useRouter } from 'vue-router';
/**
* 路由对象
*/
const route = useRoute();

let viewType = ref("");

let modelTypeList = reactive([
    {
        id: "asdfgggasd01",
        name: "分类",
        imageUrl: "https://pic2.zhimg.com/80/v2-3cd4af739e6c9f7c06aec414a4852d85_1440w.webp",    // 展示图片 url
        url: "/model?type=classification"          // 点击跳转 url
    },
    {
        id: "asdfgggasd02",
        name: "分割",
        imageUrl: "https://pic2.zhimg.com/80/v2-3cd4af739e6c9f7c06aec414a4852d85_1440w.webp",    // 展示图片 url
        url: "/model?type=segmentation"          // 点击跳转 url
    },
    {
        id: "asdfgggasd03",
        name: "检测",
        imageUrl: "https://pic2.zhimg.com/80/v2-3cd4af739e6c9f7c06aec414a4852d85_1440w.webp",    // 展示图片 url
        url: "/model?type=detection"          // 点击跳转 url
    },
    {
        id: "asdfgggasd04",
        name: "检测",
        imageUrl: "https://pic2.zhimg.com/80/v2-3cd4af739e6c9f7c06aec414a4852d85_1440w.webp",    // 展示图片 url
        url: "/model?type=detection"          // 点击跳转 url
    },
    {
        id: "asdfgggasd05",
        name: "检测",
        imageUrl: "https://pic2.zhimg.com/80/v2-3cd4af739e6c9f7c06aec414a4852d85_1440w.webp",    // 展示图片 url
        url: "/model?type=detection"          // 点击跳转 url
    },
    {
        id: "asdfgggasd06",
        name: "检测",
        imageUrl: "https://pic2.zhimg.com/80/v2-3cd4af739e6c9f7c06aec414a4852d85_1440w.webp",    // 展示图片 url
        url: "/model?type=detection"          // 点击跳转 url
    },
])

watchEffect(()=>{
    if(route.query.type === "medicalimage"){
        viewType.value = "医学图像";
    }
    if(route.query.type === "multiomicsanalysis"){
        viewType.value = "多组学分析";
    }if(route.query.type === "correlationprediction"){
        viewType.value = "关联预测";
    }
})

</script>

<style scoped>
.software-main-image-container{
    position: relative;
    .software-main-image {
        height: 100%;
        width: 100%;
    }
    .software-main-image-text-container {
        position: absolute;
        top: 0;
        left: 0;
        right: 0;
        bottom: 0;
        height: 100%;
        width: 100%;
        opacity: 0.5;
        background-color:#9f9f9f;
    }
    .software-main-image-text {
        position:absolute;
        top:50%;
        left:50%;
        transform:translate(-50%,-50%);
        /* 绝对定位设置偏移量，将元素居中定位 */
        color:white;
        font-size:20px;
        font-weight:bold;
        font-size:30px;
    }
}
.software-title {
    text-align: center;
    font-size: 35px;
    color: #606266;
}
.software-main-carousel{
    width: 80%;
    margin: 100px auto;
}
</style>