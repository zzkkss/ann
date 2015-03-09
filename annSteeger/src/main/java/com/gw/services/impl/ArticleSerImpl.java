package com.gw.services.impl;


import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.gw.dao.ArticleDao;
import com.gw.dao.BaseDao;
import com.gw.model.Article;
import com.gw.model.JqgridPage;
import com.gw.model.Jqpage;
import com.gw.services.ArticleSer;
@Service
@Transactional 
public class ArticleSerImpl extends BaseSerImpl<Article> implements ArticleSer{
	  /** 
     * 注入DAO 
     */  
    @Resource(name = "articleDao")  
    public void setDao(BaseDao<Article> dao) {  
        super.setDao(dao);  
    }
    @Autowired
private ArticleDao artcleDao;
	public List<Article> lastArts(int num, String artType) {
		// TODO Auto-generated method stub
		return 	artcleDao.lastArts(num, artType);
	}
	public Map<String, Object> findByPage(Jqpage jqpage, String... strings) {
		// TODO Auto-generated method stub
		return artcleDao.getByPage(jqpage, strings);
	}
	public Map<String, Object> getByJgridType(JqgridPage jqgridPage, String type) {
		// TODO Auto-generated method stub
		return artcleDao.getByJgridType(jqgridPage, type);
	}  
  
}
