package com.hjy.dao;

import com.hjy.pojo.User;
import org.apache.ibatis.annotations.Param;


public interface UserMapper {
    /**
     * 通过主键删除
     * @param id
     * @return
     */
    int deleteByPrimaryKey(Integer id);

    /**
     * 添加用户
     * @param record
     * @return
     */
    int insert(User record);

    int insertSelective(User record);

    /**
     * 通过id找到User
     * @param id
     * @return User
     */
    User selectByPrimaryKey(Integer id);

    /**
     * 通过id（必须）更新部分用户部分信息
     * @param record
     * @return
     */
    int updateByPrimaryKeySelective(User record);

    /**
     * 更新用户信息
     * @param record
     * @return
     */
    int updateByPrimaryKey(User record);

    /**
     * 检查是否有此用户名
     * @param username
     * @return int 通过sql返回的数量
     */
    int checkUsername(String username);

    /**
     * 通过用户名和密码查找用户
     * @param username
     * @param password
     * @return User
     */
    User selectLogin(@Param("username") String username, @Param("password")String password);

    /**
     * 通过用户名 得到 找回密码的问题
     * @param username
     * @return
     */
    String selectQuestionByUsername(String username);

    /**
     * 检查此用户名的问题和答案是否匹配
     * @param username
     * @param question
     * @param answer
     * @return 通过sql返回的数量
     */
    int checkAnswer(@Param("username")String username,@Param("question")String question,@Param("answer")String answer);

    /**
     * 更新密码
     * @param username
     * @param passwordNew
     * @return
     */
    int updatePasswordByUsername(@Param("username")String username,@Param("passwordNew")String passwordNew);

    int checkPassword(@Param(value="password")String password,@Param("userId")Integer userId);

}