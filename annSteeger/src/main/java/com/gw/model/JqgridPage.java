package com.gw.model;

public class JqgridPage {
private boolean search;
private String order;
private int page;
private int rows;
private String sort;
private int totalPages;
private int totalRecords;
private String oper;

public String getOper() {
	return oper;
}
public void setOper(String oper) {
	this.oper = oper;
}
public int getTotalPages() {
	return totalPages;
}
public void setTotalPages(int totalPages) {
	this.totalPages = totalPages;
}
public int getTotalRecords() {
	return totalRecords;
}
public void setTotalRecords(int totalRecords) {
	this.totalRecords = totalRecords;
}
public boolean isSearch() {
	return search;
}
public void setSearch(boolean search) {
	this.search = search;
}
public String getOrder() {
	return order;
}
public void setOrder(String order) {
	this.order = order;
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
public void setRows(int rows) {
	this.rows = rows;
}
public String getSort() {
	return sort;
}
public void setSort(String sort) {
	this.sort = sort;
}

}
