package com.xiaoshu.admin.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.xiaoshu.admin.entity.Farm;
import com.xiaoshu.admin.mapper.FarmMapper;
import com.xiaoshu.admin.service.FarmService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * 农田管理service实现层
 */
@Service
@Transactional(rollbackFor = Exception.class)
public class FarmServiceImpl extends ServiceImpl<FarmMapper,Farm> implements FarmService {

    /**
     * 获得同一农田名字的数目
     * @param name
     * @return
     */
    @Override
    public long getFarmNameCount(String name) {
        QueryWrapper<Farm> wrapper = new QueryWrapper<>();
        wrapper.eq("name",name);
        return baseMapper.selectCount(wrapper);
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public Farm saveFarm(Farm farm) {
        baseMapper.insert(farm);
        return farm;
    }


    @Override
    public Farm getFarmById(String id) {
        return baseMapper.selectFarmById(id);
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public void updateFarm(Farm farm) {
        baseMapper.updateById(farm);
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public void deleteFarm(Farm farm) {
        farm.setDelFlag(true);
        baseMapper.updateById(farm);

    }

    @Override
    public List<Farm> selectAll() {
        QueryWrapper wrapper = new QueryWrapper();
//        wrapper.eq("del_flag",false);
        return baseMapper.selectList(wrapper);
    }
}
