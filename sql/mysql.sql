drop database if exists projectmanagement;

create database projectmanagement;

use projectmanagement;


drop table if exists t_comment;

drop table if exists t_component;

drop table if exists t_filter_parameter_value;

drop table if exists t_filter_summary;

drop table if exists t_group;

drop table if exists t_group_user;

drop table if exists t_icon;

drop table if exists t_issue;

drop table if exists t_issue_change_log;

drop table if exists t_issue_priority;

drop table if exists t_issue_status;

drop table if exists t_issue_type;

drop table if exists t_permission;

drop table if exists t_permission_assignee;

drop table if exists t_permission_scheme;

drop table if exists t_project;

drop table if exists t_project_category;

drop table if exists t_project_issue_sequence;

drop table if exists t_project_user;

drop table if exists t_resolution;

drop table if exists t_role;

drop table if exists t_search_request;

drop table if exists t_user;

/*==============================================================*/
/* Table: t_comment                                             */
/*==============================================================*/
create table t_comment
(
   id                   int not null auto_increment,
   comment_content      text,
   issue_id             int,
   author               varchar(50),
   create_date          datetime,
   primary key (id)
)
comment = "备注表";

/*==============================================================*/
/* Table: t_component                                           */
/*==============================================================*/
create table t_component
(
   id                   int not null auto_increment,
   project_id           int,
   name                 varchar(30) not null,
   description          varchar(255),
   leader               varchar(50),
   create_time          datetime,
   primary key (id)
)
comment = "项目模块表";

/*==============================================================*/
/* Table: t_filter_parameter_value                              */
/*==============================================================*/
create table t_filter_parameter_value
(
   id                   int not null auto_increment,
   param_value          text,
   param_order          int,
   filter_id            int,
   primary key (id)
)
comment = "过滤器sql参数值";

/*==============================================================*/
/* Table: t_filter_summary                                      */
/*==============================================================*/
create table t_filter_summary
(
   id                   int not null auto_increment,
   request_id           int,
   filter_summary_key   varchar(50),
   filter_summary_value varchar(100),
   primary key (id)
);

/*==============================================================*/
/* Table: t_group                                               */
/*==============================================================*/
create table t_group
(
   id                   int not null auto_increment,
   name                 varchar(30) not null,
   permission_scheme_id int,
   create_date          datetime,
   primary key (id)
)
comment = "项目组表, 包括多个用户";

/*==============================================================*/
/* Index: Index_1                                               */
/*==============================================================*/
create unique index Index_1 on t_group
(
   name
);

/*==============================================================*/
/* Table: t_group_user                                          */
/*==============================================================*/
create table t_group_user
(
   id                   int not null auto_increment,
   user_id              int,
   group_id             int,
   primary key (id)
)
comment = "组和用户表";

/*==============================================================*/
/* Table: t_icon                                                */
/*==============================================================*/
create table t_icon
(
   id                   int not null auto_increment,
   filename             varchar(255),
   icon_type            int comment '1->问题状态图标  2->问题类型图标',
   primary key (id)
)
comment = "问题图标";

/*==============================================================*/
/* Table: t_issue                                               */
/*==============================================================*/
create table t_issue
(
   id                   int not null auto_increment,
   issue_key            varchar(50),
   issue_type_id        int,
   name                 varchar(255) not null,
   priority_level_id    int,
   start_time           datetime comment '程序员第一个开始处理的时间',
   end_time             datetime comment '最后一次close的时间',
   plan_end_time        datetime,
   component_id         int,
   assignee_id          int,
   reporter_id          int,
   environment          varchar(255),
   description          text,
   project_id           int,
   last_update_date     datetime,
   create_date          datetime,
   issue_status         int,
   resolution_id        int,
   primary key (id)
)
comment = "问题表";

/*==============================================================*/
/* Table: t_issue_change_log                                    */
/*==============================================================*/
create table t_issue_change_log
(
   id                   int not null auto_increment,
   issue_id             int,
   change_field         varchar(50),
   old_value            varchar(255),
   new_value            varchar(255),
   create_date          datetime,
   primary key (id)
)
comment = "问题变动记录";

/*==============================================================*/
/* Table: t_issue_priority                                      */
/*==============================================================*/
create table t_issue_priority
(
   id                   int not null auto_increment,
   name                 varchar(30) not null,
   description          varchar(255),
   priority_color       varchar(10),
   icon_url             varchar(255),
   primary key (id)
)
comment = "问题优先级表";

/*==============================================================*/
/* Table: t_issue_status                                        */
/*==============================================================*/
create table t_issue_status
(
   id                   int not null auto_increment,
   name                 varchar(30) not null,
   description          varchar(255),
   icon_url             varchar(255),
   primary key (id)
)
comment = "问题状态";

/*==============================================================*/
/* Table: t_issue_type                                          */
/*==============================================================*/
create table t_issue_type
(
   id                   int not null auto_increment,
   name                 varchar(30) not null,
   description          varchar(255),
   icon_url             varchar(255),
   create_date          datetime,
   primary key (id)
)
comment = "问题类型表";

/*==============================================================*/
/* Table: t_permission                                          */
/*==============================================================*/
create table t_permission
(
   id                   int not null auto_increment,
   name                 varchar(50) not null,
   description          varchar(255),
   type_name            varchar(50),
   primary key (id)
);

/*==============================================================*/
/* Table: t_permission_assignee                                 */
/*==============================================================*/
create table t_permission_assignee
(
   id                   int not null auto_increment,
   permission_id        int,
   assignee_type        varchar(50) not null,
   assignee             varchar(50) not null comment '是Role, group, user之一',
   scheme_id            int,
   create_time          datetime,
   primary key (id)
);

/*==============================================================*/
/* Table: t_permission_scheme                                   */
/*==============================================================*/
create table t_permission_scheme
(
   id                   int not null auto_increment,
   name                 varchar(255) not null,
   description          varchar(255),
   create_date          datetime,
   primary key (id)
);

/*==============================================================*/
/* Table: t_project                                             */
/*==============================================================*/
create table t_project
(
   id                   int not null auto_increment,
   name                 varchar(50) not null,
   project_key          varchar(30) not null,
   description          varchar(255),
   url                  varchar(255),
   leader               varchar(50),
   category_id          int,
   permission_scheme_id int,
   create_date          datetime,
   primary key (id)
)
comment = "项目基本信息表";

/*==============================================================*/
/* Index: Index_1                                               */
/*==============================================================*/
create unique index Index_1 on t_project
(
   name
);

/*==============================================================*/
/* Index: Index_2                                               */
/*==============================================================*/
create unique index Index_2 on t_project
(
   project_key
);

/*==============================================================*/
/* Table: t_project_category                                    */
/*==============================================================*/
create table t_project_category
(
   id                   int not null auto_increment,
   name                 varchar(30) not null,
   description          varchar(255),
   create_date          datetime,
   primary key (id)
)
comment = "项目分类表";

/*==============================================================*/
/* Table: t_project_issue_sequence                              */
/*==============================================================*/
create table t_project_issue_sequence
(
   id                   int not null auto_increment,
   project_id           int,
   max_id_value         int,
   primary key (id)
);

/*==============================================================*/
/* Table: t_project_user                                        */
/*==============================================================*/
create table t_project_user
(
   id                   int not null auto_increment,
   project_id           int,
   user_id              int,
   role_id              int,
   create_date          datetime,
   primary key (id)
)
comment = "项目用户表";

/*==============================================================*/
/* Table: t_resolution                                          */
/*==============================================================*/
create table t_resolution
(
   id                   int not null auto_increment,
   name                 varchar(50),
   description          varchar(255),
   is_default           int,
   primary key (id)
);

/*==============================================================*/
/* Table: t_role                                                */
/*==============================================================*/
create table t_role
(
   id                   int not null auto_increment,
   role_name            varchar(50) not null,
   role_desc            varchar(255),
   create_date          datetime,
   primary key (id)
);

/*==============================================================*/
/* Index: Index_1                                               */
/*==============================================================*/
create unique index Index_1 on t_role
(
   role_name
);

/*==============================================================*/
/* Table: t_search_request                                      */
/*==============================================================*/
create table t_search_request
(
   id                   int not null auto_increment,
   filter_name          varchar(50),
   author_name          varchar(50),
   description          varchar(255),
   project_id           int,
   request_content      text,
   primary key (id)
);

/*==============================================================*/
/* Table: t_user                                                */
/*==============================================================*/
create table t_user
(
   id                   int not null auto_increment,
   username             varchar(50) not null,
   password             varchar(50) not null,
   fullname             varchar(50),
   email                varchar(100),
   create_date          datetime,
   primary key (id)
)
comment = "用户表";

/*==============================================================*/
/* Index: Index_1                                               */
/*==============================================================*/
create unique index Index_1 on t_user
(
   username
);

alter table t_comment add constraint FK_Reference_10 foreign key (issue_id)
      references t_issue (id) on delete restrict on update restrict;

alter table t_component add constraint FK_Reference_12 foreign key (project_id)
      references t_project (id) on delete restrict on update restrict;

alter table t_filter_parameter_value add constraint FK_Reference_26 foreign key (filter_id)
      references t_search_request (id) on delete cascade on update restrict;

alter table t_filter_summary add constraint FK_Reference_25 foreign key (request_id)
      references t_search_request (id) on delete cascade on update restrict;

alter table t_group add constraint FK_Reference_16 foreign key (permission_scheme_id)
      references t_permission_scheme (id) on delete restrict on update restrict;

alter table t_group_user add constraint FK_Reference_14 foreign key (user_id)
      references t_user (id) on delete restrict on update restrict;

alter table t_group_user add constraint FK_Reference_15 foreign key (group_id)
      references t_group (id) on delete restrict on update restrict;

alter table t_issue add constraint FK_Reference_19 foreign key (issue_status)
      references t_issue_status (id) on delete restrict on update restrict;

alter table t_issue add constraint FK_Reference_5 foreign key (project_id)
      references t_project (id) on delete restrict on update restrict;

alter table t_issue add constraint FK_Reference_6 foreign key (issue_type_id)
      references t_issue_type (id) on delete restrict on update restrict;

alter table t_issue add constraint FK_Reference_7 foreign key (priority_level_id)
      references t_issue_priority (id) on delete restrict on update restrict;

alter table t_issue add constraint FK_Reference_8 foreign key (assignee_id)
      references t_user (id) on delete restrict on update restrict;

alter table t_issue add constraint FK_Reference_9 foreign key (reporter_id)
      references t_user (id) on delete restrict on update restrict;

alter table t_issue_change_log add constraint FK_Reference_11 foreign key (issue_id)
      references t_issue (id) on delete restrict on update restrict;

alter table t_permission_assignee add constraint FK_Reference_20 foreign key (permission_id)
      references t_permission (id) on delete restrict on update restrict;

alter table t_permission_assignee add constraint FK_Reference_22 foreign key (scheme_id)
      references t_permission_scheme (id) on delete restrict on update restrict;

alter table t_project add constraint FK_Reference_13 foreign key (category_id)
      references t_project_category (id) on delete restrict on update restrict;

alter table t_project add constraint FK_Reference_23 foreign key (permission_scheme_id)
      references t_permission_scheme (id) on delete restrict on update restrict;

alter table t_project_issue_sequence add constraint FK_Reference_21 foreign key (project_id)
      references t_project (id) on delete restrict on update restrict;

alter table t_project_user add constraint FK_Reference_1 foreign key (project_id)
      references t_project (id) on delete restrict on update restrict;

alter table t_project_user add constraint FK_Reference_2 foreign key (user_id)
      references t_user (id) on delete restrict on update restrict;

alter table t_project_user add constraint FK_Reference_3 foreign key (role_id)
      references t_role (id) on delete restrict on update restrict;

alter table t_search_request add constraint FK_Reference_24 foreign key (project_id)
      references t_project (id) on delete restrict on update restrict;




create view v_issue_detail as 
select 
a.id, a.issue_key, a.issue_type_id, b.name as issue_type_name, b.icon_url as type_icon, 
a.name as issue_name,  a.priority_level_id, c.name as priority_level_name, c.icon_url as priority_icon, a.start_time, 
a.end_time, a.plan_end_time,  a.component_id, d.name as component_name, a.assignee_id, 
e.username as assignee, e.fullname as assignee_fullname, a.reporter_id, f.username as reporter, f.fullname as reporter_fullname, a.environment, a.description, 
a.project_id, g.name as project_name, a.last_update_date, a.create_date, a.issue_status, 
h.name as status_name, h.icon_url as status_icon, a.resolution_id, i.name  as resolution_name 
from t_issue a  
left join t_issue_type b on (b.id=a.issue_type_id)  
left join t_issue_priority c on (c.id=a.priority_level_id)  
left join t_component d on (d.id=a.component_id)  
left join t_user e on (e.id=a.assignee_id)  
left join t_user f on (f.id=a.reporter_id)  
left join t_project g on (g.id=a.project_id)  
left join t_issue_status h on (h.id=a.issue_status)  
left join t_resolution i on (i.id = a.resolution_id) 
