package com.nastation.pm.struts.frontend.issue;

import com.opensymphony.xwork2.ActionSupport;

public class DeleteFilterAction extends ActionSupport {
    private String filename;
    private int filterId;

    public String getFilename() {
        return filename;
    }

    public void setFilename(String filename) {
        this.filename = filename;
    }

    public int getFilterId() {
        return filterId;
    }

    public void setFilterId(int filterId) {
        this.filterId = filterId;
    }

}
