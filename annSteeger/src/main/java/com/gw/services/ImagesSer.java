package com.gw.services;

import java.util.List;
import java.util.Map;

import com.gw.model.Images;
import com.gw.model.JqgridPage;
import com.gw.model.Jqpage;

public interface ImagesSer extends BaseSer<Images> {
	List<Images> lastImages(int num,String artType);

	public Map<String,Object>  getByJgridType(JqgridPage jqgridPage,String type);
	  public Map<String,Object>  findByPage(Jqpage jqpage,String...strings );
}
