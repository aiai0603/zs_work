package cn.edu.zucc.mq;
import org.springframework.amqp.rabbit.annotation.RabbitHandler;
import org.springframework.amqp.rabbit.annotation.RabbitListener;
import org.springframework.stereotype.Component;



@Component
@RabbitListener(queues = "topic.b")
public class TopicReceiverB{
    @RabbitHandler
    public void process(String msg) {
        System.out.println("Topic ReceiverB: " + msg);
    }
}
