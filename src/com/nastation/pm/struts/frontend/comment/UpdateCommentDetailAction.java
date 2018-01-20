package com.nastation.pm.struts.frontend.comment;

import com.nastation.pm.beanhbm.Commenthbm;
import com.nastation.pm.business.CommentBO;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class UpdateCommentDetailAction extends ActionSupport {
    private int commentId;
    private String issueRCKey;
    private String commentContent1;

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

    public String getCommentContent1() {
        return commentContent1;
    }

    public void setCommentContent1(String commentContent1) {
        this.commentContent1 = commentContent1;
    }

    @Override
    public String execute() throws Exception {

        if (getCommentContent1() == null) {
            setCommentContent1("");
        }

        CommentBO commbo = CommentBO.getCommentBO();
        Commenthbm comm = commbo.getComment(getCommentId());
        ActionContext cx = ActionContext.getContext();
        cx.put("comment", comm);

        return SUCCESS;
    }

}
