<style scoped>
*{
    margin: 0;
    padding: 0;
    box-sizing: border-box;
    font-family: 'Poppins', sans-serif;
}
ul li{
    list-style: none;
}
h1 {
    margin: 0.67em 0;
}
h2, h3, h4 {
    font-family: "Microsoft YaHei", "微软雅黑", Arial;
}
.paper-detail{
    position: relative;
    background: #f9f9f9;
    width:100%;
    padding: 0 0 20px;
    /* height: 100%; */
    font-size: 12px;
    .main{
        display: table;
        position: relative;
        width: 96%;
        margin: 0 auto;
        font-family: "Microsoft yahei";
        border: 1px solid #e4e4e4;
        background-color: #fff;
        /* background-color:aqua;
        padding:20px 0; */
        clear: both;
        box-shadow: 1px 1px 10px 2px #eee;
        .sidebar-a {
            position: relative;
            z-index: 9;
            float: left;
            width: 16%;
            font-size: 13px;
            color: #666;
            border-right: 1px solid #e6e6e6;
            background-color: #fafafa;
            h5{
                padding-left: 8%;
                margin-top: 30px;
                margin-bottom: 20px;
                line-height: 40px;
                font-size: 18px;
                color: #666;
                font-weight: normal;
            }
        }
        .container {
            padding-top: 15px;
            background-color: #fff;
            overflow: hidden;
            .doc {
                width: 79%;
                min-width: 750px;
                margin: 0 auto 30px;
                .doc-top{
                    .top-first {
                        height: 20px;
                        line-height: 20px;
                    }
                    .top-second {
                        height: 32px;
                        line-height: 32px;
                        margin-top: 12px;
                    }
                    .brief {
                        clear: both;
                        /* background-color: aquamarine; */
                        .wx-tit {
                            /* background-color: aqua; */
                            text-align: center;
                            h1 {
                                padding-top: 25px;
                                padding-bottom: 15px;
                                font-size: 24px;
                                color: #333;
                                font-weight: normal;
                                line-height: 35px;
                                vertical-align: middle;
                                font-family: "Microsoft yahei";
                                word-wrap: break-word;
                            }
                            h3 {
                                line-height: 32px;
                                font-size: 14px;
                                font-weight: normal;
                                span {
                                    margin-right: 20px;
                                }
                            }
                        }
                        .abstract{
                            width:100%;
                            padding:8px 14px;
                            clear:both;
                            float:none;
                            /* background-color: antiquewhite; */
                            .info-item{
                                color:#666;
                                font-size:14px;
                                height:25px;
                                letter-spacing: 1px;
                                label{
                                    display: inline-block;
                                    width:130px;
                                    font-size:16px;
                                    text-align: left;
                                    font-weight: bold;
                                }
                                span{
                                    display: inline-block;
                                    position:absolute;
                                    margin-left: 10px;
                                }
                            }
                        }
                    }
                    .content{
                        .xgfwtj{
                            margin-bottom: 30px;
                            .divder{
                                height: 42px;
                                margin-top: 30px;
                                text-align: center;
                                border-bottom: 1px dashed #a9a9a9;
                                clear: both;
                                font-size: 14px;
                                line-height: 60px;
                                color: #000;
                                span{
                                    display: inline-block;
                                    line-height: 80px;
                                    height: 42px;
                                    margin: 0 auto;
                                    padding: 0 40px;
                                    font-size: 18px;
                                    font-weight: normal;
                                    font-family: "Microsoft Yahei";
                                    color: #666;
                                    border-bottom: 1px solid #53a3e2;
                                    b{
                                        margin: 0 auto;
                                        padding: 0 40px;
                                        line-height: 80px;
                                        font-weight: normal;
                                        font-family: "Microsoft Yahei";
                                        letter-spacing: 2px;
                                        background: #fff;
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
    }
}
</style>

<template>
<div class="paper-detail">
    <div v-if="paper">
        <div class="main">
            <div class="sidebar-a" style="height: 3306px;">
              <h5>文章目录</h5>
            </div>
            <div class="container">
                <div class="doc">
                    <div class="doc-top">
                        <div class="top-first"></div>
                        <div class="top-second"></div>
                        <div class="brief">
                            <div class="wx-tit">
                                <h1>{{ paper.title }}</h1>
                                <h3>
                                    <span>{{ paper.author }}</span>
                                </h3>
                                <h3>
                                    <span>中国石油大学(华东)</span>
                                </h3>
                            </div>
                            <div class="abstract">
                                 <ul>
                                    <li class="info-item">
                                        <label>摘要：</label>
                                        <span>{{ paper.content }}</span>
                                    </li>
                                    <li class="info-item">
                                        <label>发布时间：</label>
                                        <span>{{ paper.create_time }}</span>
                                    </li>
                                </ul>
                            </div>
                        </div>
                        <div class="content">
                            <div class="xgfwtj">
                                <h5 class="divder">
                                    <span>
                                        <b>正文内容</b>
                                    </span>
                                </h5>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div v-else>Loading...</div>
</div>
</template>

<script lang="ts" setup>
import {useRoute} from 'vue-router'
import {onBeforeMount, ref} from 'vue'
import axios from 'axios'
import { onMounted } from 'vue';

const route = useRoute()
const paper_id=ref('')
onBeforeMount(()=>{
    paper_id.value=route.query.id as string
    console.log(paper_id.value)
})

interface Papers{
    id:number;
    title:string;
    author:string;
    content:string;
    create_time:string;
    image_url?:string;
}
const paper=ref<Papers>()
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