package com.nastation.pm.struts.frontend.issue;

import com.nastation.pm.Global;
import com.nastation.pm.PermissionConstants;
import com.nastation.pm.bean.Issue;
import com.nastation.pm.bean.User;
import com.nastation.pm.util.StringUtils;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class IssueDetailLeftMenuBottomAction extends ActionSupport {
    private String action;
    private boolean assign;
    private boolean edit;
    private boolean add;
    private boolean allown;
    private boolean move;

    public boolean isMove() {
        return move;
    }

    public void setMove(boolean move) {
        this.move = move;
    }

    public boolean isAssign() {
        return assign;
    }

    public void setAssign(boolean assign) {
        this.assign = assign;
    }

    public boolean isEdit() {
        return edit;
    }

    public void setEdit(boolean edit) {
        this.edit = edit;
    }

    public boolean isAdd() {
        return add;
    }

    public void setAdd(boolean add) {
        this.add = add;
    }

    public boolean isAllown() {
        return allown;
    }

    public void setAllown(boolean allown) {
        this.allown = allown;
    }

    public String getAction() {
        return action;
    }

    public void setAction(String action) {
        this.action = action;
    }

    @Override
    public String execute() throws Exception {

        if (StringUtils.isNotBlank(action)) {
            ActionContext.getContext().put("action", getAction());
        }
        Issue issueLCMB = (Issue) ActionContext.getContext().get("issue");
        if (issueLCMB == null) {
            return SUCCESS;
        }
        ActionContext cx = ActionContext.getContext();
        cx.put("issue", issueLCMB);
        User currentUser = (User) ActionContext.getContext().get(Global.SESSION_USER);

        if (currentUser.validate(issueLCMB.getProjectId(), PermissionConstants.ASSIGN_ISSUES)) {
            setAssign(true);
        }
        if (currentUser.validate(issueLCMB.getProjectId(), PermissionConstants.ADD_COMMENTS)) {
            setAdd(true);
        }
        if (currentUser.validate(issueLCMB.getProjectId(), PermissionConstants.DELETE_ALL_COMMENTS)
                || currentUser.validate(issueLCMB.getProjectId(), PermissionConstants.DELETE_OWN_COMMENTS)) {
            setAllown(true);
        }
        if (currentUser.validate(issueLCMB.getProjectId(), PermissionConstants.MOVE_ISSUES)) {
            setMove(true);
        }

        return SUCCESS;
    }

}
