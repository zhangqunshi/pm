package com.nastation.pm.struts.backend.project;

import java.util.ArrayList;
import java.util.List;

import com.nastation.pm.bean.PermissionScheme;
import com.nastation.pm.beanhbm.PermissionSchemehbm;
import com.nastation.pm.business.PermissionSchemeBO;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class AddProjectAction extends ActionSupport {

    @Override
    public String execute() throws Exception {

        PermissionSchemeBO psBO = PermissionSchemeBO.getPermissionSchemeBO();
        List<PermissionSchemehbm> list = psBO.getSchemeList();
        PermissionScheme ps = new PermissionScheme();
        List<PermissionScheme> psList = new ArrayList<>();

        for (PermissionSchemehbm psh : list) {
            ps.setId(psh.getId());
            ps.setName(psh.getName());
            psList.add(ps);
        }
        ActionContext cx = ActionContext.getContext();
        cx.put("psList", psList);

        return SUCCESS;
    }

}
