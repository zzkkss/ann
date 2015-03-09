package com.gw.dao;

import java.util.List;
import java.util.Map;

import com.gw.model.Images;
import com.gw.model.JqgridPage;
import com.gw.model.Jqpage;

public interface ImagesDao extends BaseDao<Images> {
	List<Images> lastImages(int num,String artType);
	Map<String,Object>  getByPage(Jqpage jqpage,String...strings );
	Map<String,Object>  getByJgridType(JqgridPage jqgridPage,String type);
	}
