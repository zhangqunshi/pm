package com.nastation.pm.struts.frontend.issue;

import com.nastation.pm.beanhbm.IssuePriorityhbm;

public class AddIssueStep2 {
    private boolean major;
    private IssuePriorityhbm ip;

    public IssuePriorityhbm getIp() {
        return ip;
    }

    public void setIp(IssuePriorityhbm ip) {
        this.ip = ip;
    }

    public boolean isMajor() {
        return major;
    }

    public void setMajor(boolean major) {
        this.major = major;
    }

}
