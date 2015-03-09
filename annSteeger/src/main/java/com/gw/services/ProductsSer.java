package com.gw.services;

import java.util.List;
import java.util.Map;

import com.gw.model.JqgridPage;
import com.gw.model.Jqpage;
import com.gw.model.Products;

public interface ProductsSer extends BaseSer<Products>{
public List<Products> lastProducts(int num);
public List<Products> lastProducts(int num,String producttype);
public Map<String,Object>  findByPage(Jqpage jqpage,String...strings );
public Map<String, Object> findByJqgridAndType(JqgridPage jqgridPage,
		String type);
}
