package com.gw.dao.impl;


import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.hibernate.Criteria;
import org.hibernate.criterion.Expression;
import org.hibernate.criterion.Order;
import org.springframework.stereotype.Repository;

import com.gw.dao.WorkDao;
import com.gw.model.Jqpage;
import com.gw.model.Work;

@Repository("workDao")
public class WorkDaoImpl extends BaseDaoImpl<Work> implements WorkDao {

	public List<Work> lastArts(int num, String artType) {
		// TODO Auto-generated method stub
		Criteria criteria=this.getSession().createCriteria(Work.class);
			criteria.setMaxResults(num);
			criteria.add(Expression.eq("Type", artType));
			criteria.addOrder(Order.desc("id"));
			List<Work> a=criteria.list();
		return a;
	}

	public Map<String, Object> getByPage(Jqpage jqpage, String... strings) {
		// TODO Auto-generated method stub
		Criteria criteria=this.getSession().createCriteria(Work.class);
		Map<String, Object> map=new HashMap<String, Object>();
		jqpage.setTotalRecords(criteria.list().size());
			criteria.setFirstResult((jqpage.getPage()-1)*jqpage.getRows());
			criteria.setMaxResults(jqpage.getRows());
			String sort="";
			if(jqpage.getSort()==null){
				sort="id";
			}else{
				sort=jqpage.getSort();
			}
			if(jqpage.getOrder()!=null&&jqpage.getOrder().equals("asc")){
				criteria.addOrder(Order.asc(sort));
			}else{
				criteria.addOrder(Order.desc(sort));
			}
			List<Work> list= criteria.list();
			
		map.put("entity", list);
		map.put("jqpage", jqpage);
		return map;
	}

}
