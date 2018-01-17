package com.hjy.service;

import com.hjy.common.ServerResponse;
import com.hjy.dao.UserMapper;
import com.hjy.pojo.User;
import com.hjy.test.TestBase;
import com.hjy.util.MD5Util;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import static org.junit.Assert.*;

public class IUserServiceTest extends TestBase{
    @Autowired
    private UserMapper userMapper;


    @Test
    public void login() throws Exception {
        System.out.println(userMapper.checkUsername("admin"));
    }

}