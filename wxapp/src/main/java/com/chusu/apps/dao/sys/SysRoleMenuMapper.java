package com.chusu.apps.dao.sys;

import com.chusu.apps.model.sys.SysRoleMenu;
import tk.mybatis.mapper.common.Mapper;

import java.util.List;

public interface SysRoleMenuMapper extends Mapper<SysRoleMenu> {
	
	List<Integer> selectByRoleId(Integer roleId);
}