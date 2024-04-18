<template>
    <div class="footer">
      <div class="footer-content">
        <div class="footer-main">
          <div class="logo">
            <n-link to="/">
              <img src="/logo.png" alt="Logo" style="width: 350px;">
            </n-link>
          </div>
          <p>庞善臣教授带领的人工智能理论与应用创新研<br>究团队</p>
          <div>
            <ul style="list-style-type: none;margin-left: 0;padding-left: 0;">
              <li style="margin-top: 10px;margin-bottom: 10px;"><span>Add: </span> <el-link :underline="false" target="_blank" class="footer-main-link">rengongzhineng123</el-link></li>
              <li style="margin-top: 10px;margin-bottom: 10px;"><span>Call: </span><el-link :underline="false" target="_blank" class="footer-main-link">0532 1234567</el-link></li>
              <li style="margin-top: 10px;margin-bottom: 10px;"><span>Email: </span><el-link :underline="false" target="_blank" class="footer-main-link">info@outlook.com</el-link></li>
            </ul>
          </div>
        </div>
        <div class="footer-main">
          <h4>教育链接</h4>
          <div v-for="link in linkList1" :key="link.id">
            <el-link :underline="false" :href="link.url" target="_blank" class="footer-main-link">{{ link.title
              }}</el-link>
          </div>
        </div>
        <div class="footer-main">
          <h4>其他链接</h4>
          <div v-for="link in linkList2" :key="link.id">
            <el-link :underline="false" :href="link.url" target="_blank" class="footer-main-link">{{ link.title
              }}</el-link>
          </div>
        </div>
      </div>
  
    </div>
  
  </template>
  
  <script setup lang="ts" name="BaseFooter">
  import { ref, reactive, toRefs, onBeforeMount, onMounted, watchEffect, computed } from 'vue';
  
  let linkList1 = ref([
    {
      id: "qwerqwerqwer01",
      url: "https://www.upc.edu.cn/",
      title: "学校官网"
    },
    {
      id: "学院官网",
      url: "https://computer.upc.edu.cn/",
      title: "学院官网"
    },
  ]);
  let linkList2 = ref([
    {
      id: "qwerqwerqwer03",
      url: "https://github.com/",
      title: "Github"
    },
    {
      id: "qwerqwerqwer04",
      url: "https://www.modelscope.cn/",
      title: "阿里魔搭社区"
    },
    {
      id: "qwerqwerqwer05",
      url: "https://ai-studio-static-online.cdn.bcebos.com/aistudio/index",
      title: "飞桨AI studio"
    }
  ])
  
  </script>
  
  <style scoped>
  .footer {
    background-color: #f5f7fa;
    /* padding: 42px 64px 64px; */
    padding: 42px 128px;
    box-sizing: border-box;
    display: block;
    width: 100%;
  
    .footer-content {
      display: flex;
      margin: 0 auto;
  
      .footer-main {
        display: inline-block;
        vertical-align: top;
        margin-right: 130px;
  
        h4 {
          font-size: 20px;
        }
  
        .footer-main-link {
          margin: 5px 0;
        }
      }
    }
  
  }
  </style>

<!-- 
原来内容    
<template>
  <div class="footer">
    <div class="footer-content">
      <div class="footer-main" >
        <h4>链接</h4>
        <div v-for="link in linkList" :key="link.id">
          <el-link :underline="false" :href="link.url" target="_blank" class="footer-main-link">{{ link.title }}</el-link>
        </div>
      </div>
      <div class="footer-main">
        <h4>其他链接</h4>
      </div>
    </div>
  </div>
  
</template>

<script setup lang="ts" name="BaseFooter">
  import { ref, reactive, toRefs, onBeforeMount, onMounted, watchEffect, computed } from 'vue';

  let linkList = ref([
        {id:1, title: "关于我们", url: "/about" },
        {id:2, title: "服务条款", url: "/terms" },
        {id:3, title: "隐私政策", url: "/privacy" },
        // 更多链接...
      ])


</script>

<style scoped>
.footer {
  background-color: #f5f7fa;
  /* padding: 42px 64px 64px; */
  padding: 42px 128px;
  box-sizing: border-box;
  display: block;
  width: 100%;
  .footer-content {
    display: flex;
    margin: 0 auto;
    .footer-main {
      display: inline-block;
      vertical-align: top;
      margin-right: 130px;
      h4 {
        font-size: 20px;
      }
      .footer-main-link {
        margin: 5px 0;
      }
    }
  }

}

</style> -->