package com.gw.dao;

import java.util.List;
import java.util.Map;

import com.gw.model.JqgridPage;
import com.gw.model.Jqpage;
import com.gw.model.Products;

public interface ProductsDao extends BaseDao<Products>{
	List<Products> lastProducts(int num,String producttype);
	List<Products> lastProducts(int num);
	Map<String,Object>  getByPage(Jqpage jqpage,String...strings );
	Map<String, Object> getByJgridType(JqgridPage jqgridPage, String type);
}
