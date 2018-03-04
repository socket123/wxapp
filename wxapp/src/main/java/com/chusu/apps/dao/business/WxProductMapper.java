package com.chusu.apps.dao.business;

import com.chusu.apps.model.business.WxProduct;
import tk.mybatis.mapper.common.Mapper;

import java.util.List;
import java.util.Map;

public interface WxProductMapper extends Mapper<WxProduct>{
    /**
     * Description: <br>
     * 查询所有菜单列表
     *
     * @author Administrator<br>
     * @param pid
     * @return <br>
     */
    List<WxProduct> selectWxProductByid(Integer pid);

/*
分页查询
 */
    List<WxProduct> selectproductList(Map<String, Object> map);

    /**
     * 统计
     */
    int selectProductCount(Map<String, Object> map);

/*

全查
 */
    List<WxProduct> selectWxProduct();

    /*
    查询程序的产品名称
     */

    List<Map<String, Object>> selectproName(Integer aid);
}
