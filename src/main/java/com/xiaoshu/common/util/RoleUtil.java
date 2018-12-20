package com.xiaoshu.common.util;

import com.xiaoshu.admin.entity.Role;
import com.xiaoshu.admin.entity.User;
import org.apache.commons.lang3.StringUtils;

public class RoleUtil{
    /**
     * 判断角色属性的数目
     * @param role
     * @return
     */
    public static Boolean threeRoleProperties(Role role){
        Boolean isTrue=true;
        int count=0;
        if (StringUtils.isNotEmpty(role.getIdentity())){
            count++;
        }if (StringUtils.isNotEmpty(role.getRequestPlace())){
            count++;
        }if (StringUtils.isNotEmpty(role.getTel())){
            count++;
        }if (StringUtils.isNotEmpty(role.getEmail())){
            count++;
        }if (StringUtils.isNotEmpty(role.getAge())){
            count++;
        }
        if (count>=2){
            isTrue=true;
        }else{
            isTrue=false;
        }
        return isTrue;
    }

    public static Boolean contrastRoleAndProperties(Role role,User user){
        Boolean isTrue=true;
        if (StringUtils.isNotEmpty(role.getIdentity())){
            if(!StringUtils.equals(role.getIdentity(),user.getIdentity())){
                isTrue=false;
            }
        }
        if (StringUtils.isNotEmpty(role.getRequestPlace())){
            if(!StringUtils.equals(role.getRequestPlace(),user.getRequestPlace())){
                isTrue=false;
            }
        } if (StringUtils.isNotEmpty(role.getTel())){
            if(!StringUtils.equals(role.getTel(),user.getTel())){
                isTrue=false;
            }
        } if (StringUtils.isNotEmpty(role.getEmail())){
            if(!StringUtils.equals(role.getEmail(),user.getEmail())){
                isTrue=false;
            }
        } if (StringUtils.isNotEmpty(role.getAge())){
            if(!StringUtils.equals(role.getAge(),user.getAge())){
                isTrue=false;
            }
        }
        return isTrue;
    }


}
