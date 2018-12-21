package com.xiaoshu.admin.controller;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.xiaoshu.admin.entity.Farm;

import com.xiaoshu.admin.service.FarmService;
import com.xiaoshu.common.annotation.SysLog;
import com.xiaoshu.common.base.PageData;
import com.xiaoshu.common.config.MySysUser;
import com.xiaoshu.common.util.ResponseEntity;
import org.apache.commons.lang3.StringUtils;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.util.WebUtils;
import javax.servlet.ServletRequest;
import java.util.Date;
import java.util.List;
import java.util.Map;

/**
 * 农田管理controller层
 */
@Controller
@RequestMapping("admin/farm/user")
public class FarmController {

    @Autowired
    FarmService farmService;

    @GetMapping(value = "list")
    public String list(){
        return "admin/farm/list";
    }

    @RequiresPermissions("farm:user:list")
    @PostMapping("list")
    @SysLog("查看农田列表")
    @ResponseBody
    public PageData<Farm> list(@RequestParam(value = "page",defaultValue = "1")Integer page,
                               @RequestParam(value = "limit",defaultValue = "10")Integer limit,
                               ServletRequest request){
        Map map = WebUtils.getParametersStartingWith(request, "s_");
        PageData<Farm> farmPageData = new PageData<>();
        QueryWrapper<Farm> farmWrapper = new QueryWrapper<>();
        //加条件
        farmWrapper.eq("del_flag",false);
        farmWrapper.eq("userId",MySysUser.id());
        if(!map.isEmpty()){
            String keys = (String) map.get("key");
            if(StringUtils.isNotBlank(keys)) {
                farmWrapper.like("name", keys);
            }
        }
        IPage<Farm> farmPage = farmService.page(new Page<>(page,limit),farmWrapper);
        farmPageData.setCount(farmPage.getTotal());
        farmPageData.setData(farmPage.getRecords());
        /*farmPageData.setData(setUserToFarm(farmPage.getRecords()));*/
        return farmPageData;
    }

    @GetMapping("add")
    public String add(){
        return "admin/farm/add";
    }

    @RequiresPermissions("farm:user:add")
    @PostMapping("add")
    @ResponseBody
    @SysLog("保存新增农田数据")
    public ResponseEntity add(@RequestBody Farm farm){
        farm.setCreateId(MySysUser.id());
        farm.setUserId(MySysUser.id());
        farm.setCreateDate(new Date());
        if(StringUtils.isBlank(farm.getName())){
            return ResponseEntity.failure("农田名称不能为空");
        }
        if(StringUtils.isBlank(farm.getSize())){
            return ResponseEntity.failure("农田面积不能为空");
        }
        if(StringUtils.isBlank(farm.getLocation())){
            return ResponseEntity.failure("农田地点不能为空");
        }

        if(farmService.getFarmNameCount(farm.getName())>0){
            return ResponseEntity.failure("农田名称已存在");
        }
        farmService.saveFarm(farm);
        return ResponseEntity.success("操作成功");
    }

    @GetMapping("edit")
    public String edit(String id,ModelMap modelMap){
        Farm farm = farmService.getFarmById(id);
        modelMap.put("farm",farm);
        return "admin/farm/edit";
    }

    @RequiresPermissions("farm:user:edit")
    @PostMapping("edit")
    @ResponseBody
    @SysLog("保存编辑农田数据")
    public ResponseEntity edit(@RequestBody Farm farm){
        if(StringUtils.isBlank(farm.getId())){
            return ResponseEntity.failure("农田ID不能为空");
        }
        if(StringUtils.isBlank(farm.getName())){
            return ResponseEntity.failure("农田名称不能为空");
        }
        if(StringUtils.isBlank(farm.getSize())){
            return ResponseEntity.failure("农田面积不能为空");
        }
        if(StringUtils.isBlank(farm.getLocation())){
            return ResponseEntity.failure("农田位置不能为空");
        }
        Farm oldFarm = farmService.getFarmById(farm.getId());
        if(!oldFarm.getName().equals(farm.getName())){
            if(farmService.getFarmNameCount(farm.getName())>0){
                return ResponseEntity.failure("农田名称已存在");
            }
        }
        farmService.updateFarm(farm);
        return ResponseEntity.success("操作成功");
    }

    @RequiresPermissions("farm:user:delete")
    @PostMapping("delete")
    @ResponseBody
    @SysLog("删除农田数据")
    public ResponseEntity delete(@RequestParam(value = "id",required = false)String id){
        if(StringUtils.isBlank(id)){
            return ResponseEntity.failure("农田ID不能为空");
        }
        Farm farm = farmService.getFarmById(id);
        farmService.deleteFarm(farm);
        return ResponseEntity.success("操作成功");
    }

    @RequiresPermissions("farm:user:delete")
    @PostMapping("deleteSome")
    @ResponseBody
    @SysLog("多选删除农田数据")
    public ResponseEntity deleteSome(@RequestBody List<Farm> farms){
        if(farms == null || farms.size()==0){
            return ResponseEntity.failure("请选择需要删除的农田");
        }
        for (Farm r : farms){
            farmService.deleteFarm(r);
        }
        return ResponseEntity.success("操作成功");
    }
}
