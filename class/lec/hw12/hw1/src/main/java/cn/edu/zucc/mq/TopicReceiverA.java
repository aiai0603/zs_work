package cn.edu.zucc.mq;
import cn.edu.zucc.entity.Stu;
import cn.edu.zucc.mapper.StuMapper;
import org.springframework.amqp.rabbit.annotation.RabbitHandler;
import org.springframework.amqp.rabbit.annotation.RabbitListener;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.util.ArrayList;

@Component
@RabbitListener(queues = "topic.a")
public class TopicReceiverA {
    @Autowired
    StuMapper stuMapper;


    @RabbitHandler
    public void process(String msg) {
        ArrayList<Stu> re = (ArrayList<Stu>) stuMapper.queryAll();
        for(int i=0;i<re.size();i++){
            System.out.println("send to "+re.get(i).getName()+" "+msg);

        }

    }

}