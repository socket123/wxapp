package com.chusu.apps.service.business;

import com.chusu.apps.config.Constants;
import com.chusu.apps.dao.business.WxOpenMapper;
import com.chusu.apps.dao.business.WxProductMapper;
import com.chusu.apps.dao.sys.SysAdminMapper;
import com.chusu.apps.model.business.User;
import com.chusu.apps.model.business.WxOpen;
import com.chusu.apps.model.business.WxProduct;
import com.chusu.apps.model.sys.SysAdmin;
import com.chusu.apps.service.BaseService;
import com.chusu.platform.util.StringUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class WxOpenService extends BaseService<WxOpen> {
    @Autowired
    WxOpenMapper wxOpenDao;

    @Autowired
    WxProductMapper wxProductMapper;

    public WxOpen selectByPrimaryKey(Integer id) {
        WxOpen record = null;
        if (null != id) {
            record = wxOpenDao.selectByPrimaryKey(id);
        }
        return record;
    }
    /**
     * 修改或保存产品
     */
    public String saveOrUpdate(WxOpen record) {
        int count = 0;
        if (record == null) {
            count = -1;
        } else if (null == record.getId()) {
            record.setCreateTime(new Date());
            count = wxOpenDao.insertSelective(record);
        } else {
            count = wxOpenDao.updateByPrimaryKeySelective(record);
        }
        return count + "";
    }
    /*
    *查询全部小程序的信息
    *
     */
    public  Object selectWxOpen(){
       Object record =  wxOpenDao.selectWxOpen();
       return  record;
    }

    /*
查询程序的产品名称
 */
    /**
     * Description: <br>
     * 根据角色id查询菜单
     *
     * @author Administrator<br>
     * @param pId
     * @return <br>
     */
    public List<Map<String, Object>> selectproName(Integer pId) {

        List<Map<String, Object>> list = null;
        list = wxProductMapper.selectproName(pId);
        return list;
    }
}
