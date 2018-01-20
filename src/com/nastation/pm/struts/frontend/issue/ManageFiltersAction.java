package com.nastation.pm.struts.frontend.issue;

import java.util.ArrayList;
import java.util.List;

import com.nastation.pm.Global;
import com.nastation.pm.bean.IssueFilter;
import com.nastation.pm.bean.User;
import com.nastation.pm.business.IssueFilterBO;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class ManageFiltersAction extends ActionSupport {

    @Override
    public String execute() throws Exception {

        IssueFilterBO issueFilterBO = IssueFilterBO.getIssueFilterBO();
        User user = (User) ActionContext.getContext().getSession().get(Global.SESSION_USER);
        List<IssueFilter> filterList = issueFilterBO.getFiltersByUser(user.getName());
        List<ManageFilters> mfList = new ArrayList<>();
        if (filterList != null) {
            ManageFilters mf = new ManageFilters();

            for (int i = 0; i < filterList.size(); i++) {
                IssueFilter filter = (IssueFilter) filterList.get(i);
                mf.setFilter(filter);
                if (i % 2 == 0) {
                    mf.setColor("#ffffff");
                } else {
                    mf.setColor("#fffff0");
                }
                mfList.add(mf);
            }
        }
        ActionContext.getContext().put("filterList", mfList);

        return SUCCESS;
    }

}
