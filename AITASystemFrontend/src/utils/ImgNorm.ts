// 图片地址规范化
export const server_host='http://127.0.0.1:5000'

export const formatImageUrl=(image_url:string)=>{
        if(image_url.startsWith('http')){
          return image_url
        }else{
          return server_host+image_url
        }
}

