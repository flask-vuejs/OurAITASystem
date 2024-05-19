<template>
  <div class="datasets-container">
    <h2>数据集</h2>
    <ul v-if="dataList.length > 0" class="data-list">
      <li v-for="data in dataList" :key="data.data_id" class="data-item">
        <div class="data-header">
          <h3>{{ data.data_title }}</h3>
          <span class="data-date">{{ data.data_date }}</span>
        </div>
        <p class="data-content">{{ data.data_content }}</p>
        <div class="data-footer">
          <span class="data-author">作者: {{ data.data_author }}</span>
          <span class="data-read-count">阅读量: {{ data.data_read_count }}</span>
          <a :href="data.data_link" target="_blank" class="data-link">阅读更多</a>
        </div>
        <img v-if="data.data_image_url" :src="data.data_image_url" alt="data image" class="data-image">
        <!-- 添加更多需要展示的属性... -->
      </li>
    </ul>
    <p v-else class="no-data-message">暂无数据集数据</p>
  </div>
</template>

<script setup lang="ts" name="Datasets">
import { ref, reactive, toRefs, onBeforeMount, onMounted, watchEffect } from 'vue';
import { useRoute, useRouter } from 'vue-router';
import axios from 'axios';

interface Data {
  data_id: number;
  data_title: string;
  data_content: string;
  data_date: string;
  data_author: string;
  data_link: string;
  data_read_count: number;
  data_image_url: string;
  label_id: number;
}

let dataList = ref<Data[]>([]);

const route = useRoute();
const typeParam = route.query.type as string;

console.log('Type 参数值:', typeParam);

onMounted(() => {
  axios.get('http://127.0.0.1:5000/datasets', {
    params: {
      type: typeParam
    }
  })
  .then((response) => {
    if (response.data) {
      dataList.value = response.data;
    } else {
      console.error('Failed to fetch data data.');
    }
  })
  .catch((error) => {
    console.error('An error occurred while fetching data:', error);
  });
});

</script>

<style scoped lang="less">
.datasets-container {
  padding: 20px;
  font-family: Arial, sans-serif;

  h2 {
    text-align: center;
    margin-bottom: 20px;
    color: #333;
  }

  .data-list {
    list-style: none;
    padding: 0;

    .data-item {
      border: 1px solid #ddd;
      border-radius: 8px;
      padding: 15px;
      margin-bottom: 15px;
      background-color: #f9f9f9;
      
      .data-header {
        display: flex;
        justify-content: space-between;
        align-items: center;

        h3 {
          margin: 0;
          font-size: 1.2em;
          color: #007BFF;
        }

        .data-date {
          font-size: 0.9em;
          color: #999;
        }
      }

      .data-content {
        margin: 10px 0;
        line-height: 1.6;
      }

      .data-footer {
        display: flex;
        justify-content: space-between;
        align-items: center;

        .data-author, .data-read-count {
          font-size: 0.9em;
          color: #666;
        }

        .data-link {
          text-decoration: none;
          color: #007BFF;
          font-weight: bold;

          &:hover {
            text-decoration: underline;
          }
        }
      }

      .data-image {
        margin-top: 10px;
        max-width: 100%;
        border-radius: 8px;
      }
    }
  }

  .no-data-message {
    text-align: center;
    font-size: 1.1em;
    color: #999;
  }
}
</style>
