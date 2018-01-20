package com.nastation.pm.struts.frontend.comment;

import com.nastation.pm.beanhbm.Commenthbm;
import com.nastation.pm.business.CommentBO;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class DeleteCommentAction extends ActionSupport {
    private int commentId;
    private String issueRCKey;

    public int getCommentId() {
        return commentId;
    }

    public void setCommentId(int commentId) {
        this.commentId = commentId;
    }

    public String getIssueRCKey() {
        return issueRCKey;
    }

    public void setIssueRCKey(String issueRCKey) {
        this.issueRCKey = issueRCKey;
    }

    @Override
    public String execute() throws Exception {
        Commenthbm comment = new CommentBO().getComment(getCommentId());
        ActionContext cx = ActionContext.getContext();
        cx.put("comment", comment);

        return SUCCESS;
    }

}
