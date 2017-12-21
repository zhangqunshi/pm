package com.nastation.pm.beanhbm;

public class FilterParameterValuehbm {

    private int id;
    private String paramValue;
    private Integer paramOrder;
    private SearchRequesthbm filter;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getParamValue() {
        return paramValue;
    }

    public void setParamValue(String paramValue) {
        this.paramValue = paramValue;
    }

    public Integer getParamOrder() {
        return paramOrder;
    }

    public void setParamOrder(Integer paramOrder) {
        this.paramOrder = paramOrder;
    }

    public SearchRequesthbm getFilter() {
        return filter;
    }

    public void setFilter(SearchRequesthbm filter) {
        this.filter = filter;
    }

}
