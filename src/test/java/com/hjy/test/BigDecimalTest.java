package com.hjy.test;

import org.junit.Test;

import java.math.BigDecimal;

/**
 * @author hjy
 * @create 2018/01/18
 **/
public class BigDecimalTest {

    @Test
    public void test1(){
        System.out.println(0.05+0.01);
    }


    @Test
    public void test2(){
        //会造成精度丢失
        BigDecimal b1 = new BigDecimal(0.05);
        BigDecimal b2 = new BigDecimal(0.01);
        System.out.println(b1.add(b2));
    }

    @Test
    public void test3(){
        //使用String构造器的方法则不会丢失
        BigDecimal b1 = new BigDecimal("0.05");
        BigDecimal b2 = new BigDecimal("0.01");
        b1.add(b2);
        System.out.println(b1.add(b2));
    }



}
