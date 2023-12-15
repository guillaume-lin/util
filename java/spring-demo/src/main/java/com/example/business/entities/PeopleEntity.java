package com.example.business.entities;


import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;

@Data
@TableName("people")
public class PeopleEntity {
    @TableId(type=IdType.AUTO)
    private Long id;
    private String name;
    private Integer age;
}
