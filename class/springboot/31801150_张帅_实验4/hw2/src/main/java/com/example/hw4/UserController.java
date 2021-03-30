package com.example.hw4;


import com.example.hw4.entity.MVCUser;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import reactor.core.publisher.Flux;
import reactor.core.publisher.Mono;

import javax.annotation.PostConstruct;
import java.util.HashMap;

import java.util.Map;
import java.util.stream.Collectors;


@RestController
@RequestMapping(path = "/user")
public class UserController {
    Map<Long, MVCUser> users = new HashMap<>();

    @PostConstruct
    public void init() throws Exception {
        users.put(Long.valueOf(1), new MVCUser(1, "zhangshuai", 20));
        users.put(Long.valueOf(2), new MVCUser(2, "zhangsan", 21));
    }


    @GetMapping("/list")
    public Flux<MVCUser> getAll() {
        return Flux.fromIterable(users.entrySet().stream()
                .map(entry -> entry.getValue())
                .collect(Collectors.toList()));
    }


    @GetMapping("/{id}")
    public Mono<MVCUser> getUser(@PathVariable Long id) {
        return Mono.justOrEmpty(users.get(id));
    }


    @PostMapping("")
    public Mono<ResponseEntity<String>> addUser(MVCUser user) {
        users.put(user.getId(), user);
        return Mono.just(new ResponseEntity<>("添加成功", HttpStatus.CREATED));
    }


    @PutMapping("/{id}")
    public Mono<ResponseEntity<MVCUser>> putUser(@PathVariable Long id, MVCUser user) {
        user.setId(id);
        users.put(id, user);
        return Mono.just(new ResponseEntity<>(user, HttpStatus.CREATED));
    }

    @DeleteMapping("/{id}")
    public Mono<ResponseEntity<String>> deleteUser(@PathVariable Long id) {
        users.remove(id);
        return Mono.just(new ResponseEntity<>("删除成功", HttpStatus.ACCEPTED));
    }
}