package com.chusu.apps.dao.business;

import com.chusu.apps.model.business.WxOpen;
import com.chusu.apps.model.business.WxProduct;
import tk.mybatis.mapper.common.Mapper;

import java.util.List;
import java.util.Map;

public interface WxOpenMapper extends Mapper <WxOpen>{

    /*

    全查
    */
    List<WxOpen> selectWxOpen();

    /*
    根据id查询
     */
    List<WxOpen> selectWxOpenByid(Integer pid);



}
