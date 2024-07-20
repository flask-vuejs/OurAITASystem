
<template>
<div class="body bg-light py-2">
    <div class="container  align-middle my-5 main">
        <div class="row">
            <div class="col-2 siderbar "></div>
            <div class="col-10">
                <h3 class="my-5 text-center head">{{ paper?.title }}</h3>
                <ul class="nav flex-column p-3">
                        <li class="p-2">
                            <div class="row">
                                <div class="col-2 fw-bold">作者：</div>
                                <div class="col-10 word">{{ paper?.author }}</div>
                            </div>
                        </li>
                        <li class="p-2">
                            <div class="row">
                                <div class="col-2 fw-bold">摘要：</div>
                                <div class="col-10 word">{{ paper?.abstract }}</div>
                            </div>
                        </li>
                        <li class="p-2">
                            <div class="row">
                                <div class="col-2 fw-bold">关键词：</div>
                                <div class="col-10 word">{{ paper?.keywords }}</div>
                            </div>
                        </li>
                        <li class="p-2">
                            <div class="row">
                                <div class="col-2 fw-bold">发布时间：</div>
                                <div class="col-10 word">{{ paper?.create_time }}</div>
                            </div>
                        </li>
                </ul>
                <!-- 正文 -->
                <div class="article p-4" v-html="content_html"></div>
            </div>
        </div>
    </div>
</div>

</template>

<script lang="ts" setup>
import MarkdownIt from 'markdown-it'
import {useRoute} from 'vue-router'
import {onBeforeMount, ref,computed} from 'vue'
import axios from 'axios'
import { onMounted } from 'vue';
import type {Papers} from '../../utils/type'
/*
npm config set registry https://registry.npmmirror.com
npm install markdown-it --save
npm install --save @types/markdown-it
*/
const md = new MarkdownIt()
const route = useRoute()
const paper_id=ref('')
onBeforeMount(()=>{
    paper_id.value=route.query.id as string
    console.log(paper_id.value)
})

const paper=ref<Papers>()
const content_html=computed(()=>{
    if(paper.value&&paper.value.content){
        return md.render(paper.value.content)
    }
})

async function getPaper(){
    try{
        const response=await axios.get('http://127.0.0.1:5000/Papers/detail',{
            params:{
                paper_id:paper_id.value
            },
        });
        let result=response.data;
        console.log(result);
        let code=result.code;
        if(code==200){
            paper.value=result.data;
        }
    }catch(error){
        console.error('Error fetching group data:',error);
    }
}
onMounted(()=>{
    getPaper();
})
</script>

<style scoped>
.body{
    width:100%;
    height:100%;
    .main{
        font-family: "Microsoft yahei";
        border: 1px solid #e4e4e4;
        background-color: #fff;
        box-shadow: 1px 1px 10px 2px #eee;
        .siderbar{
            border-right: 1px solid #e6e6e6;
            background-color: #fafafa;
            font-size: 13px;
            color: #666;
        }
        .head{
            font-size: 24px;
            color: #333;
            font-weight: normal;
        }
        .word{
            color:#666;
            font-weight: normal;
        }
        .article{
            margin-top: 30px;
            /* text-align: center; */
            border-top: 1px dashed #a9a9a9;
        }
    }
}
</style>