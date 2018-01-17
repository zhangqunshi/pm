package com.nastation.pm.struts.frontend.issue;

import com.nastation.pm.Global;
import com.nastation.pm.bean.IssueFilter;
import com.nastation.pm.util.StringUtils;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class SearchIssueTopMenuAction extends ActionSupport {
    private String createNew;
    private boolean flag;
    private boolean flag2;
    private boolean flag3;

    public boolean isFlag3() {
        return flag3;
    }

    public void setFlag3(boolean flag3) {
        this.flag3 = flag3;
    }

    public boolean isFlag2() {
        return flag2;
    }

    public void setFlag2(boolean flag2) {
        this.flag2 = flag2;
    }

    public boolean isFlag() {
        return flag;
    }

    public void setFlag(boolean flag) {
        this.flag = flag;
    }

    public String getCreateNew() {
        return createNew;
    }

    public void setCreateNew(String createNew) {
        this.createNew = createNew;
    }

    @Override
    public String execute() throws Exception {
        boolean isNewLT = false;
        boolean hasUnsaveFilterLT = false;
        boolean hasSavedFilterLT = false;

        if (StringUtils.isNotBlank(getCreateNew()) && "true".equals(getCreateNew())) {
            isNewLT = true;
            ActionContext.getContext().getSession().remove(Global.SESSION_FILTER);
        }
        IssueFilter filterLT = (IssueFilter) ActionContext.getContext().getSession().get(Global.SESSION_FILTER);
        if (filterLT != null) {
            if (filterLT.isNotSaved()) {
                hasUnsaveFilterLT = true;
            } else {
                hasSavedFilterLT = true;
            }
        }

        if (!isNewLT && (hasSavedFilterLT || hasUnsaveFilterLT)) {
            setFlag(true);
        }
        if (isNewLT) {
            setFlag2(true);
        } else {
            if (!hasSavedFilterLT) {
                if (hasUnsaveFilterLT) {
                    setFlag3(true);
                }

            }
        }

        return SUCCESS;
    }

}
