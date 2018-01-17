package com.hjy.controller.portal;

import com.github.pagehelper.PageInfo;
import com.hjy.common.ServerResponse;
import com.hjy.service.IProductService;
import com.hjy.util.JsonHeadUtil;
import com.hjy.vo.ProductDetailVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * @author hjy
 * @create 2018/01/15
 **/
@Controller
@RequestMapping("/product/")
public class ProductController {

    @Autowired
    private IProductService iProductService;

    @RequestMapping("productHead.do")
    public void ProductHead( HttpServletResponse response) throws IOException {
        JsonHeadUtil.processRequest(response,"/json/product.json");
    }


    @RequestMapping("detail.do")
    @ResponseBody
    public ServerResponse<ProductDetailVo> detail(Integer productId){
        return iProductService.getProductDetail(productId);
    }

    /**
     *
     * @param keyword 关键字  用于搜索  不是必须的
     * @param categoryId 分类ID
     * @param pageNum
     * @param pageSize
     * @param orderBy 用于排序的方式
     * @return
     */
    @RequestMapping("list.do")
    @ResponseBody
    public ServerResponse<PageInfo> list(@RequestParam(value = "keyword",required = false)String keyword,
                                         @RequestParam(value = "categoryId",required = false)Integer categoryId,
                                         @RequestParam(value = "pageNum",defaultValue = "1") int pageNum,
                                         @RequestParam(value = "pageSize",defaultValue = "10") int pageSize,
                                         @RequestParam(value = "orderBy",defaultValue = "") String orderBy){
        return iProductService.getProductByKeywordCategory(keyword,categoryId,pageNum,pageSize,orderBy);
    }





}
