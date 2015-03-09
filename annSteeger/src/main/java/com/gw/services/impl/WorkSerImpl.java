package com.gw.services.impl;


import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.gw.dao.BaseDao;
import com.gw.dao.WorkDao;
import com.gw.model.Jqpage;
import com.gw.model.Work;
import com.gw.services.WorkSer;
@Service
@Transactional 
public class WorkSerImpl extends BaseSerImpl<Work> implements WorkSer{
	  /** 
     * 注入DAO 
     */  
    @Resource(name = "workDao")  
    public void setDao(BaseDao<Work> dao) {  
        super.setDao(dao);  
    }
    @Autowired
private WorkDao workDao;
	public List<Work> lastArts(int num, String artType) {
		// TODO Auto-generated method stub
		return 	workDao.lastArts(num, artType);
	}
	public Map<String, Object> findByPage(Jqpage jqpage, String... strings) {
		// TODO Auto-generated method stub
		return workDao.getByPage(jqpage, strings);
	}  
  
}
