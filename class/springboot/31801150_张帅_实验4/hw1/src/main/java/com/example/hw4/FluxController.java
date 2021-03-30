package com.example.hw4;

import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;
import reactor.core.publisher.Flux;
import reactor.core.publisher.Mono;

import java.util.concurrent.TimeUnit;
import java.util.stream.IntStream;


@RestController
public class FluxController {
    @GetMapping("/helloworld")
    public Mono<String> helloworld() {
        return Mono.just("This is WebFlux demo by zs");
    }

    @GetMapping(value = "/sp", produces = MediaType.TEXT_EVENT_STREAM_VALUE)
    private Flux<String> serverPush() {
        Flux<String> result = Flux
                .fromStream(IntStream.range(1, 10).mapToObj(i -> {
                    try {
                        TimeUnit.SECONDS.sleep(1);
                    } catch (InterruptedException e) {
                    }
                    return "server push data:" + i;
                }));
        return result;
    }
}
