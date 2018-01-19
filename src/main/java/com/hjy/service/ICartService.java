package com.hjy.service;

import com.hjy.common.ServerResponse;
import com.hjy.vo.CartVo;
import org.springframework.stereotype.Service;

/**
 * @author hjy
 * @create 2018/01/18
 **/
@Service
public interface ICartService {
    ServerResponse<CartVo> add(Integer userId, Integer productId, Integer count);


}
