package com.gw.dao;

import java.io.Serializable;
import java.util.List;
import java.util.Map;

import com.gw.exception.ApplyException;
import com.gw.model.JqgridPage;
import com.gw.model.Jqpage;

public interface BaseDao<T> {
	T get(Integer id);
	Serializable save(T entity) throws ApplyException;
	Serializable saveOrUpdate(T entity) throws ApplyException;
	Serializable update(T entity) throws ApplyException;
	Serializable delete(T entity) throws ApplyException;
    Map<String,Object> findAll( JqgridPage jqgridPage);
    Serializable edit(T entity, JqgridPage jqgridPage)throws ApplyException;
     List<T> findAll();
    int count();
//    PageModel<T> search(QueryParse<T> qp);
    Map<String,Object>  getByPage(Jqpage jqpage);
}
