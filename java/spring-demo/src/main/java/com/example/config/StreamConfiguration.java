package com.example.config;

import lombok.extern.log4j.Log4j2;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import java.util.function.Consumer;
import java.util.function.Function;

@Log4j2
@Configuration
public class StreamConfiguration {
    @Bean
    public Function<String, String> uppercase(){
        log.info("bean function for uppercase created.");
        return value -> {
            log.info("message: {} received. ",value);
            return value.toUpperCase();
        };
    }

}
