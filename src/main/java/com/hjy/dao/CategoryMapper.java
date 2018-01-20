package com.hjy.dao;

import com.hjy.pojo.Category;

import java.util.List;

public interface CategoryMapper {
    int deleteByPrimaryKey(Integer id);

    /**
     * 添加分类信息
     * @param record
     * @return
     */
    int insert(Category record);

    int insertSelective(Category record);

    /**
     * 通过id返回分类信息
     * @param id
     * @return
     */
    Category selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Category record);

    /**
     * 更新分类信息
     * @param record
     * @return
     */
    int updateByPrimaryKey(Category record);

    /**
     *通过此分类ID 找出所有该分类ID下孩子ID的分类信息
     * from mmall_category where parent_id = #{parentId}
     * @param parentId
     * @return
     */
    List<Category> selectCategoryChildrenByParentId(Integer parentId);


}