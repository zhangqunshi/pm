package com.nastation.pm.struts.backend.issue.priority;

import java.util.List;

import com.nastation.pm.beanhbm.Iconhbm;
import com.nastation.pm.business.IssuePriorityBO;
import com.opensymphony.xwork2.ActionSupport;

public class PriorityIconPickerAction extends ActionSupport {
    private String element;

    public String getElement() {
        return element;
    }

    public void setElement(String element) {
        this.element = element;
    }

    @Override
    public String execute() throws Exception {

        IssuePriorityBO itb = IssuePriorityBO.getIssuePriorityBO();
        List<Iconhbm> list = itb.getIconList();

        return SUCCESS;
    }

}
