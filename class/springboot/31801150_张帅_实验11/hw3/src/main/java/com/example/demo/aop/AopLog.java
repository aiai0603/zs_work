package com.example.demo.aop;

//import org.apache.commons.lang3.builder.ToStringBuilder;
import com.example.demo.entity.Log;
import com.example.demo.jwt.JwtUtil;
import com.example.demo.mapper.AdminMapper;
import com.example.demo.repository.LogRepository;
import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.*;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import javax.servlet.http.HttpServletRequest;
import java.util.Date;

@Aspect
@Component
public class AopLog {
    @Autowired
    LogRepository logRepository;

    @Autowired
    AdminMapper adminMapper;

    private Logger logger = LoggerFactory.getLogger(this.getClass());
    //线程局部的变量,解决多线程中相同变量的访问冲突问题。
    ThreadLocal<Long> startTime = new ThreadLocal<>();
//定义切点
    @Pointcut("execution(public * com.example.demo.controller.*.*(..))")
    public void aopWebLog() {
        System.out.println("121");
    }

    @Before("aopWebLog()")
    public void doBefore(JoinPoint joinPoint) throws Throwable {
        startTime.set(System.currentTimeMillis());
        // 接收到请求，记录请求内容
        ServletRequestAttributes attributes = (ServletRequestAttributes) RequestContextHolder.getRequestAttributes();
        HttpServletRequest request = attributes.getRequest();
        String token  = request.getHeader("token");
        String user = null;
        if(token == null)
        {

        }else
        {
            user = adminMapper.queryById( JwtUtil.verifyToken(token).get("relo").asInt() ).getUser();
        }

        Log log = new Log("zs"+System.currentTimeMillis(),request.getRequestURL().toString(),request.getMethod(),request.getRemoteAddr(),new Date(),request.getQueryString(),user);
        logRepository.save(log);
        System.out.println("ok");
        logger.info("URL : " + request.getRequestURL().toString());
        logger.info("HTTP方法 : " + request.getMethod());
        logger.info("IP地址 : " + request.getRemoteAddr());
        logger.info("类的方法 : " + joinPoint.getSignature().getDeclaringTypeName() + "." + joinPoint.getSignature().getName());
        logger.info("参数 : " + request.getQueryString());


    }

    @AfterReturning(pointcut = "aopWebLog()",returning = "retObject")
    public void doAfterReturning(Object retObject) throws Throwable {

        logger.info("应答值 : " + retObject);
        logger.info("费时: " + (System.currentTimeMillis() - startTime.get()));


    }

    //抛出异常后通知（After throwing advice） ： 在方法抛出异常退出时执行的通知。
    @AfterThrowing(pointcut = "aopWebLog()", throwing = "ex")
    public void addAfterThrowingLogger(JoinPoint joinPoint, Exception ex) {

        logger.error("执行 " + " 异常", ex);


    }

}
