package com.nastation.pm.struts.frontend.issue;

import com.nastation.pm.bean.IssueFilter;

public class ManageFilters {
    private String color;
    private IssueFilter filter;

    public String getColor() {
        return color;
    }

    public void setColor(String color) {
        this.color = color;
    }

    public IssueFilter getFilter() {
        return filter;
    }

    public void setFilter(IssueFilter filter) {
        this.filter = filter;
    }

}
