package com.hjy.util;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import org.apache.commons.io.IOUtils;

import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;

/**
 * @author hjy
 * @create 2017/12/26
 **/
public class JsonHeadUtil {
    public static void processRequest(HttpServletResponse response, String configJson) throws IOException {
        //读取配置文件
        InputStream in = JsonHeadUtil.class.getResourceAsStream(configJson);
        //利用apache.commons.io.IOUtils 将InputStream转换成String  JsonObject文本数据
        String result = IOUtils.toString(in,"UTF-8");
        //将JsonObject数据转换为Json
        JSONObject object = JSON.parseObject(result);
        response.setContentType(
                "text/plain;charset=utf-8"
        );
        PrintWriter out = response.getWriter();
        out.print(object);
        out.close();
    }
}
