package com.chusu.apps.controller.sys;

import com.chusu.apps.config.Constants;
import com.chusu.apps.model.TableList;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.chusu.apps.controller.BaseAction;
import com.chusu.apps.model.sys.SysAdmin;
import com.chusu.apps.service.sys.AdminService;
import com.chusu.apps.service.sys.SysRoleService;

@Controller
@RequestMapping("/admin/manager")
public class AdminController extends BaseAction {

    @Autowired
    AdminService adminService;

    @Autowired
    SysRoleService roleService;

    /**
     * Description: <br>
     * 角色列表
     * 
     * @param model
     * @param currentIndex
     * @return <br>
     */
    @RequestMapping("/list")
    public String selectList(ModelMap model, Integer currentIndex, SysAdmin admin) {
        model.put("oneMenu", session.getAttribute("menu") );
        model.put("admin", admin);
        return "admin/adminUser";
    }

    @RequestMapping(value = "/jsonlist", method = RequestMethod.POST)
    @ResponseBody
    public TableList<SysAdmin> selectjsonlist(SysAdmin admin, Integer start, Integer length) {
        return adminService.selectAdminList( start,length,admin);
    }

    /**
     * Description: <br>
     * 前往修改或新增角色界面
     *
     * @param model
     * @param id
     * @return <br>
     */
    @RequestMapping("/mergepage")
    public String add(ModelMap model, Integer id) {
        SysAdmin record = null;
        if (id != null) {
            record = adminService.selectByPrimaryKey(id);
        }
        model.put("admin", record);
        model.put("oneMenu", session.getAttribute("menu"));
        model.put("roleList", roleService.selectAll());
        return "admin/admin_edit";
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
    public String saveOrUpdate(ModelMap model, SysAdmin record) {
        return adminService.saveOrUpdate(record);
    }

    /**
     * Description: <br>
     * 删除
     *
     * @param id
     * @return <br>
     */
    @RequestMapping(value = "/del", method = RequestMethod.POST)
    @ResponseBody
    public String delete(Integer id) {
        return adminService.delete(id);
    }
}
