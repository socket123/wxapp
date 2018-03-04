package com.chusu.apps.controller.business;


import com.chusu.apps.config.Constants;
import com.chusu.apps.controller.BaseAction;
import com.chusu.apps.model.TableList;
import com.chusu.apps.model.business.WxOpen;
import com.chusu.apps.model.business.WxProduct;
import com.chusu.apps.model.sys.SysAdmin;
import com.chusu.apps.service.business.WxOpenService;
import org.apache.commons.math3.stat.descriptive.summary.Product;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;
import java.util.Map;

import static com.chusu.platform.util.Upload.Uploadiamge;

@Controller
@RequestMapping("/open/manager")
public class WxOpenController extends BaseAction {

    @Autowired
    WxOpenService OpenService;

    /**
     * Description: <br>
     * 小程序列表
     *
     * @param model
     * @param currentIndex
     * @return <br>
     */
    @RequestMapping("/list")
    public String selectList(ModelMap model, Integer currentIndex, WxOpen wxOpen) {
        Object list = OpenService.selectWxOpen();
        model.put("oneMenu", session.getAttribute("menu") );
        model.put("wxopen", wxOpen);
        model.put("list",list);
        return "business/apps_list";
    }

    /**
     * Description: <br>
     * 开通界面
     *
     * @param model
     * @param currentIndex
     * @return <br>
     */
    @RequestMapping("/add")
    public String add(ModelMap model, Integer currentIndex, WxOpen wxOpen) {
        SysAdmin admin = (SysAdmin) session.getAttribute(Constants.key.BACKEND_USER_SESSION_KEY);
        Integer id = admin.getId();
        String createName = admin.getUsername();
        wxOpen.setCreateUser(createName);
        wxOpen.setId(id);
        model.put("oneMenu", session.getAttribute("menu") );
        model.put("Wxopen", wxOpen);
        return "business/wxopen";
    }



    /**
     * Description: <br>
     * 修改或新增
     *
     * @param model
     * @return <br>
     */
    @RequestMapping(value = "/merge", method = RequestMethod.POST)
    @ResponseBody
    public String saveOrUpdate(ModelMap model, WxOpen record) {
        return OpenService.saveOrUpdate(record);
    }

    /**
     * Description: <br>
     * 前往详情页面
     *
     * @param model
     * @param id
     * @return <br>
     */
    @RequestMapping("/detaile")
    public String detaile(ModelMap model, Integer id,WxOpen wxOpen) {
        if (id != null) {
            wxOpen = OpenService.selectByPrimaryKey(id);
        }
        List list = OpenService.selectproName(id);
        model.put("oneMenu", session.getAttribute("menu") );
        model.put("wxOpen", wxOpen);
        model.put("list",list);
        return "business/apps_detailes";
    }
}

