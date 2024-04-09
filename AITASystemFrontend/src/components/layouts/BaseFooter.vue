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

</style>