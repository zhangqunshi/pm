package com.nastation.pm.beanhbm;

public class FilterSummaryhbm {

    private int id;
    private SearchRequesthbm request;
    private String filterSummaryKey;
    private String filterSummaryValue;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public SearchRequesthbm getRequest() {
        return request;
    }

    public void setRequest(SearchRequesthbm request) {
        this.request = request;
    }

    public String getFilterSummaryKey() {
        return filterSummaryKey;
    }

    public void setFilterSummaryKey(String filterSummaryKey) {
        this.filterSummaryKey = filterSummaryKey;
    }

    public String getFilterSummaryValue() {
        return filterSummaryValue;
    }

    public void setFilterSummaryValue(String filterSummaryValue) {
        this.filterSummaryValue = filterSummaryValue;
    }

}
