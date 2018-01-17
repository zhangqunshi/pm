package com.nastation.pm.struts.frontend.comment;

import com.nastation.pm.beanhbm.Commenthbm;
import com.nastation.pm.business.CommentBO;
import com.nastation.pm.util.StringUtils;
import com.opensymphony.xwork2.ActionSupport;

public class DoUpdateCommentDetailAction extends ActionSupport {
    private int commentId;
    private String issueRCKey;
    private String CommentContent;

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

    public String getCommentContent() {
        return CommentContent;
    }

    public void setCommentContent(String commentContent) {
        CommentContent = commentContent;
    }

    @Override
    public String execute() throws Exception {

        CommentBO commbo = CommentBO.getCommentBO();
        Commenthbm c = new Commenthbm();

        c.setCommentContent(StringUtils.removeHtmlTag(getCommentContent()));
        c.setId(getCommentId());
        commbo.updateComment(c);
        setIssueRCKey(java.net.URLEncoder.encode(getIssueRCKey(), "UTF-8"));

        return SUCCESS;
    }

}
