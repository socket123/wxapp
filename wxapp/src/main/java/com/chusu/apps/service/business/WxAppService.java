package com.chusu.apps.service.business;

import com.chusu.apps.dao.business.WxAppMapper;
import com.chusu.apps.model.business.WxApp;
import com.chusu.apps.service.BaseService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class WxAppService extends BaseService<WxApp> {
    @Autowired
    WxAppMapper wxAppMapper;


/*  public WxApp selectByPrimaryKey(Integer id) {
        WxApp record = null;
        if (null != id) {
            record = wxAppMapper.selectByPrimaryKey(id);
        }
        return record;
    }*/
}
