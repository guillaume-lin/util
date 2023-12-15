package com.example.business.controller;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.example.business.entities.PeopleEntity;
import com.example.business.mapper.PeopleMapper;
import org.springframework.amqp.core.MessageBuilder;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cloud.stream.function.StreamBridge;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping("/people")
public class PeopleController {
    @Autowired
    private PeopleMapper peopleMapper;

    @Autowired
    private StreamBridge streamBridge;

    @GetMapping(value="/list")
    public List<PeopleEntity> listPeople(){
        List<PeopleEntity> peopleList = peopleMapper.selectList(
                new QueryWrapper<PeopleEntity>()
                .lambda()
                .ge(PeopleEntity::getAge,18)
        );
        return peopleList;
    }
    @GetMapping(value="/send")
    public  String sendMessage(@RequestParam("msg") String msg){
        streamBridge.send("uppercase-out-0", msg);
        return "OK";
    }
}
