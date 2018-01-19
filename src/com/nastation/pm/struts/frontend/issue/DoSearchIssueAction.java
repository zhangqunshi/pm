package com.nastation.pm.struts.frontend.issue;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.nastation.pm.Global;
import com.nastation.pm.bean.Issue;
import com.nastation.pm.bean.IssueFilter;
import com.nastation.pm.bean.User;
import com.nastation.pm.beanhbm.Projecthbm;
import com.nastation.pm.business.IssueBO;
import com.nastation.pm.business.IssueFilterBO;
import com.nastation.pm.business.ProjectBO;
import com.nastation.pm.business.UserBO;
import com.nastation.pm.util.StringUtils;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class DoSearchIssueAction extends ActionSupport {
    private String mode;
    private String show;
    private String hide;
    private int pid;
    private String type;
    private String query;
    private String summary;
    private String description;
    private String body;
    private String environment;
    private String reporterSelect;
    private String reporter;
    private String assigneeSelect;
    private String assignee;
    private String status;
    private String resolution;
    private String priority;
    private String createdafter;
    private String createdbefore;
    private String duedateafter;
    private String duedatebefore;

    public String getMode() {
        return mode;
    }

    public void setMode(String mode) {
        this.mode = mode;
    }

    public String getShow() {
        return show;
    }

    public void setShow(String show) {
        this.show = show;
    }

    public String getHide() {
        return hide;
    }

    public void setHide(String hide) {
        this.hide = hide;
    }

    public int getPid() {
        return pid;
    }

    public void setPid(int pid) {
        this.pid = pid;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public String getQuery() {
        return query;
    }

    public void setQuery(String query) {
        this.query = query;
    }

    public String getSummary() {
        return summary;
    }

    public void setSummary(String summary) {
        this.summary = summary;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getBody() {
        return body;
    }

    public void setBody(String body) {
        this.body = body;
    }

    public String getEnvironment() {
        return environment;
    }

    public void setEnvironment(String environment) {
        this.environment = environment;
    }

    public String getReporterSelect() {
        return reporterSelect;
    }

    public void setReporterSelect(String reporterSelect) {
        this.reporterSelect = reporterSelect;
    }

    public String getReporter() {
        return reporter;
    }

    public void setReporter(String reporter) {
        this.reporter = reporter;
    }

    public String getAssigneeSelect() {
        return assigneeSelect;
    }

    public void setAssigneeSelect(String assigneeSelect) {
        this.assigneeSelect = assigneeSelect;
    }

    public String getAssignee() {
        return assignee;
    }

    public void setAssignee(String assignee) {
        this.assignee = assignee;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getResolution() {
        return resolution;
    }

    public void setResolution(String resolution) {
        this.resolution = resolution;
    }

    public String getPriority() {
        return priority;
    }

    public void setPriority(String priority) {
        this.priority = priority;
    }

    public String getCreatedafter() {
        return createdafter;
    }

    public void setCreatedafter(String createdafter) {
        this.createdafter = createdafter;
    }

    public String getCreatedbefore() {
        return createdbefore;
    }

    public void setCreatedbefore(String createdbefore) {
        this.createdbefore = createdbefore;
    }

    public String getDuedateafter() {
        return duedateafter;
    }

    public void setDuedateafter(String duedateafter) {
        this.duedateafter = duedateafter;
    }

    public String getDuedatebefore() {
        return duedatebefore;
    }

    public void setDuedatebefore(String duedatebefore) {
        this.duedatebefore = duedatebefore;
    }

    @Override
    public String execute() throws Exception {

        HashMap item = new HashMap();

        String querySql = "";
        List paramValues = new ArrayList();

        // 项目
        if (!"-1".equals(getPid())) {
            querySql += " and project_id= " + pid;
            ProjectBO projectBO = new ProjectBO();
            Projecthbm tempP = projectBO.getProject(getPid());

            if (tempP != null) {

                item.put(IssueFilter.pid, tempP.getName());
            }
        }

        // 问题类型
        if (StringUtils.isNotBlank(getType()) && !"-1".equals(getType())) {
            querySql += " and issue_type_name=? ";
            paramValues.add(type);
            item.put(IssueFilter.issue_type, getType());
        }

        // 查询
        if (StringUtils.isNotBlank(getQuery())) {
            String tempSql = "";

            int count = 0;
            if (StringUtils.isNotBlank(getSummary())) {
                count++;
                tempSql += " issue_name like ? ";
                paramValues.add("%" + getQuery() + "%");
                item.put(IssueFilter.query_summary, getSummary());
            }
            if (StringUtils.isNotBlank(getDescription())) {
                if (count > 0) {
                    tempSql += " or ";
                }
                count++;
                tempSql += " description like ? ";
                paramValues.add("%" + getQuery() + "%");
                item.put(IssueFilter.query_description, getDescription());
            }
            if (StringUtils.isNotBlank(body)) {
                // 暂时去掉
            }
            if (StringUtils.isNotBlank(getEnvironment())) {
                if (count > 0) {
                    tempSql += " or ";
                }
                count++;
                tempSql += " environment like ? ";
                paramValues.add("%" + getQuery() + "%");
                item.put(IssueFilter.query_environment, getEnvironment());
            }
            if (count > 0) {
                querySql += " and ( " + tempSql + " ) ";
                item.put(IssueFilter.query, getQuery());
            }
        }

        // 报告人选择
        if ("issue_no_reporter".equals(getReporterSelect())) {
            item.put(IssueFilter.reporterSelect, reporterSelect);
            querySql += " and reporter_id is null ";
        }
        User currUser = (User) ActionContext.getContext().getSession().get(Global.SESSION_USER);
        if ("issue_current_user".equals(getReporterSelect())) {
            if (currUser != null) {
                item.put(IssueFilter.reporterSelect, getReporterSelect());
                paramValues.add(currUser.getName());
                querySql += " and reporter=? ";
            }
        }
        if ("specificuser".equals(getReporterSelect())) {
            if (StringUtils.isNotBlank(reporter)) {
                UserBO userBO = new UserBO();
                if (userBO.exist(reporter)) { // 如果存在这个用户
                    item.put(IssueFilter.reporterSelect, getReporterSelect());
                    item.put(IssueFilter.reporter, getReporter());
                    paramValues.add(getReporter());
                    querySql += " and reporter=? ";
                }
            }
        }

        // 开发者选择
        if ("unassigned".equals(getAssigneeSelect())) {
            item.put(IssueFilter.assigneeSelect, getAssigneeSelect());
            querySql += " and assignee_id is null ";
        }
        if ("issue_current_user".equals(getAssigneeSelect())) {
            item.put(IssueFilter.assigneeSelect, getAssigneeSelect());
            querySql += " and assignee=? ";
        }
        if ("specificuser".equals(getAssigneeSelect())) {
            if (StringUtils.isNotBlank(getAssignee())) {
                UserBO userBO = new UserBO();
                if (userBO.exist(assignee)) { // 如果存在这个用户
                    item.put(IssueFilter.assigneeSelect, getAssigneeSelect());
                    item.put(IssueFilter.assignee, getAssignee());
                    paramValues.add(getAssignee());
                    querySql += " and assignee=? ";
                }
            }
        }

        // 状态
        if (StringUtils.isNotBlank(getStatus()) && !"-1".equals(getStatus())) {
            item.put(IssueFilter.status, getStatus());
            paramValues.add(getStatus());
            querySql += " and status_name=? ";
        }

        // 匹配的解决情况
        if (StringUtils.isNotBlank(getResolution())) {
            if ("-2".equals(getResolution())) {
                querySql += " and resolution_id is null ";
                item.put(IssueFilter.resolution, "未解决");
            } else if (!"-1".equals(getResolution())) {
                querySql += " and resolution_name=? ";
                paramValues.add(getResolution());
                item.put(IssueFilter.resolution, getResolution());
            }
        }

        // 匹配的优先级
        if (StringUtils.isNotBlank(getPriority()) && !"-1".equals(getPriority())) {
            item.put(IssueFilter.priority, getPriority());
            paramValues.add(getPriority());
            querySql += " and priority_level_name = ? ";
        }

        // 日期时间
        if (StringUtils.isNotBlank(getCreatedafter())) {
            item.put(IssueFilter.createdafter, getCreatedafter());
            paramValues.add(getCreatedafter());
            querySql += " and  create_date > ? ";
        }
        if (StringUtils.isNotBlank(getCreatedbefore())) {
            item.put(IssueFilter.createdbefore, createdbefore);
            paramValues.add(createdbefore);
            querySql += " and  create_date < ? ";
        }
        if (StringUtils.isNotBlank(getDuedateafter())) {
            item.put(IssueFilter.duedateafter, getDuedateafter());
            paramValues.add(getDuedateafter());
            querySql += " and  plan_end_time > ? ";
        }
        if (StringUtils.isNotBlank(getDuedatebefore())) {
            item.put(IssueFilter.duedatebefore, getDuedatebefore());
            paramValues.add(getDuedatebefore());
            querySql += " and  plan_end_time < ? ";
        }

        String sql = "select * from v_issue_detail ";
        if (StringUtils.isNotBlank(querySql)) {
            sql += " where 1=1 " + querySql;
        }
        sql += " order by id desc";

        // 根据查询得到issue列表
        IssueBO issueBO = IssueBO.getIssueBO();
        List<Issue> issueList = issueBO.getIssueSearchList(sql, paramValues);

        // 把issue列表保存到request, 供issueNavigatorR.jsp页面使用
        ActionContext cx = ActionContext.getContext();
        cx.put("issueList", issueList);

        // 新过滤器
        IssueFilter filter = new IssueFilter();
        if (getPid() != -1) {
            filter.setProjectId(getPid());
        }
        filter.setRequestContent(sql);
        filter.setItem(item);
        filter.setParamValues(paramValues);

        // 如果有一个已保存的filter, 就属于更新操作，而不是新建。
        IssueFilter filterInSession = (IssueFilter) ActionContext.getContext().getSession().get(Global.SESSION_FILTER);
        if (filterInSession != null && filterInSession.isSaved()) {
            IssueFilterBO issueFilterBO = new IssueFilterBO();
            boolean changed = filterInSession.isChanged(filter);
            if (changed) { // 如果改变了更新到数据库中
                if (getPid() != -1) {
                    filterInSession.setProjectId(getPid());
                } else {
                    filterInSession.setProjectId(-1);
                }
                filterInSession.setRequestContent(sql);
                filterInSession.setItem(item);
                filterInSession.setParamValues(paramValues);
                issueFilterBO.updateFilter(filterInSession);
                ActionContext.getContext()
                        .setSession((Map<String, Object>) new HashMap().put(Global.SESSION_FILTER, filterInSession));
            }
        } else {

            ActionContext.getContext()
                    .setSession((Map<String, Object>) new HashMap().put(Global.SESSION_FILTER, filter));
        }

        // 判断点击那一个按钮
        String mode = null;
        if (StringUtils.isNotBlank(getShow())) {
            mode = "show";
        }
        if (StringUtils.isNotBlank(getHide())) {
            mode = "hide";
        }

        return SUCCESS;
    }

}
