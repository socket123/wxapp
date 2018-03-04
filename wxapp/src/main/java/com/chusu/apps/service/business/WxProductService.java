package com.chusu.apps.service.business;

import com.chusu.apps.controller.BaseAction;
import com.chusu.apps.dao.business.WxProductMapper;
import com.chusu.apps.model.TableList;
import com.chusu.apps.model.business.WxProduct;
import com.chusu.apps.model.sys.SysAdmin;
import com.chusu.apps.service.BaseService;
import com.chusu.platform.util.MD5Utils;
import com.chusu.platform.util.StringUtil;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class WxProductService extends BaseService<WxProduct>{
    private final Logger logger = Logger.getLogger(WxProductService.class);

    @Autowired
    WxProductMapper wxProductDao;



    public WxProduct selectByPrimaryKey(Integer id) {
        WxProduct record = null;
        if (null != id) {
            record = wxProductDao.selectByPrimaryKey(id);
        }
        return record;
    }

    /**
     * Description: <br>
     * 角色列表查询
     *
     * @return <br>
     */
    public TableList<WxProduct> selectWxProductList(Integer start, Integer length, WxProduct product) {
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("proName",product.getProName());
        int total = wxProductDao.selectProductCount(map);
        TableList<WxProduct> tl = new TableList();
        tl.setITotalRecords(total);
        tl.setITotalDisplayRecords(total);
        map.put("offset", start);
        map.put("size", length);
        tl.setAaData(wxProductDao.selectproductList(map));
        return tl;
    }


    /**
     * 修改或保存产品
     */
    public String saveOrUpdate(WxProduct record) {
        int count = 0;
        if (record == null) {
            count = -1;
        } else if (null == record.getId()) {
            record.setCreateTime(new Date());
            count = wxProductDao.insertSelective(record);
        } else {
            count = wxProductDao.updateByPrimaryKeySelective(record);
        }
        return count + "";
    }
    /**
     * 删除角色
     */
    public String delete(Integer id) {
        int count = 0;
        if (id == null) {
            count = -1;
        } else {
            count = wxProductDao.deleteByPrimaryKey(id);
        }
        return count + "";
    }

    /*
    查全部
     */
    public Object selectWxProduct(){
        Object record = wxProductDao.selectWxProduct();
        return  record;
    }


}
