package com.gw.dao;

import java.util.List;
import java.util.Map;

import com.gw.model.Article;
import com.gw.model.JqgridPage;
import com.gw.model.Jqpage;


public interface ArticleDao extends BaseDao<Article> {
List<Article> lastArts(int num,String artType);
Map<String,Object>  getByPage(Jqpage jqpage,String...strings );
Map<String,Object>  getByJgridType(JqgridPage jqgridPage,String type);
}
