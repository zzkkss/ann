package com.gw.services;


import java.util.List;
import java.util.Map;

import com.gw.model.Jqpage;
import com.gw.model.Work;


public interface WorkSer extends BaseSer<Work> {
	List<Work> lastArts(int num,String artType);

	  public Map<String,Object>  findByPage(Jqpage jqpage,String...strings );
}
