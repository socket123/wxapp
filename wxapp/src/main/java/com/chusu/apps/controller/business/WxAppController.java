package com.chusu.apps.controller.business;

import com.chusu.apps.controller.BaseAction;
import com.chusu.apps.model.business.WxOpen;
import com.chusu.apps.service.business.WxAppService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("/app/manager")
public class WxAppController  extends BaseAction {

    @Autowired
    WxAppService wxAppService;

    /**
     * Description: <br>
     * 修改或新增
     *
     * @param model
     * @return <br>
     */
   /* @RequestMapping(value = "/merge", method = RequestMethod.POST)
    @ResponseBody
    public String saveOrUpdate(ModelMap model, WxOpen record) {
        return OpenService.saveOrUpdate(record);
    }*/
}
