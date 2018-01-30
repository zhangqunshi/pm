package com.nastation.pm.bean;

import java.util.HashMap;
import java.util.List;

public class IssueFilter {

    // ----保存在item中的key值 -------
    public static final String pid = "项目";
    public static final String issue_type = "问题类型";
    public static final String query = "查询";
    public static final String query_summary = "概要";
    public static final String query_description = "描述";
    public static final String query_body = "备注";
    public static final String query_environment = "环境";
    public static final String reporterSelect = "报告人选择";
    public static final String reporter = "报告人";
    public static final String assigneeSelect = "开发者选择";
    public static final String assignee = "开发者";
    public static final String status = "状态";
    public static final String resolution = "匹配的解决情况";
    public static final String priority = "匹配的优先级";
    public static final String createdafter = "创建..之后";
    public static final String createdbefore = "创建..之前";
    public static final String duedateafter = "逾期..之后";
    public static final String duedatebefore = "逾期..之前";

    private String filterName;
    private int id;
    private String authorName;
    private String description;
    private int projectId;
    private String projectName;
    private String requestContent;
    private HashMap item;
    private List paramValues;

    public boolean isSaved() {
        return ((id != 0) && (filterName != null));
    }

    public boolean isNotSaved() {
        return !isSaved();
    }

    public HashMap getItem() {
        return item;
    }

    public void setItem(HashMap item) {
        this.item = item;
    }

    public String getFilterName() {
        return filterName;
    }

    public void setFilterName(String filterName) {
        this.filterName = filterName;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getAuthorName() {
        return authorName;
    }

    public void setAuthorName(String authorName) {
        this.authorName = authorName;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public int getProjectId() {
        return projectId;
    }

    public void setProjectId(int projectId) {
        this.projectId = projectId;
    }

    public String getRequestContent() {
        return requestContent;
    }

    public void setRequestContent(String requestContent) {
        this.requestContent = requestContent;
    }

    public String getItemValue(String key) {
        if (item != null) {
            return (String) item.get(key);
        }
        return null;
    }

    public String getProjectName() {
        return projectName;
    }

    public void setProjectName(String projectName) {
        this.projectName = projectName;
    }

    public List getParamValues() {
        return paramValues;
    }

    public void setParamValues(List paramValues) {
        this.paramValues = paramValues;
    }

    /**
     * 只是比较内容，不比较id, 如果也想比较id，请重写equals方法
     *
     * @param oneFilter
     * @return
     */
    public boolean isChanged(IssueFilter oneFilter) {
        if (oneFilter == null) {
            return false;
        }
        if (this == oneFilter) {
            return true;
        }

        boolean changed = false;
        if (this.authorName != null) {
            if (!authorName.equals(oneFilter.getAuthorName())) {
                changed = true;
            }
        } else {
            if (oneFilter.getAuthorName() != null) {
                changed = true;
            }
        }
        if (this.description != null) {
            if (!description.equals(oneFilter.getDescription())) {
                changed = true;
            }
        } else {
            if (oneFilter.getDescription() != null) {
                changed = true;
            }
        }
        if (this.filterName != null) {
            if (!filterName.equals(oneFilter.getFilterName())) {
                changed = true;
            }
        } else {
            if (oneFilter.getFilterName() != null) {
                changed = true;
            }
        }
        if (this.projectName != null) {
            if (!projectName.equals(oneFilter.getProjectName())) {
                changed = true;
            }
        } else {
            if (oneFilter.getProjectName() != null) {
                changed = true;
            }
        }
        if (this.requestContent != null) {
            if (!requestContent.equals(oneFilter.getRequestContent())) {
                changed = true;
            }
        } else {
            if (oneFilter.getRequestContent() != null) {
                changed = true;
            }
        }
        if (this.projectId != oneFilter.getProjectId()) {
            changed = true;
        }
        if (this.item != null) {
            if (!item.equals(oneFilter.getItem())) {
                changed = true;
            }
        } else {
            if (oneFilter.getItem() != null) {
                changed = true;
            }
        }
        if (this.paramValues != null) {
            if (!paramValues.equals(oneFilter.getParamValues())) {
                changed = true;
            }
        } else {
            if (oneFilter.getParamValues() != null) {
                changed = true;
            }
        }
        return changed;
    }

}