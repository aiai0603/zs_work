package com.example.hw4;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.reactive.function.server.RouterFunction;
import org.springframework.web.reactive.function.server.RouterFunctions;
import org.springframework.web.reactive.function.server.ServerResponse;

import static org.springframework.web.reactive.function.server.RequestPredicates.*;

@Configuration
public class ReactiveRouter {
    @Autowired
    private ReactiveUserHandler userHandler;
    @Bean
    public RouterFunction<ServerResponse> userRouter() {
        return RouterFunctions.nest(

                path("/reactive"),

                RouterFunctions
                        .route(GET("/getuserid"), userHandler::getUserId)
                        .andRoute(GET("/getusername"), userHandler::getUserName)
                        .andRoute(GET("/notify"), userHandler::notifyNewUser)
        );
    }
}
