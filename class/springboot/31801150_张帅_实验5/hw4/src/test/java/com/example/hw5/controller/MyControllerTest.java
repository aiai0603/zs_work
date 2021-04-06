package com.example.hw5.controller;

import com.alibaba.fastjson.JSONObject;
import com.example.hw5.Entity.stuEntity;
import org.junit.Assert;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.web.servlet.WebMvcTest;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.http.MediaType;
import org.springframework.test.context.junit4.SpringRunner;
import org.springframework.test.context.web.WebAppConfiguration;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.MvcResult;
import org.springframework.test.web.servlet.request.MockMvcRequestBuilders;
import org.springframework.test.web.servlet.result.MockMvcResultHandlers;
import org.springframework.test.web.servlet.result.MockMvcResultMatchers;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;
import org.springframework.web.context.WebApplicationContext;

import static org.junit.Assert.*;
import static org.springframework.web.servlet.function.RequestPredicates.accept;


@SpringBootTest
@RunWith(SpringRunner.class)
public class MyControllerTest {
    //启用web上下文
    @Autowired
    private WebApplicationContext webApplicationContext;
    private MockMvc mockMvc;

    @Before
    public void setUp() throws Exception{
        //使用上下文构建mockMvc
        mockMvc = MockMvcBuilders.webAppContextSetup(webApplicationContext).build();
    }
    @Test
    public void find() throws Exception {
       // 得到MvcResult自定义验证
      // 执行请求
        MvcResult mvcResult= mockMvc.perform(MockMvcRequestBuilders.get("/test/find")
                .contentType(MediaType.APPLICATION_JSON_UTF8)
                //传入参数
                .param("id", String.valueOf(5))
               // .accept(MediaType.TEXT_HTML_VALUE))
                //接收的类型
                .accept(MediaType.APPLICATION_JSON_UTF8))
                //等同于Assert.assertEquals(200,status);
                //判断接收到的状态是否是200
                .andExpect(MockMvcResultMatchers.status().isOk())
                 //等同于 Assert.assertEquals("hello longzhonghua",content);
                .andExpect(MockMvcResultMatchers.content().string("{\"id\":5,\"name\":\"test\",\"age\":20,\"sex\":1,\"number\":\"33048120000603001X\",\"email\":\"1016868503@qq.com\"}"))
                .andDo(MockMvcResultHandlers.print())
        //返回MvcResult
        .andReturn();
        //得到返回代码
        int status=mvcResult.getResponse().getStatus();
        //得到返回结果
        String content=mvcResult.getResponse().getContentAsString();
        //断言，判断返回代码是否正确
        //Assert.assertEquals(200,status);
        //断言，判断返回的值是否正确
        Assert.assertEquals("{\"id\":5,\"name\":\"test\",\"age\":20,\"sex\":1,\"number\":\"33048120000603001X\",\"email\":\"1016868503@qq.com\"}",content);
    }


    @Test
    public void remove() throws Exception {
        // 得到MvcResult自定义验证
        // 执行请求
        MvcResult mvcResult= mockMvc.perform(MockMvcRequestBuilders.get("/test/remove")
                .contentType(MediaType.APPLICATION_JSON_UTF8)
                //传入参数
                .param("id", String.valueOf(5))
                // .accept(MediaType.TEXT_HTML_VALUE))
                //接收的类型
                .accept(MediaType.APPLICATION_JSON_UTF8))
                //等同于Assert.assertEquals(200,status);
                //判断接收到的状态是否是200
                .andExpect(MockMvcResultMatchers.status().isOk())
                //等同于 Assert.assertEquals("hello longzhonghua",content);
                .andExpect(MockMvcResultMatchers.content().string("remove success id = 5"))
                .andDo(MockMvcResultHandlers.print())
                //返回MvcResult
                .andReturn();
        //得到返回代码
        int status=mvcResult.getResponse().getStatus();
        //得到返回结果
        String content=mvcResult.getResponse().getContentAsString();
        //断言，判断返回代码是否正确
        //Assert.assertEquals(200,status);
        //断言，判断返回的值是否正确
        Assert.assertEquals("remove success id = 5",content);
    }


    @Test
    public void add() throws Exception {


        stuEntity stu =new stuEntity(5,"test",20,1,"33048120000603001X","1016868503@qq.com");
        String requestJson = JSONObject.toJSONString(stu);
        MvcResult mvcResult= mockMvc.perform(MockMvcRequestBuilders.post("/test/add")
                .contentType(MediaType.APPLICATION_JSON)
                //传入参数
                .content(requestJson)
                // .accept(MediaType.TEXT_HTML_VALUE))
                //接收的类型
                .accept(MediaType.APPLICATION_JSON_UTF8))
                //等同于Assert.assertEquals(200,status);
                //判断接收到的状态是否是200
                .andExpect(MockMvcResultMatchers.status().isOk())
                //等同于 Assert.assertEquals("hello longzhonghua",content);
                .andExpect(MockMvcResultMatchers.content().string("add success id = 5"))
                .andDo(MockMvcResultHandlers.print())
                //返回MvcResult
                .andReturn();
        //得到返回代码
        int status=mvcResult.getResponse().getStatus();
        //得到返回结果
        String content=mvcResult.getResponse().getContentAsString();
        //断言，判断返回代码是否正确
        //Assert.assertEquals(200,status);
        //断言，判断返回的值是否正确
        assertEquals("add success id = 5",content);
    }



    @Test
    public void erroradd() throws Exception {


        stuEntity stu =new stuEntity(1212,"test",50000,1,"33048120000603001X","1016868503@qq.com");
        String requestJson = JSONObject.toJSONString(stu);
        MvcResult mvcResult= mockMvc.perform(MockMvcRequestBuilders.post("/test/add")
                .contentType(MediaType.APPLICATION_JSON)
                //传入参数
                .content(requestJson)
                // .accept(MediaType.TEXT_HTML_VALUE))
                //接收的类型
                .accept(MediaType.APPLICATION_JSON_UTF8))
                //等同于Assert.assertEquals(200,status);
                //判断接收到的状态是否是200
                .andExpect(MockMvcResultMatchers.status().isOk())
                //等同于 Assert.assertEquals("hello longzhonghua",content);
                .andExpect(MockMvcResultMatchers.content().string("add error"))
                .andDo(MockMvcResultHandlers.print())
                //返回MvcResult
                .andReturn();
        //得到返回代码
        int status=mvcResult.getResponse().getStatus();
        //得到返回结果
        String content=mvcResult.getResponse().getContentAsString();
        //断言，判断返回代码是否正确
        //Assert.assertEquals(200,status);
        //断言，判断返回的值是否正确
        assertEquals("add error",content);
    }


    @Test
    public void modify() throws Exception {


        stuEntity stu =new stuEntity(5,"test",20,1,"33048120000603001X","1016868503@qq.com");
        String requestJson = JSONObject.toJSONString(stu);
        MvcResult mvcResult= mockMvc.perform(MockMvcRequestBuilders.post("/test/modify")
                .contentType(MediaType.APPLICATION_JSON_UTF8)
                //传入参数
                .content(requestJson)
                // .accept(MediaType.TEXT_HTML_VALUE))
                //接收的类型
                .accept(MediaType.APPLICATION_JSON_UTF8))
                //等同于Assert.assertEquals(200,status);
                //判断接收到的状态是否是200
                .andExpect(MockMvcResultMatchers.status().isOk())
                //等同于 Assert.assertEquals("hello longzhonghua",content);
                .andExpect(MockMvcResultMatchers.content().string("modify success id = 5"))
                .andDo(MockMvcResultHandlers.print())
                //返回MvcResult
                .andReturn();
        //得到返回代码
        int status=mvcResult.getResponse().getStatus();
        //得到返回结果
        String content=mvcResult.getResponse().getContentAsString();
        //断言，判断返回代码是否正确
        //Assert.assertEquals(200,status);
        //断言，判断返回的值是否正确
        Assert.assertEquals("modify success id = 5",content);
    }



    @Test
    public void list() throws Exception {
        // 得到MvcResult自定义验证
        // 执行请求

           MvcResult mvcResult= mockMvc.perform(MockMvcRequestBuilders.get("/test/list")
                .contentType(MediaType.APPLICATION_JSON_UTF8)
                //传入参数
                .param("page", String.valueOf(0))
                // .accept(MediaType.TEXT_HTML_VALUE))
                //接收的类型
                .accept(MediaType.APPLICATION_JSON_UTF8))
                //等同于Assert.assertEquals(200,status);
                //判断接收到的状态是否是200
                .andExpect(MockMvcResultMatchers.status().isOk())
                //等同于 Assert.assertEquals("hello longzhonghua",content);
                .andExpect(MockMvcResultMatchers.content().string("{\"msg\":[{\"id\":456,\"name\":\"张帅\",\"age\":77,\"sex\":1,\"number\":\"33048120000603001X\",\"email\":\"1016868503@qq.com\"},{\"id\":434,\"name\":\"1212\",\"age\":12,\"sex\":1,\"number\":\"33048120000603001X\",\"email\":\"1016868503@qq.com\"},{\"id\":333,\"name\":\"admin\",\"age\":39,\"sex\":0,\"number\":\"33048120000603001X\",\"email\":\"1016868503@qq.com\"}],\"flag\":1,\"index\":0,\"sum\":0}"))
                .andDo(MockMvcResultHandlers.print())
                //返回MvcResult
                .andReturn();
        //得到返回代码
        int status=mvcResult.getResponse().getStatus();
        //得到返回结果
        String content=mvcResult.getResponse().getContentAsString();
        //断言，判断返回代码是否正确
        //Assert.assertEquals(200,status);
        //断言，判断返回的值是否正确
        Assert.assertEquals("{\"msg\":[{\"id\":456,\"name\":\"张帅\",\"age\":77,\"sex\":1,\"number\":\"33048120000603001X\",\"email\":\"1016868503@qq.com\"},{\"id\":434,\"name\":\"1212\",\"age\":12,\"sex\":1,\"number\":\"33048120000603001X\",\"email\":\"1016868503@qq.com\"},{\"id\":333,\"name\":\"admin\",\"age\":39,\"sex\":0,\"number\":\"33048120000603001X\",\"email\":\"1016868503@qq.com\"}],\"flag\":1,\"index\":0,\"sum\":0}",content);
    }

    @Test
    public void error() throws Exception {
        MvcResult mvcResult= mockMvc.perform(MockMvcRequestBuilders.get("/1212")
                .contentType(MediaType.APPLICATION_JSON)
                //传入参数
                // .accept(MediaType.TEXT_HTML_VALUE))
                //接收的类型
                .accept(MediaType.APPLICATION_JSON_UTF8))
                //等同于Assert.assertEquals(200,status);
                //判断接收到的状态是否是200
                .andExpect(MockMvcResultMatchers.status().isNotFound())
                //等同于 Assert.assertEquals("hello longzhonghua",content);
                .andDo(MockMvcResultHandlers.print())
                //返回MvcResult
                .andReturn();


    }

}

