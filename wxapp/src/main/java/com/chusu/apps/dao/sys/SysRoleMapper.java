package com.chusu.apps.dao.sys;

import com.chusu.apps.model.sys.SysRole;
import tk.mybatis.mapper.common.Mapper;

import java.util.List;
import java.util.Map;

public interface SysRoleMapper extends Mapper<SysRole> {
    /**
     * Description: <br>
     * 分页查询
     *
     * @param map {userName,account,roleId}
     * @return <br>
     */
    List<SysRole> selectRoleList(Map<String, Object> map);

    /**
     * Description: <br>
     * 统计
     *
     * @return <br>
     */
    int selectRoleCount(Map<String, Object> map);
}