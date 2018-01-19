package com.hjy.controller.portal;

import com.hjy.common.Const;
import com.hjy.common.ResponseCode;
import com.hjy.common.ServerResponse;
import com.hjy.pojo.Cart;
import com.hjy.pojo.User;
import com.hjy.service.ICartService;
import com.hjy.vo.CartVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;

/**
 * @author hjy
 * @create 2018/01/18
 **/

@RequestMapping("/cart/")
public class CartController {

    @Autowired
    private ICartService iCartService;


    public ServerResponse<CartVo> add(HttpSession session, Integer count, Integer productId) {
        User user = (User) session.getAttribute(Const.CURRENT_USER);
        if (user == null) {
            return ServerResponse.createByErrorCodeMessage(ResponseCode.NEED_LOGIN.getCode(),ResponseCode.NEED_LOGIN.getDesc());
        }
        return iCartService.add(user.getId(),productId,count);

    }

}
