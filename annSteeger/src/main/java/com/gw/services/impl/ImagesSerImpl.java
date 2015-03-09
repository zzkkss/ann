package com.gw.services.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.gw.dao.BaseDao;
import com.gw.dao.ImagesDao;
import com.gw.model.Images;
import com.gw.model.JqgridPage;
import com.gw.model.Jqpage;
import com.gw.services.ImagesSer;
@Service
@Transactional 
public class ImagesSerImpl extends BaseSerImpl<Images> implements ImagesSer{
	  /** 
     * 注入DAO 
     */  
    @Resource(name = "imagesDao")  
    public void setDao(BaseDao<Images> dao) {  
        super.setDao(dao);  
    }
    @Autowired
private ImagesDao imagesDao;
	public List<Images> lastImages(int num, String artType) {
		// TODO Auto-generated method stub
		return 	imagesDao.lastImages(num, artType);
	}
	public Map<String, Object> findByPage(Jqpage jqpage, String... strings) {
		// TODO Auto-generated method stub
		return imagesDao.getByPage(jqpage, strings);
	}
	public Map<String, Object> getByJgridType(JqgridPage jqgridPage, String type) {
		// TODO Auto-generated method stub
		return imagesDao.getByJgridType(jqgridPage, type);
	}
  
}