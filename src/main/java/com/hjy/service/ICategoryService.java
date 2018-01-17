package com.hjy.service;

import com.hjy.common.ServerResponse;
import com.hjy.pojo.Category;

import java.util.List;

/**
 * @author hjy
 * @create 2018/01/13
 **/
public interface ICategoryService {

    ServerResponse addCategory(String categoryName, Integer parentId);
    ServerResponse updateCategoryName(Integer categoryId,String categoryName);
    ServerResponse<List<Category>> getChildrenParallelCategory(Integer categoryId);
    ServerResponse<List<Integer>> selectCategoryAndChildrenById(Integer categoryId);

}
