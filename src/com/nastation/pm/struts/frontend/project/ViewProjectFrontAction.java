package com.nastation.pm.struts.frontend.project;

import java.util.ArrayList;
import java.util.List;

import com.nastation.pm.Global;
import com.nastation.pm.PermissionConstants;
import com.nastation.pm.bean.IssueFilter;
import com.nastation.pm.bean.User;
import com.nastation.pm.beanhbm.Projecthbm;
import com.nastation.pm.beanhbm.SearchRequesthbm;
import com.nastation.pm.business.IssueFilterBO;
import com.nastation.pm.business.ProjectBO;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class ViewProjectFrontAction extends ActionSupport {
    private boolean flag;

    public boolean isFlag() {
        return flag;
    }

    public void setFlag(boolean flag) {
        this.flag = flag;
    }

    @Override
    public String execute() throws Exception {

        ProjectBO pb = ProjectBO.getProjectBO();
        List<Projecthbm> list = pb.getProjectList();
        User usr = (User) ActionContext.getContext().getSession().get(Global.SESSION_USER);
        List<ViewProjectFront> vpList = new ArrayList<>();
        if (list.size() == 0) {
            setFlag(true);
        } else {
            for (Projecthbm proj : list) {
                ViewProjectFront vp = new ViewProjectFront();
                vp.setProj(proj);
                if (usr.validate(proj.getId(), PermissionConstants.ADMINISTRATER_PROJECTS)) {
                    IssueFilterBO issueFilterBO = IssueFilterBO.getIssueFilterBO();
                    List<SearchRequesthbm> filterList = issueFilterBO.getFilterByUserAndProject(usr.getName(),
                            proj.getId());
                    if (filterList != null) {
                        for (SearchRequesthbm sr : filterList) {
                            IssueFilter tempFilter = new IssueFilter();
                            tempFilter.setId(sr.getId());
                            tempFilter.setFilterName(sr.getFilterName());
                            vp.getList().add(tempFilter);
                            vpList.add(vp);

                        }
                    }
                }
            }
        }
        ActionContext cx = ActionContext.getContext();
        cx.put("vpList", vpList);

        return SUCCESS;
    }

}
