package com.hjy.dao;

import com.hjy.pojo.Product;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface ProductMapper {
    int deleteByPrimaryKey(Integer id);

    /**
     * 添加商品
     * @param record
     * @return
     */
    int insert(Product record);

    int insertSelective(Product record);

    /**
     * 通过id返回商品信息
     * @param id
     * @return
     */
    Product selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Product record);

    /**
     * 更新商品
     * @param record
     * @return
     */
    int updateByPrimaryKey(Product record);

    /**
     * 返回所有商品信息
     * @return
     */
    List<Product> selectList();

    /**
     * 通过商品名称（模糊查询，没有则跳过）和商品ID（没有则跳过）
     * @param productName
     * @param productId
     * @return
     */
    List<Product> selectByNameAndProductId(@Param("productName")String productName, @Param("productId") Integer productId);

    /**
     * 通过名字（模糊查询，没有则跳过）和分类集合（没有则跳过）返回商品信息集合
     * @param productName
     * @param categoryIdList
     * @return
     */
    List<Product> selectByNameAndCategoryIds(@Param("productName")String productName,@Param("categoryIdList")List<Integer> categoryIdList);

}