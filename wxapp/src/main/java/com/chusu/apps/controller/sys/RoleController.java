package com.chusu.apps.controller.sys;

import com.chusu.apps.config.Constants;
import com.chusu.apps.controller.BaseAction;
import com.chusu.apps.model.TableList;
import com.chusu.apps.model.sys.SysAdmin;
import com.chusu.apps.model.sys.SysRole;
import com.chusu.apps.service.sys.AdminService;
import com.chusu.apps.service.sys.SysRoleService;
import com.chusu.platform.util.GsonUtils;
import com.chusu.platform.util.StringUtil;
import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import java.util.*;

/**
 * <Description> <br>
 * 权限处理控制器
 * 
 * @author Administrator<br>
 * @CreateDate 2016年1月12日 <br>
 */
@Controller
@RequestMapping("/admin")
public class RoleController extends BaseAction {

    @Autowired
    AdminService adminService;

    @Autowired
    SysRoleService roleService;

    /**
     * Description: <br>
     * 页面首页
     * 
     * @param model
     * @return <br>
     */
    @RequestMapping("/index")
    public String index(ModelMap model) {
//        MyThread myThread2 = new MyThread();
//        myThread2.start();
    	SysAdmin admin = (SysAdmin) session.getAttribute(Constants.key.BACKEND_USER_SESSION_KEY);
        Integer roleId = admin.getRoleId();
        List<Map<String, Object>> sb = makeMenu(roleId,0);
        session.setAttribute("menu",sb);
        model.put("oneMenu", sb );
        model.put("admin", admin);
        return "/admin/index";
    }

    /**
     * Description: <br>
     * 页面首页
     *
     * @param model
     * @return <br>
     */
    @RequestMapping("/indexList")
    public String indexList(ModelMap model) {
        SysAdmin admin = (SysAdmin) session.getAttribute(Constants.key.BACKEND_USER_SESSION_KEY);
        model.put("admin", admin);

        return "/admin/sys/index_list";
    }


    /**
     * Description: <br>
     * 页面首页
     *
     * @param model
     * @return <br>
     */
    @RequestMapping("/indexLists")
    public String indexLists(ModelMap model) {
        SysAdmin admin = (SysAdmin) session.getAttribute(Constants.key.BACKEND_USER_SESSION_KEY);
        model.put("admin", admin);
        return "/admin/sys/index_lists";
    }
    public List<Map<String, Object>> makeMenu(Integer roleId,Integer pid){
        List<Map<String, Object>> list = new ArrayList<Map<String, Object>>();
        StringBuilder sb = new StringBuilder();
        sb.append("[");
        List<Map<String, Object>> rMenu = adminService.selectRoleMenu(roleId, pid);
        for(int i = 0;i<rMenu.size();i++){
            Map<String, Object> rMap = rMenu.get(i);
            if(null == rMap){
                continue;
            }
            String id = String.valueOf(rMap.get("id"));
            List<Map<String, Object>> ss = makeMenu(roleId,Integer.parseInt(id));
            if(!StringUtil.isEmpty(ss)){
                rMap.put("children",ss);
            }
            list.add(rMap);
        }
        sb.append("]");
        return list;
    }

    /**
     * Description: <br>
     * 左侧菜单
     * 
     * @param model
     * @param pid
     * @return <br>
     */
    @RequestMapping("/getmenu")
    public String getleftMenu(ModelMap model, Integer pid) {
        SysAdmin admin = (SysAdmin) request.getSession().getAttribute(Constants.key.BACKEND_USER_SESSION_KEY);
        model.put("secondMenu", adminService.selectSecondMenu(admin.getRoleId(), pid));
        return "admin/left_menu";
    }

    /**
     * Description: <br>
     * 角色列表
     * 
     * @param model
     * @param currentIndex
     * @param roleName
     * @return <br>
     */
    @RequestMapping("/role/list")
    public String selectRoleList(ModelMap model, Integer currentIndex, String roleName) {
        return "admin/sys/role_list";
    }
    @RequestMapping(value = "/role/jsonlist", method = RequestMethod.POST)
    @ResponseBody
    public TableList<SysRole> selectjsonlist(SysRole role, Integer start, Integer length) {
        return roleService.selectRoleList( start,length,role);
    }

    /**
     * Description: <br>
     * 前往修改或新增角色界面
     * 
     * @param model
     * @param id
     * @return <br>
     */
    @RequestMapping("/role/mergepage")
    public String add(ModelMap model, Integer id) {
        SysRole role = null;
        if (id != null) {
            role = roleService.selectByPrimaryKey(id);
        }
        model.put("role", role);
        return "admin/sys/role_edit";
    }

    /**
     * Description: <br>
     * 修改或新增
     * 
     * @param model
     * @return <br>
     */
    @RequestMapping(value = "/role/merge", method = RequestMethod.POST)
    @ResponseBody
    public String saveOrUpdate(ModelMap model, SysRole role) {
        return roleService.saveOrUpdate(role);
    }

    /**
     * Description: <br>
     * 删除
     *
     * @param id
     * @return <br>
     */
    @RequestMapping(value = "/role/del", method = RequestMethod.POST)
    @ResponseBody
    public String delete(Integer id) {
    	roleService.delRoleMenu(id);
    	String str = roleService.delete(id);
    	//添加操作记录
		/*SysAdmin admin = (SysAdmin) request.getSession().getAttribute(Constants.key.BACKEND_USER_SESSION_KEY);
		BaseOptionHistory baseOptionHistory = new BaseOptionHistory();
		baseOptionHistory.setCreateTime(new Date());
		baseOptionHistory.setOptionContent("删除角色操作");
		baseOptionHistory.setUsername(admin.getUsername());
		baseOptionHistoryService.save(baseOptionHistory);*/
        return str;
    }

    /**
     * Description: <br>
     * 跳转至调整菜单界面
     * 
     * @return <br>
     */
    @RequestMapping(value = "role/setMenu")
    public String toEditPage(ModelMap model, Integer id) {
        model.put("treeJson", roleService.selectCheckMenu(id));
        model.put("roleId", id);
        return "admin/sys/rolemenu_tree";
    }

    /**
     * Description: <br>
     * 保存角色菜单
     * 
     * @return <br>
     */
    @RequestMapping(value = "role/saveRoleMenu")
    @ResponseBody
    public String saveRoleMenu(ModelMap model, Integer roleId, String menuIds) {
        int count = 0;
        if (!StringUtils.isEmpty(menuIds) && null != roleId) {
            try {
                String[] menuId = menuIds.split(",");
                roleService.delRoleMenu(roleId);
                for (int i = 0; i < menuId.length; i++) {
                    roleService.saveRoleMenu(roleId, Integer.parseInt(menuId[i]));
                    count++;
                }
                //添加操作记录
				/*SysAdmin admin = (SysAdmin) request.getSession().getAttribute(Constants.key.BACKEND_USER_SESSION_KEY);
				BaseOptionHistory baseOptionHistory = new BaseOptionHistory();
				baseOptionHistory.setCreateTime(new Date());
				baseOptionHistory.setOptionContent("分配权限操作");
				baseOptionHistory.setUsername(admin.getUsername());
				baseOptionHistoryService.save(baseOptionHistory);*/
            } catch (Exception e) {
                roleService.delRoleMenu(roleId);
                count = -1;
            }
        }
        return count + "";
    }
}
