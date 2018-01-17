package com.nastation.pm.struts.frontend.comment;

import java.util.List;

import com.nastation.pm.bean.Issue;
import com.nastation.pm.beanhbm.Commenthbm;
import com.nastation.pm.business.CommentBO;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class ViewCommentsAction extends ActionSupport {
    private boolean flag;

    public boolean isFlag() {
        return flag;
    }

    public void setFlag(boolean flag) {
        this.flag = flag;
    }

    @Override
    public String execute() throws Exception {

        Issue issueRC = (Issue) ActionContext.getContext().get("issue");
        CommentBO bo = CommentBO.getCommentBO();
        List<Commenthbm> commentlist = bo.getCommentLists(issueRC.getId());
        if (commentlist == null || commentlist.size() == 0) {
            setFlag(true);
        } else {
            ActionContext cx = ActionContext.getContext();
            cx.put("comments", commentlist);
        }

        return SUCCESS;
    }

}
