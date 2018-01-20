package com.nastation.pm.struts.frontend.project;

import java.util.List;

import com.nastation.pm.bean.IssueFilter;
import com.nastation.pm.beanhbm.Projecthbm;

public class ViewProjectFront {
    private Projecthbm proj;
    private List<IssueFilter> list;

    public Projecthbm getProj() {
        return proj;
    }

    public void setProj(Projecthbm proj) {
        this.proj = proj;
    }

    public List<IssueFilter> getList() {
        return list;
    }

    public void setList(List<IssueFilter> list) {
        this.list = list;
    }

}
