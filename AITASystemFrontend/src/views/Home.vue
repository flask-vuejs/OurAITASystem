<template>
  <div class="main-page">
    <NoticeBar class="notice-bar" :text="noticeInfo"/>
    <!-- <br> -->
    <el-row :gutter="20">
      <el-col :span="16">
        <el-card class="message-card">
          <template #header>
            <div class="message-card-header">
              <span>AITA动态</span>
              <!-- <el-button class="message-card-button" text>更多</el-button> -->
              <el-link href="/news">更多</el-link>
            </div>
          </template>
          <div class="message-card-content-box">
            <ul class="message-card-content-ul">
              <li v-for="news in newsList" :key="news.id" class="message-card-content-li">
                <a :href="news.link" target="_block" class="message-card-content-a">{{ news.title }}</a>
              </li>
            </ul>
          </div>
        </el-card>
      </el-col>
      <el-col :span="8">
        <el-card class="message-card">
          <template #header>
            <div class="message-card-header">
              <span>获取奖项</span>
              <!-- <el-button class="message-card-button" text>更多</el-button> -->
              <el-link href="/news">更多</el-link>
            </div>
          </template>
          <div class="message-card-content-box">
            <ul class="message-card-content-ul">
              <li v-for="award in awardList" :key="award.id" class="message-card-content-li">
                <a :href="award.link" target="_block" class="message-card-content-a">{{ award.title }}</a>
              </li>
            </ul>
          </div>
        </el-card>
      </el-col>
    </el-row>
    <el-card class="paper-scroll-card">
      <template #header>
        <div class="message-card-header">
          <span>论文展示</span>
          <el-link href="/papers">更多</el-link>
        </div>
      </template>
      <vue3-seamless-scroll :list="imageList" class="paper-scroll" direction="left" hover>
      <div class="paper-scroll-item" >
        <div v-for="image in imageList" :key="image.id">
          <a :href="image.url"><img :src="image.imageUrl" alt="Paper Image" :title="image.title"/></a>
        </div>
      </div>
    </vue3-seamless-scroll>
    </el-card>
  </div>
</template>

<script setup lang="ts" name="Home">
  import { ref, reactive, toRefs, onBeforeMount, onMounted, watchEffect, computed } from 'vue';
  import { useRoute, useRouter } from 'vue-router';
  import {Vue3SeamlessScroll} from "vue3-seamless-scroll";

  let newsList = ref([
    {
      id: "asdfasd01",
      title: "测试动态 01",
      date: "2024-01-01",
      link: "testNews/001"
    },
    {
      id: "asdfasd02",
      title: "测试动态 02",
      date: "2024-01-01",
      link: "testNews/002"
    },
    {
      id: "asdfasd03",
      title: "测试动态 03",
      date: "2024-01-01",
      link: "testNews/003"
    },
    {
      id: "asdfasd04",
      title: "测试动态 04",
      date: "2024-01-01",
      link: "testNews/004"
    },
    {
      id: "asdfasd05",
      title: "测试动态 05",
      date: "2024-01-01",
      link: "testNews/005"
    },
  ])

  let awardList = ref([
    {
      id: "asdassdfasd01",
      title: "测试奖项 01",
      date: "2024-01-01",
      link: "testAward/001"
    },
    {
      id: "asdassdfasd02",
      title: "测试奖项 02",
      date: "2024-01-01",
      link: "testAward/002"
    },
    {
      id: "asdassdfasd03",
      title: "测试奖项 03",
      date: "2024-01-01",
      link: "testAward/003"
    },
    {
      id: "asdassdfasd04",
      title: "测试奖项 04",
      date: "2024-01-01",
      link: "testAward/004"
    },
    {
      id: "asdassdfasd05",
      title: "测试奖项 05",
      date: "2024-01-01",
      link: "testAward/005"
    },
  ])

  let noticeInfo = ref("测试通知！！测试通知！！测试通知！！测试通知！！测试通知！！测试通知！！测试通知！！测试通知！！测试通知！！测试通知！！测试通知！！测试通知！！测试通知！！测试通知！！测试通知！！测试通知！！测试通知！！")

  let imageList = ref([
    {
      id: "qwerqwer01",
      url: "xxx",
      imageUrl: "https://images.pexels.com/photos/11278221/pexels-photo-11278221.jpeg?auto=compress&cs=tinysrgb&w=800&lazy=load",
      title: "Paper01"
    },
    {
      id: "qwerqwer02",
      url: "xxx",
      imageUrl: "https://images.pexels.com/photos/18965344/pexels-photo-18965344.jpeg?auto=compress&cs=tinysrgb&w=800&lazy=load",
      title: "Paper02"
    },
    {
      id: "qwerqwer03",
      url: "xxx",
      imageUrl: "https://images.pexels.com/photos/20224149/pexels-photo-20224149.jpeg?auto=compress&cs=tinysrgb&w=800&lazy=load",
      title: "Paper03"
    },
    {
      id: "qwerqwer04",
      url: "xxx",
      imageUrl: "https://images.pexels.com/photos/10317493/pexels-photo-10317493.jpeg?auto=compress&cs=tinysrgb&w=800&lazy=load",
      title: "Paper04"
    },
  ])

  

</script>

<style scoped>
.message-card-header {
  display: flex;
  justify-content: space-between;
  align-items: center;
}
.message-card-content-box {
  height: 130px;
  overflow: hidden;
  .message-card-content-ul {
    list-style: none;
    .message-card-content-li {
      font-size: 13px;
      padding-bottom: 10px;
      .message-card-content-a {
        display: inline-block;
        @include text-ellipsis(1);
        color: var(--el-text-color-secondary);
        text-decoration: none;
      }
      & a:hover {
        color: var(--el-color-primary);
        cursor: pointer;
      }
    }
  }
}
.paper-scroll {
  /* height: 270px;
  width: 500px; */
  width: 100%;
  height: 200px;
  margin: 10px auto;
  overflow: hidden;
}
.paper-scroll-item {
  display: flex;
  img {
  width: 200px;
  height: 200px;
  margin: 0 10px;
  }
}
.paper-scroll-card {
  margin: 50px 0;
}


</style>