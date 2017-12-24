package com.nastation.pm.beanhbm;

public class Commenthbm {

    public int id;
    public String commentContent;
    public String author;
    public Issuehbm issue;
    public java.util.Date createDate;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getCommentContent() {
        return commentContent;
    }

    public void setCommentContent(String commentContent) {
        this.commentContent = commentContent;
    }

    public String getAuthor() {
        return author;
    }

    public void setAuthor(String author) {
        this.author = author;
    }

    public Issuehbm getIssue() {
        return issue;
    }

    public void setIssue(Issuehbm issue) {
        this.issue = issue;
    }

    public java.util.Date getCreateDate() {
        return createDate;
    }

    public void setCreateDate(java.util.Date createDate) {
        this.createDate = createDate;
    }

}
