<template>
  <div class="papers">
    <h2>{{ "论文界面" }}</h2>
    <!-- 文章标题 -->
    <el-form-item label="文章标题">
      <el-input v-model="title" placeholder="请输入文章标题"></el-input>
    </el-form-item>

    <!-- 文章作者 -->
    <el-form-item label="文章作者">
      <el-input v-model="author" placeholder="请输入文章作者"></el-input>
    </el-form-item>

    <!-- 文章内容 -->
    <!-- <el-form-item label="文章内容">
      <el-input type="textarea" v-model="content" placeholder="请输入文章内容"></el-input>
    </el-form-item> -->
    <!-- <md-editor v-model="text" /> -->
  </div>
  <div style="border: 1px solid #ccc">
      <Toolbar
        style="border-bottom: 1px solid #ccc"
        :editor="editorRef"
        :defaultConfig="toolbarConfig"
        :mode="mode"
      />
      <Editor
        style="height: 500px; overflow-y: hidden;"
        v-model="valueHtml"
        :defaultConfig="editorConfig"
        :mode="mode"
        @onCreated="handleCreated"
      />
    </div>
    <button type="button" @click="submitData">提交</button>
</template>

<script setup lang="ts" name="">
import { onBeforeUnmount,shallowRef,ref, reactive, toRefs, onBeforeMount, onMounted, watchEffect, computed } from 'vue';
import { useRoute, useRouter } from 'vue-router';
import { defineComponent } from 'vue';
import axios from 'axios';
// import MdEditor from 'md-editor-v3';
// import 'md-editor-v3/lib/style.css';
import '@wangeditor/editor/dist/css/style.css' // 引入 css
import { Editor, Toolbar } from '@wangeditor/editor-for-vue'

const title = ref('');
const author = ref('');
// const content = ref('');


// 编辑器实例，必须用 shallowRef
const editorRef = shallowRef();
// 内容 HTML
const valueHtml = ref('<p>hello</p>');
// 编辑器的模式
const mode = 'default';   // or 'simple'
// 模拟 AJAX 异步获取内容
onMounted(() => {
  setTimeout(() => {
    valueHtml.value = '<p>模拟 Ajax 异步设置内容</p>';
  }, 1500);
});
const toolbarConfig = {};
const editorConfig = { placeholder: '请输入内容...' };
// 组件销毁时，也及时销毁编辑器
onBeforeUnmount(() => {
  const editor = editorRef.value;
  if (editor == null) return;
  editor.destroy();
});
// 处理 created 事件
const handleCreated = (editor:any) => {
  editorRef.value = editor; // 记录 editor 实例，重要！
};

// 封装提交数据的方法
async function submitData() {
  const formData = {
    title: title.value,
    author: author.value,
    // content: content.value,
    // 如果需要发送富文本编辑器的内容，可以添加如下一行：
    htmlContent: valueHtml.value,
  };
  try {
    const response = await axios.request({
      url: 'http://127.0.0.1:5000/Papers/public',
      method: 'POST',
      data: formData,
    });
    console.log(formData)
    // 处理成功响应，如显示提示信息、更新状态等
    console.log('Data submitted successfully:', response.data);
  } catch (error:any) {
    // 处理请求错误，如显示错误消息、重试等
    console.error('Error submitting data:', error.response.data);
  }
}
// 将 submitData 方法暴露给模板，以便触发提交操作
// defineExpose({ submitData });
</script>



<style scoped lang='less'>
.el-menu-vertical-demo{
  width:200px;
}
.papers{
  margin: 0 20px;
  // padding: 20px;
  // border: 1px solid #ccc;
}
</style>

<!-- const activeIndex=ref('1')
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
  //console.log('3.-组件挂载到页面之后执行-------onMounted')
})
watchEffect(()=>{
})
// 使用toRefs解构
// let { } = { ...toRefs(data) } 
defineExpose({
  ...toRefs(data)
}) -->

