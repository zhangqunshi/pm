package com.nastation.pm.bean;

/**
 * 
 * @author liuliehui 备注的javaBean类
 */
public class Comment {
	public int id; // 备注ID
	public String commentContent; // 备注内容
	public String author; // 创建人
	public int issueId; // 问题ID
	public String createDate; // 备注创建时间

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

	public int getIssueId() {
		return issueId;
	}

	public void setIssueId(int issueId) {
		this.issueId = issueId;
	}

	public String getCreateDate() {
		return createDate;
	}

	public void setCreateDate(String createDate) {
		this.createDate = createDate;
	}

}
