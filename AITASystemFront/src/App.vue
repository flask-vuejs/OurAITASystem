<template>
  <el-container>
    <el-header>
      <BaseHeader/>
    </el-header>
    <el-main>
      <RouterView></RouterView>
    </el-main>
    <el-footer>
      <BaseFooter/>
    </el-footer>
  </el-container>
</template>

<script setup lang="ts">
  import { RouterLink, RouterView } from 'vue-router'


</script>

<style scoped>

</style>
