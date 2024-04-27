export interface Papers{
    id:number;
    title:string;
    author:string;
    content:string;
    create_time:string;
    image?:string;
  }

export const testPapers: Papers[] = [
    {
      id: 1,
      title: '这是我的第一篇文章',
      author:'chl',
      content: '这是的test1专栏，有一段非常有意思的简介，可以更新一下欧',
      image: 'http://vue-maker.oss-cn-hangzhou.aliyuncs.com/vue-marker/5ee22dd58b3c4520912b9470.jpg?x-oss-process=image/resize,m_pad,h_100,w_100',
      create_time: '2020-06-11 10:34:22'
    },
    {
      id: 2,
      title: '这是我的第二篇文章',
      author:'chl',
      content: '这是的test1专栏，有一段非常有意思的简介，可以更新一下欧',
      image: 'http://vue-maker.oss-cn-hangzhou.aliyuncs.com/vue-marker/5ee22dd58b3c4520912b9470.jpg?x-oss-process=image/resize,m_pad,h_100,w_100',
      create_time: '2020-06-11 10:34:23'
    },
    {
      id: 1,
      title: '这是我的第三篇文章',
      author:'chl',
      content: '这是的test1专栏，有一段非常有意思的简介，可以更新一下欧',
      create_time: '2020-06-12 10:34:33'
    }
  ]
  