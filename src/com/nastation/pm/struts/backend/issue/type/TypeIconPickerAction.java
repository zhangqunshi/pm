package com.nastation.pm.struts.backend.issue.type;

import java.util.List;

import com.nastation.pm.beanhbm.Iconhbm;
import com.nastation.pm.business.IssueTypeBO;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class TypeIconPickerAction extends ActionSupport {
    private String element;

    public String getElement() {
        return element;
    }

    public void setElement(String element) {
        this.element = element;
    }

    @Override
    public String execute() throws Exception {

        IssueTypeBO itb = IssueTypeBO.getIssueTypeBO();
        List<Iconhbm> list = itb.getIconList();
        ActionContext cx = ActionContext.getContext();
        cx.put("IconList", list);

        return SUCCESS;
    }

}
