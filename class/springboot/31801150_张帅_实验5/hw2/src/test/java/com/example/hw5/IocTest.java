package com.example.hw5;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.context.ApplicationContext;
import org.springframework.test.context.junit4.SpringRunner;



@RunWith(SpringRunner.class)
@SpringBootTest

public class IocTest {
    @Autowired
    private ApplicationContext applicationContext;
    @Test
    public <User> void testIoc() {
        User user = (User) applicationContext.getBean("user1");
        System.out.println(user);
    }

}