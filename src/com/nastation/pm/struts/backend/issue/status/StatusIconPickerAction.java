package com.nastation.pm.struts.backend.issue.status;

import java.util.ArrayList;
import java.util.List;

import com.nastation.pm.beanhbm.Iconhbm;
import com.nastation.pm.beanhbm.IssueStatushbm;
import com.nastation.pm.business.IssueStatusBO;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class StatusIconPickerAction extends ActionSupport {
    private String element;

    public String getElement() {
        return element;
    }

    public void setElement(String element) {
        this.element = element;
    }

    @Override
    public String execute() throws Exception {
        List<IssueStatushbm> isList = new ArrayList<>();
        IssueStatusBO itb = IssueStatusBO.getIssueStatusBO();
        List<Iconhbm> list = itb.getIconList();
        ActionContext cx = ActionContext.getContext();

        List<String> iconNames = new ArrayList<>();
        List<String> statusNames = new ArrayList<>();

        for (Iconhbm icon : list) {
            List<IssueStatushbm> list2 = itb.getIssueStatusListByIcon(icon);
            iconNames.add(icon.getFileName());

            for (IssueStatushbm is : list2) {
                statusNames.add(is.getName());
            }
            cx.put(icon.getFileName(), statusNames);

        }
        cx.put("iconNames", iconNames);

        return SUCCESS;
    }

}
