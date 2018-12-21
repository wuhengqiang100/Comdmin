package com.xiaoshu.admin.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.xiaoshu.admin.entity.Farm;
import org.apache.ibatis.annotations.Param;


public interface FarmMapper extends BaseMapper<Farm> {

//    void saveFarmMenus(@Param("roleId") String roleId, @Param("menus") Set<Menu> menuSet);

      Farm selectFarmById(@Param("id") String id);

//    void dropFarmMenus(@Param("roleId") String roleId);

//    void dropFarmUsers(@Param("roleId") String roleId);
}