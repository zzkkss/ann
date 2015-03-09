package com.gw.services.impl;

import java.io.Serializable;
import java.util.Arrays;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;  

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.gw.dao.BaseDao;
import com.gw.exception.ApplyException;
import com.gw.model.JqgridPage;
import com.gw.model.Jqpage;
import com.gw.services.BaseSer;


@Transactional  
public class BaseSerImpl<T> implements BaseSer<T> {
	  /** 
     * 注入BaseDao 
     */    
    private BaseDao<T> dao; 
    public BaseDao<T> getDao() {
		return dao;
	}

	@Resource  
    public void setDao(BaseDao<T> dao) {  
        this.dao = dao;  
    }  
  
    public void save(T entity) {  
        try {
			dao.save(entity);
		} catch (ApplyException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}  
    }  
  
    public void update(T entity) {  
        try {
			dao.update(entity);
		} catch (ApplyException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}  
    }  
  
    public void delete(T entity) {  
        try {
			dao.delete(entity);
		} catch (ApplyException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}  
    }  
  
    public T getById(Serializable id) {  
        return dao.get((Integer) id);  
    }  
  
    public List<T> getByHQL(String hql, Object... params) {  
        return null;
    }

	public List<T> findAll() {
		// TODO Auto-generated method stub
		return dao.findAll();
	}

	public Map<String, Object> findByPage(Jqpage jqpage) {
		// TODO Auto-generated method stub
		return dao.getByPage(jqpage);
	}

	public Map<String, Object> findByJqgrid(JqgridPage jqgridPage) {
		// TODO Auto-generated method stub
		return dao.findAll(jqgridPage);
	}

	public Serializable edit(T entity, JqgridPage jqgridPage) {
		// TODO Auto-generated method stub
		try {
			return dao.edit(entity, jqgridPage);
		} catch (ApplyException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return null;
		}
	}  
}