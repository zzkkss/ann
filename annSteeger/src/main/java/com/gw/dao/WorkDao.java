package com.gw.dao;

import java.util.List;
import java.util.Map;

import com.gw.model.Jqpage;
import com.gw.model.Work;


public interface WorkDao extends BaseDao<Work> {
List<Work> lastArts(int num,String artType);
Map<String,Object>  getByPage(Jqpage jqpage,String...strings );
}
