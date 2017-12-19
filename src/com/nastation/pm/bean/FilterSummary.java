package com.nastation.pm.bean;

public class FilterSummary {

	private int id;
	private SearchRequest requestId;
	private String filterSummaryKey;
	private String filterSummaryValue;
	
	public FilterSummary() {

	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public SearchRequest getRequestId() {
		return requestId;
	}

	public void setRequestId(SearchRequest requestId) {
		this.requestId = requestId;
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
