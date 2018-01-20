package com.nastation.pm.struts.backend.role;

import java.util.List;

import com.nastation.pm.beanhbm.Rolehbm;
import com.nastation.pm.business.RoleBO;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class ViewRolesAction extends ActionSupport {

    @Override
    public String execute() throws Exception {
        RoleBO rb = RoleBO.getRoleBO();
        List<Rolehbm> list = rb.getRoleList();
        ActionContext cx = ActionContext.getContext();
        cx.put("roleList", list);

        return SUCCESS;
    }

}
