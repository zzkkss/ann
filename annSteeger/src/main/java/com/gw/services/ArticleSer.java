package com.gw.services;


import java.util.List;
import java.util.Map;

import com.gw.model.Article;
import com.gw.model.JqgridPage;
import com.gw.model.Jqpage;


public interface ArticleSer extends BaseSer<Article> {
	List<Article> lastArts(int num,String artType);

	public Map<String,Object>  getByJgridType(JqgridPage jqgridPage,String type);
	  public Map<String,Object>  findByPage(Jqpage jqpage,String...strings );
}
