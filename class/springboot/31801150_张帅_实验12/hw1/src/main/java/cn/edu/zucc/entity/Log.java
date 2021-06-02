package cn.edu.zucc.entity;

import lombok.Data;
import org.springframework.data.elasticsearch.annotations.Document;
import org.springframework.data.elasticsearch.annotations.Field;
import org.springframework.data.elasticsearch.annotations.FieldType;

import java.io.Serializable;
import java.util.Date;

@Document(indexName = "ec12138", replicas = 0, shards = 5)
//indexName索引名称 可以理解为数据库名 必须为小写 不然会报org.elasticsearch.indices.InvalidIndexNameException异常
//type类型 可以理解为表名
@Data
//@AllArgsConstructor
public class Log implements Serializable {

    public Log(String id, String url, String method, String ip, Date date, String param, String admin) {
        this.id = id;
        this.url = url;
        this.method = method;
        this.ip = ip;
        this.date = date;
        this.param = param;
        this.admin = admin;
    }

    private String id;

    @Field(type = FieldType.Text, analyzer = "ik_max_word")//ik_max_word使用ik分词器
    private String url;

    @Field(type = FieldType.Keyword)
    private String method;


    private String ip;


    private Date date;

    private String param;


    private String admin;


}
