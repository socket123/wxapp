package com.chusu.apps.dao.sys;

import com.chusu.apps.model.sys.SysMenu;
import tk.mybatis.mapper.common.Mapper;

import java.util.List;

public interface SysMenuMapper extends Mapper<SysMenu> {
	 /**
     * Description: <br>
     * 根据上级id查询
     * 
     * @param pid
     * @return <br>
     */
    List<SysMenu> selectSysMenuByPid(Integer pid);
}