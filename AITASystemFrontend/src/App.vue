<template>
  <el-container>
    <el-header height="100px">
      <BaseHeader/>
    </el-header>
    <el-main >
      <RouterView></RouterView>
    </el-main>
    <el-footer >
      <BaseFooter/>
    </el-footer>
  </el-container>
</template>

<script setup lang="ts">
  import { RouterLink, RouterView } from 'vue-router'
  import BaseFooter from './components/layouts/BaseFooter.vue';

</script>

<style scoped>

</style>
