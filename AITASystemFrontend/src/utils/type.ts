export interface Zxxm {
    id: number;
    name: string;
    description?: string; 
    funding_agency: string;
    start_date: Date; 
    end_date: Date;
    principal_investigator?: string; 
    budget?: number; // 假设这个属性是可选的，因为数据库中可能是 null
    status: string; // 假设状态字段总是存在
}

export interface Hxxm {
    id: number;
    name: string;
    description?: string; 
    client: string;
    start_date: Date; 
    end_date: Date;
    project_manager?: string; 
    budget?: number; 
}


export interface Data {
  data_id: number,
  data_title: string,
  data_content?: string,
  data_abstract?:string,
  data_date: string,
  data_author: string,
  data_link: string,
  data_read_count: number,
  data_image_url: string,
  data_type:string
}


export interface Papers{
  id:number;
  title:string;
  author:string;
  content:string;
  create_time:string;
  image_url?:string;
  abstract:string;
  keywords:string;
}

export interface GroupData {
  group_id: number;
  group_type: string;
  group_role: string;
  group_person_name: string;
  group_person_description: string;
  group_person_image_url: string;
  group_person_content: string;
  group_person_papers: string;
};

export interface News {
  news_id: number;
  news_title: string;
  news_content: string;
  news_date: string;
  news_author: string;
  news_link: string;
  news_read_count: number;
  news_image_url: string;
  label_id: number;
}

export const Shift=(x:string):string=>{
  if(x=='medicalimage'){
    return '医学图像'
  }else if(x=='multiomicsanalysis'){
    return '多组学分析'
  }else {
    return '关联预测'
  }
}