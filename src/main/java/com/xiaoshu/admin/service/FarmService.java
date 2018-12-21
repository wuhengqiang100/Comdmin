package com.xiaoshu.admin.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.xiaoshu.admin.entity.Farm;
import com.xiaoshu.admin.entity.Role;

import java.util.List;

/**
 * 农田service接口层
 */
public interface FarmService extends IService<Farm> {

    long getFarmNameCount(String name);

    Farm saveFarm(Farm farm);

    Farm getFarmById(String id);

    void updateFarm(Farm farm);

    void deleteFarm(Farm farm);

    List<Farm> selectAll();
}
