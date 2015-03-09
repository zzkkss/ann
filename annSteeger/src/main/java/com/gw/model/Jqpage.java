package com.gw.model;

public class Jqpage {
private int totalRecords;
private int page;
private int rows;
private String order;
private String sort;



public String getSort() {
	return sort;
}
public void setSort(String sort) {
	this.sort = sort;
}
public String getOrder() {
	return order;
}
public void setOrder(String order) {
	this.order = order;
}
public void setRows(int rows) {
	this.rows = rows;
}
public int getTotalRecords() {
	return totalRecords;
}
public void setTotalRecords(int totalRecords) {
	this.totalRecords = totalRecords;
}
public int getPage() {
	return page;
}
public void setPage(int page) {
	this.page = page;
}
public int getRows() {
	return rows;
}




}
