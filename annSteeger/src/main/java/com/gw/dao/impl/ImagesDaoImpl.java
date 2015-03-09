package com.gw.dao.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.hibernate.Criteria;
import org.hibernate.criterion.Expression;
import org.hibernate.criterion.Order;
import org.springframework.stereotype.Repository;

import com.gw.dao.ImagesDao;
import com.gw.model.Images;
import com.gw.model.JqgridPage;
import com.gw.model.Jqpage;

@Repository("imagesDao")
public class ImagesDaoImpl extends BaseDaoImpl<Images> implements ImagesDao {

	public List<Images> lastImages(int num, String artType) {
		// TODO Auto-generated method stub
		Criteria criteria=this.getSession().createCriteria(Images.class);
			criteria.setMaxResults(num);
			criteria.add(Expression.eq("Type", artType));
			criteria.addOrder(Order.desc("id"));
			List<Images> a=criteria.list();
		return a;
	}

	public Map<String, Object> getByPage(Jqpage jqpage, String... strings) {
		// TODO Auto-generated method stub
		Criteria criteria=this.getSession().createCriteria(Images.class);
		Map<String, Object> map=new HashMap<String, Object>();
		criteria.add(Expression.eq("Type", strings[0]));
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
			List<Images> list= criteria.list();
			
		map.put("entity", list);
		map.put("jqpage", jqpage);
		return map;
	}

	public Map<String, Object> getByJgridType(JqgridPage jqgridPage, String type) {
		// TODO Auto-generated method stub
//		Criteria criteria=this.getSession().createCriteria(Article.class);
//		Map<String, Object> map=new HashMap<String, Object>();
//		criteria.add(Expression.eq("Type", strings[0]));
//		jqpage.setTotalRecords(criteria.list().size());
//			criteria.setFirstResult((jqpage.getPage()-1)*jqpage.getRows());
//			criteria.setMaxResults(jqpage.getRows());
//			String sort="";
//			if(jqpage.getSort()==null){
//				sort="id";
//			}else{
//				sort=jqpage.getSort();
//			}
//			if(jqpage.getOrder()!=null&&jqpage.getOrder().equals("asc")){
//				criteria.addOrder(Order.asc(sort));
//			}else{
//				criteria.addOrder(Order.desc(sort));
//			}
//			List<Article> list= criteria.list();
//			
//		map.put("entity", list);
//		map.put("jqpage", jqpage);
//		return map;
		Criteria criteria=this.getSession().createCriteria(Images.class);
		if(type.equals("0")){
			
		}else{
			criteria.add(Expression.eq("Type", type));
		}
		jqgridPage.setTotalRecords(criteria.list().size());
		Map<String, Object> map=new HashMap<String, Object>();
			criteria.setFirstResult((jqgridPage.getPage()-1)*jqgridPage.getRows());
			criteria.setMaxResults(jqgridPage.getRows());
			if(jqgridPage.getOrder().equals("asc")){
				criteria.addOrder(Order.asc(jqgridPage.getSort()));
			}else{
				criteria.addOrder(Order.desc(jqgridPage.getSort()));
			}
			List<Images> list= criteria.list();
			
		map.put("entity", list);
		jqgridPage.setTotalPages(jqgridPage.getTotalRecords()/jqgridPage.getRows()+1);
		map.put("jqgridPage", jqgridPage);
		return map;
	}

}