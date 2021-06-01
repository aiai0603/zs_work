package cn.edu.zucc.controller;


import cn.edu.zucc.mq.TopicSender;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;


@RestController
public class TopicSendController {
    @Autowired
    private TopicSender sender;

   @GetMapping("topicsend")
    public void topic() throws Exception {
        sender.send();
    }



    @GetMapping("topicsend3")
    public void topic2() throws Exception {
        sender.send3();
    }
}
