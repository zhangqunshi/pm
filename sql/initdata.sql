use projectmanagement;

delete from t_issue;
delete from t_icon;
delete from t_issue_status;
delete from t_project_user;
delete from t_user;
delete from t_issue_type;
delete from t_resolution;
delete from t_group_user;
delete from t_group;

/*==============================================================*/
/* Table: t_issue_status                                        */
/*==============================================================*/
insert t_issue_status values(1, "Open", "The issue is open and ready for the assignee to start work on it.", "/images/icons/status/status_open.gif");
insert t_issue_status values(2, "In Progress", "This issue is being actively worked on at the moment by the assignee.", "/images/icons/status/status_inprogress.gif");
insert t_issue_status values(3, "Reopened", "This issue was once resolved, but the resolution was deemed incorrect. From here issues are either marked assigned or resolved. ", "/images/icons/status/status_reopened.gif");
insert t_issue_status values(4, "Resolved", "A resolution has been taken, and it is awaiting verification by reporter. From here issues are either reopened, or are closed. ", "/images/icons/status/status_resolved.gif");
insert t_issue_status values(5, "Closed", "The issue is considered finished, the resolution is correct. Issues which are closed can be reopened. ", "/images/icons/status/status_closed.gif");

/*==============================================================*/
/* Table: t_icon                                        */
/*==============================================================*/
/* 问题状态icon */
insert t_icon values(1, "/images/icons/status/status_open.gif", 1);
insert t_icon values(2, "/images/icons/status/status_inprogress.gif", 1);
insert t_icon values(3, "/images/icons/status/status_reopened.gif", 1);
insert t_icon values(4, "/images/icons/status/status_resolved.gif", 1);
insert t_icon values(5, "/images/icons/status/status_closed.gif", 1);

/* 问题类型icon */
insert t_icon values(6, "/images/icons/issuetype/bug.gif", 2);
insert t_icon values(7, "/images/icons/issuetype/improvement.gif", 2);
insert t_icon values(8, "/images/icons/issuetype/newfeature.gif", 2);
insert t_icon values(9, "/images/icons/issuetype/task.gif", 2);

/* 问题优先级icon */
insert t_icon values(10, "/images/icons/priority/priority_blocker.gif", 3);
insert t_icon values(11, "/images/icons/priority/priority_critical.gif", 3);
insert t_icon values(12, "/images/icons/priority/priority_major.gif", 3);
insert t_icon values(13, "/images/icons/priority/priority_minor.gif", 3);
insert t_icon values(14, "/images/icons/priority/priority_trivial.gif", 3);


/*==============================================================*/
/* Table: t_user                                        */
/*==============================================================*/
insert t_user values(1, "admin", "123", "administrator", "zhangqunshi@126.com", curdate());


/*==============================================================*/
/* Table: t_issue_type                                        */
/*==============================================================*/
insert t_issue_type values(1, "Bug", "A problem which impairs or prevents the functions of the product.", "/images/icons/issuetype/bug.gif", curdate());
insert t_issue_type values(2, "Improvement", "An improvement or enhancement to an existing feature or task.", "/images/icons/issuetype/improvement.gif", curdate());
insert t_issue_type values(3, "New Feature", "A new feature of the product, which has yet to be developed.", "/images/icons/issuetype/newfeature.gif", curdate());
insert t_issue_type values(4, "Task", "A task that needs to be done.", "/images/icons/issuetype/task.gif", curdate());

/*==============================================================*/
/* Table: t_issue_priority                                        */
/*==============================================================*/
insert t_issue_priority values(1, "Blocker", "Blocks development and/or testing work, production could not run.", "#cc0000", "/images/icons/priority/priority_blocker.gif");
insert t_issue_priority values(2, "Critical", "Crashes, loss of data, severe memory leak.", "#ff0000", "/images/icons/priority/priority_critical.gif");
insert t_issue_priority values(3, "Major", "Major loss of function.", "#009900", "/images/icons/priority/priority_major.gif");
insert t_issue_priority values(4, "Minor", "Minor loss of function, or other problem where easy workaround is present.", "#006600", "/images/icons/priority/priority_minor.gif");
insert t_issue_priority values(5, "Trivial", "Cosmetic problem like misspelt words or misaligned text.", "#003300", "/images/icons/priority/priority_trivial.gif");


/*==============================================================*/
/* Table: t_role                                        */
/*==============================================================*/
insert t_role values(1, "Administrators", "A project role that represents administrators in a project", curdate());
insert t_role values(2, "Developers", "A project role that represents developers in a project", curdate());
insert t_role values(3, "Users", "A project role that represents users in a project", curdate());

/*==============================================================*/
/* Table: t_resolution                                        */
/*==============================================================*/
insert t_resolution values(1, "Fixed", "A fix for this issue is checked into the tree and tested.", 1);
insert t_resolution values(2, "Won\'t Fix", "The problem described is an issue which will never be fixed.", 0);
insert t_resolution values(3, "Duplicate", "The problem is a duplicate of an existing issue.", 0);
insert t_resolution values(4, "Incomplete", "The problem is not completely described.", 0);
insert t_resolution values(5, "Cannot Reproduce", "All attempts at reproducing this issue failed, or not enough information was available to reproduce the issue.Reading the code produces no clues as to why this behavior would occur. If more information appears later, please reopen the issue.", 0);

  	  
  	  
/*==============================================================*/
/* Table: t_permission_scheme                                        */
/*==============================================================*/	 
insert t_permission_scheme values(1, "Default Permission Scheme", "This is the default Permission Scheme. Any new projects that are created will be assigned this scheme", curdate());


/*==============================================================*/
/* Table: t_permission                                        */
/*==============================================================*/	 
insert t_permission values(1, "Administer Projects", "Ability to administer a project", "Project Permissions");
insert t_permission values(2, "Browse Projects", "Ability to browse projects and the issues within them.", "Project Permissions");

insert t_permission values(3, "Create Issues", "Ability to create issues.", "Issue Permissions");
insert t_permission values(4, "Edit Issues", "Ability to edit issues.", "Issue Permissions");
insert t_permission values(5, "Schedule Issues", "Ability to set or edit an issue's due date.", "Issue Permissions");
insert t_permission values(6, "Move Issues", "Ability to move issues between projects or between workflows of the same project (if applicable). Note the user can only move issues to a project he or she has the create permission for.", "Issue Permissions");
insert t_permission values(7, "Assign Issues", "Ability to assign issues to other people.", "Issue Permissions");
insert t_permission values(8, "Assignable User", "Users with this permission may be assigned to issues.", "Issue Permissions");
insert t_permission values(9, "Resolve Issues", "Ability to resolve and reopen issues. This includes the ability to set a fix version.", "Issue Permissions");
insert t_permission values(10, "Close Issues", "Ability to close issues. Often useful where your developers resolve issues, and a QA department closes them.", "Issue Permissions");
insert t_permission values(11, "Modify Reporter", "Ability to modify the reporter when creating or editing an issue.", "Issue Permissions");
insert t_permission values(12, "Delete Issues", "Ability to delete issues.", "Issue Permissions");

insert t_permission values(13, "Add Comments", "Ability to comment on issues.", "Comments Permissions");
insert t_permission values(14, "Edit All Comments", "Ability to edit all comments made on issues.", "Comments Permissions");
insert t_permission values(15, "Edit Own Comments", "Ability to edit own comments made on issues.", "Comments Permissions");
insert t_permission values(16, "Delete All Comments", "Ability to delete all comments made on issues.", "Comments Permissions");
insert t_permission values(17, "Delete Own Comments", "Ability to delete own comments made on issues.", "Comments Permissions");
/*==============================================================*/
/* Table: t_permission_assignee                                 */
/*==============================================================*/	 
insert t_permission_assignee values(1,1,"ProjectRole","Administrators",1,curdate());
insert t_permission_assignee values(2,2,"ProjectRole","Administrators",1,curdate());

insert t_permission_assignee values(3,3,"ProjectRole","Administrators",1,curdate());
insert t_permission_assignee values(4,4,"ProjectRole","Administrators",1,curdate());
insert t_permission_assignee values(5,5,"ProjectRole","Administrators",1,curdate());
insert t_permission_assignee values(6,6,"ProjectRole","Administrators",1,curdate());
insert t_permission_assignee values(7,7,"ProjectRole","Administrators",1,curdate());
insert t_permission_assignee values(8,8,"ProjectRole","Administrators",1,curdate());
insert t_permission_assignee values(9,9,"ProjectRole","Administrators",1,curdate());
insert t_permission_assignee values(10,10,"ProjectRole","Administrators",1,curdate());
insert t_permission_assignee values(11,11,"ProjectRole","Administrators",1,curdate());
insert t_permission_assignee values(12,12,"ProjectRole","Administrators",1,curdate());
insert t_permission_assignee values(13,13,"ProjectRole","Administrators",1,curdate());
insert t_permission_assignee values(14,14,"ProjectRole","Administrators",1,curdate());
insert t_permission_assignee values(15,15,"ProjectRole","Administrators",1,curdate());
insert t_permission_assignee values(16,16,"ProjectRole","Administrators",1,curdate());
insert t_permission_assignee values(17,17,"ProjectRole","Administrators",1,curdate());

/*==============================================================*/
/* Table: t_group                                        */
/*==============================================================*/
insert t_group values(1, "administrators", 1,curdate());
insert t_group values(2, "developers", 1,curdate());
insert t_group values(3, "users", 1,curdate());

/*==============================================================*/
/* Table: t_group_user                                        */
/*==============================================================*/
insert t_group_user values(1,1,1);
