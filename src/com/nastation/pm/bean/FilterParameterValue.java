package com.nastation.pm.bean;

public class FilterParameterValue {
	
	private int id;
	private String paramValue;
	private Integer paramOrder;
	private SearchRequest filterId;
	
	public FilterParameterValue() {
		
	}

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

	public SearchRequest getFilterId() {
		return filterId;
	}

	public void setFilterId(SearchRequest filterId) {
		this.filterId = filterId;
	}
	
	
	
}
