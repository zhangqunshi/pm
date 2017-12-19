package com.nastation.pm.bean;

/**
 * 
 * @author liuliehui 备注的javaBean类
 */
public class Comment {
	public int id; // 备注ID
	public String commentContent; // 备注内容
	public String author; // 创建人
	public Issuehb issueId;
	public java.util.Date createDate; // 备注创建时间

	public Comment() {

	}

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

	public Issuehb getIssueId() {
		return issueId;
	}

	public void setIssueId(Issuehb issueId) {
		this.issueId = issueId;
	}

	public java.util.Date getCreateDate() {
		return createDate;
	}

	public void setCreateDate(java.util.Date createDate) {
		this.createDate = createDate;
	}

}
