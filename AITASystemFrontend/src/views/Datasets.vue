<template>
<div class="body bg-light py-2">
  <div class="container my-5 main">
      <div class="row">
         <div class="col-1"></div>
         <div class="col-10">
            <h4 class="title">{{ data_type }}数据集</h4>
            <ul class="item_list">
              <li class="item" v-for="data in dataList" :key="data.data_id">
                <div @click="to_detail(data.data_id)">
                  <div class="item_top">
                    <div class="px-3">
                      <i class="bi bi-person-circle"></i>
                      {{ data.data_author }}
                    </div>
                    <div class="px-3">{{ data.data_date }}</div>
                    <div class="px-3">
                      <i class="bi bi-eye"></i>
                      {{ data.data_read_count }}
                    </div>
                  </div>
                  <div class="my-3 px-3 item_middle">
                    <div class="row">
                      <div class="col-9">
                        <h4 class="mb-3 fw-bold">{{ data.data_title }}</h4>
                        <p class="mb-4">{{ truncateText(data.data_abstract as string,20) }}</p>
                        <div class="border rounded p-1 label">{{ data.data_type }}</div>
                      </div>
                      <div class="col-3">
                        <img class="img-fluid text-right img-thumbnail":src="formatImageUrl(data.data_image_url)" width="110px" alt="">
                      </div>
                    </div>
                  </div>
                </div>
              </li>
            </ul>
         </div>
         <div class="col-1"></div>
      </div>
  </div>
</div>
</template>


<script setup lang="ts" name="Datasets">
import { ref, reactive, toRefs, onBeforeMount, onMounted, watchEffect,computed } from 'vue';
import { useRoute, useRouter } from 'vue-router';
import axios from 'axios';
import type {Data} from '../utils/type'
import {Shift} from '../utils/type'
import {formatImageUrl} from '../utils/ImgNorm'
import {truncateText} from '../utils/hooks'

let dataList = ref<Data[]>([]);


// 跳转到详情页
const router = useRouter();
const to_detail = (data_id: number) => {
  router.push({ path: "/dataset_detail", query: { id:data_id } });
};

const route = useRoute();
const data_type=ref('')


async function get_datasets(){
  const typeParam = route.query.type as string;
  data_type.value = Shift(typeParam)
  await axios.get('http://127.0.0.1:5000/datasets', {
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
}

onMounted(() => {
  get_datasets();
});

// 监听query参数type的变化，自动刷新数据
watchEffect(() => {
  get_datasets();
});
</script>

<style scoped>
.body{
  ul{
    list-style: none;
  }
  width:100%;
  height:100%;
  .main{
        font-family: "Microsoft yahei";
        border: 1px solid #e4e4e4;
        background-color: #fff;
        box-shadow: 1px 1px 10px 2px #eee;
        .title {
          padding: 28px 10px 12px;
          border-bottom: 1px solid #e8eaec;
        }
        .item_list{
          .item{
            padding: 28px 16px;
            border-bottom: 1px solid #e8eaec;
            .item_top{
              display: flex;
              align-items: center;
              color: #808695;
              line-height: 21px;
              font-size: 14px;
            }
            .item_middle{
              p{
                color: #808695;
              }
              .label{
                display: inline-block;
                background: #f1f4f9;
              }
            }
          }
          .item:hover{
            background-color:#f2f4f8;
            /* box-shadow:3px 3px 20px 0 #a4b9b4, -3px -3px 20px 0 #a4b9b4; */
            h4{
              color:#2a64f6;
            }
          }  
        }
  }
}
</style>