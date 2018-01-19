package com.nastation.pm.struts.backend.permission;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Set;

import com.nastation.pm.bean.Permission;
import com.nastation.pm.beanhbm.PermissionAssigneehbm;
import com.nastation.pm.beanhbm.PermissionSchemehbm;
import com.nastation.pm.business.PermissionAssigneeBO;
import com.nastation.pm.business.PermissionBO;
import com.nastation.pm.business.PermissionSchemeBO;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class EditPermissionsAction extends ActionSupport {
    private int schemeId;
    private String name;

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getSchemeId() {
        return schemeId;
    }

    public void setSchemeId(int schemeId) {
        this.schemeId = schemeId;
    }

    @Override
    public String execute() throws Exception {

        PermissionSchemeBO schemeBO = PermissionSchemeBO.getPermissionSchemeBO();
        PermissionSchemehbm scheme = schemeBO.getScheme(getSchemeId());
        PermissionAssigneeBO paBO = PermissionAssigneeBO.getPermissionAssigneeBO();
        PermissionBO pBO = PermissionBO.getPermissionBO();
        HashMap<String, List> hm = pBO.getAllTypeList(getSchemeId());
        setName(scheme.getName());
        List<EditPermissions> epList = new ArrayList<>();
        Set<String> keySet = hm.keySet();
        for (Iterator<String> it = keySet.iterator(); it.hasNext();) {
            EditPermissions ep = new EditPermissions();
            String type = it.next();
            ep.setType(type);

            List<Permission> permissionlist = (List) hm.get(type);
            ep.setPermissionList(permissionlist);
            List<List<PermissionAssigneehbm>> pa = new ArrayList<>();
            for (Permission permission : permissionlist) {
                List<PermissionAssigneehbm> list = paBO.getAssigneeTypeList(permission.getId(), schemeId);
                pa.add(list);
            }
            ep.setList(pa);
            epList.add(ep);
        }
        ActionContext.getContext().put("permissions", epList);

        return SUCCESS;
    }

}
