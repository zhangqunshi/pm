package com.nastation.pm.struts.frontend.comment;

import com.nastation.pm.Global;
import com.nastation.pm.bean.User;
import com.nastation.pm.beanhbm.Commenthbm;
import com.nastation.pm.business.CommentBO;
import com.nastation.pm.business.IssueBO;
import com.nastation.pm.util.StringUtils;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class DoAddCommentAction extends ActionSupport {
    private int issueId;
    private String issueKey;
    private String commentContent;

    public String getCommentContent() {
        return commentContent;
    }

    public void setCommentContent(String commentContent) {
        this.commentContent = commentContent;
    }

    public int getIssueId() {
        return issueId;
    }

    public void setIssueId(int issueId) {
        this.issueId = issueId;
    }

    public String getIssueKey() {
        return issueKey;
    }

    public void setIssueKey(String issueKey) {
        this.issueKey = issueKey;
    }

    @Override
    public String execute() throws Exception {

        setIssueKey(java.net.URLEncoder.encode(getIssueKey(), "UTF-8"));
        User author = (User) ActionContext.getContext().getSession().get(Global.SESSION_USER);
        IssueBO ib = IssueBO.getIssueBO();
        Commenthbm c = new Commenthbm();
        c.setCommentContent(StringUtils.removeHtmlTag(getCommentContent()));
        c.setIssue(ib.getIssue(getIssueId()));
        c.setAuthor(author.getName());
        CommentBO bo = CommentBO.getCommentBO();
        bo.addComment(c);

        return SUCCESS;
    }

}
