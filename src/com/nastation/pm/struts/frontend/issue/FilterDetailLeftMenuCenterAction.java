package com.nastation.pm.struts.frontend.issue;

import java.util.HashMap;
import java.util.Iterator;

import com.nastation.pm.Global;
import com.nastation.pm.bean.IssueFilter;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class FilterDetailLeftMenuCenterAction extends ActionSupport {
    private boolean flag;

    public boolean isFlag() {
        return flag;
    }

    public void setFlag(boolean flag) {
        this.flag = flag;
    }

    @Override
    public String execute() throws Exception {
        IssueFilter filterSummary = (IssueFilter) ActionContext.getContext().getSession().get(Global.SESSION_FILTER);
        HashMap summaryMap = new HashMap();
        if (filterSummary != null) {
            setFlag(true);
            HashMap item = filterSummary.getItem();
            if (item != null && item.size() > 0) {
                setFlag(true);
                Iterator it = item.keySet().iterator();
                while (it.hasNext()) {
                    String key = (String) it.next();
                    summaryMap.put(key, item.get(key));
                }
            }
        }

        return SUCCESS;
    }

}
