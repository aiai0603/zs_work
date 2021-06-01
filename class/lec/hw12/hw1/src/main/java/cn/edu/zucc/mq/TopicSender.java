package cn.edu.zucc.mq;
import org.springframework.amqp.core.AmqpTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;


@Component
public class TopicSender {

    @Autowired
    private AmqpTemplate amqpTemplate;

    public void send() {
        String context = "topic";
        System.out.println("Sender : " + context);
        this.amqpTemplate.convertAndSend("topicExchange", "topic.1", context);
    }

    public void send2(String msg) {

        System.out.println("Sender : " + msg);
        this.amqpTemplate.convertAndSend("topicExchange", "topic.a", msg);
    }

    public void send3() {
        String context = "topic3";
        System.out.println("Sender : " + context);
        this.amqpTemplate.convertAndSend("topicExchange", "topic.b", context);
    }

}