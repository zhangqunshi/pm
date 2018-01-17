package com.nastation.pm.struts.frontend.comment;

import com.nastation.pm.business.CommentBO;
import com.opensymphony.xwork2.ActionSupport;

public class DoDeleteCommentAction extends ActionSupport {
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
        CommentBO commbo = CommentBO.getCommentBO();
        commbo.deleteComment(getCommentId());
        setIssueRCKey(java.net.URLEncoder.encode(getIssueRCKey(), "UTF-8"));

        return SUCCESS;
    }

}
