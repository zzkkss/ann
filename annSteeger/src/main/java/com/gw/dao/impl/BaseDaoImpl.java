package com.gw.dao.impl;

import javax.annotation.Resource;

import java.io.Serializable;
import java.lang.reflect.ParameterizedType;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.hibernate.Criteria;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.criterion.Criterion;
import org.hibernate.criterion.LogicalExpression;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Projections;
import org.hibernate.criterion.Restrictions;
import org.hibernate.criterion.SimpleExpression;
import org.springframework.orm.hibernate3.HibernateCallback;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate3.HibernateTemplate;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;
import org.springframework.stereotype.Repository;

import com.gw.exception.ApplyException;
import com.gw.model.JqgridPage;
import com.gw.model.Jqpage;
public class BaseDaoImpl<T> extends HibernateDaoSupport{

	 @Autowired 
	    public void setSessionFactoryOverride(SessionFactory sessionFactory)
	    {   
	      super.setSessionFactory(sessionFactory);   
	    }
	 
	 

		private Class<T> persistentClass;  
		
		public Class<T> getPersistentClass() {
			return persistentClass;
		}

		public void setPersistentClass(Class<T> persistentClass) {
			this.persistentClass = persistentClass;
		}
		
		@SuppressWarnings("unchecked")
		public BaseDaoImpl() {   
	        this.persistentClass = (Class<T>)((ParameterizedType)getClass().getGenericSuperclass()).getActualTypeArguments()[0];  
	    }
		
		public int count() {
			return statistics(null);
		}
		
		@SuppressWarnings("unchecked")
		public List<T> findByCriteria(final Criterion... criterion) {
			List<T> list = (List<T>) getHibernateTemplate().executeFind(new HibernateCallback() {
				public Object doInHibernate(Session session) throws HibernateException, SQLException {
					Criteria criteria = session.createCriteria(persistentClass);
					for(Criterion c : criterion) {
						criteria.add(c);
					}
					return criteria.list();
				}
			});
			return list;
		}
		
		//统计
		@SuppressWarnings("unchecked")
		public int statistics(final List<Criterion> criterion) {
			
			int sum = (Integer)getHibernateTemplate().execute(new HibernateCallback() {
				public Object doInHibernate(Session session) throws HibernateException, SQLException {
					Criteria counts = session.createCriteria(persistentClass);
					if(criterion != null) {
						for (Criterion c : criterion) {   
							counts.add(c);   
				        }  
					}
					//总记录数
					int count = ((Long)counts.setProjection(Projections.rowCount()).uniqueResult()).intValue(); 
					return count;
				}
			});
			return sum;
		}
		
		@SuppressWarnings("unchecked")
		public List<T> findAll(){
				List<T> list = (List<T>)getHibernateTemplate().executeFind(new HibernateCallback() {
					public Object doInHibernate(Session session) throws HibernateException, SQLException {
						
						Criteria criteria = session.createCriteria(persistentClass);
						//条件
						List<T> list = criteria.list();
						return list;
					}
				});
			return list;
		}
		public Map<String, Object> findAll( JqgridPage jqgridPage) {
			// TODO Auto-generated method stub
			Criteria criteria=this.getSession().createCriteria(persistentClass);
			jqgridPage.setTotalRecords(criteria.list().size());
			Map<String, Object> map=new HashMap<String, Object>();
				criteria.setFirstResult((jqgridPage.getPage()-1)*jqgridPage.getRows());
				criteria.setMaxResults(jqgridPage.getRows());
				if(jqgridPage.getOrder().equals("asc")){
					criteria.addOrder(Order.asc(jqgridPage.getSort()));
				}else{
					criteria.addOrder(Order.desc(jqgridPage.getSort()));
				}
				List<T> list= criteria.list();
				
			map.put("entity", list);
			jqgridPage.setTotalPages(jqgridPage.getTotalRecords()/jqgridPage.getRows()+1);
			map.put("jqgridPage", jqgridPage);
			return map;
		}
		public    Serializable edit(T entity, JqgridPage jqgridPage) throws ApplyException{
			if(jqgridPage.getOper().equals("edit")){
				return update(entity);
			}else if(jqgridPage.getOper().equals("add")){
			
				return save(entity);
			}else if(jqgridPage.getOper().equals("del")){
				return delete(entity);
			}else{
				return -1;
			}
			
		}
		public Serializable delete(T entity) throws ApplyException {
			try {
				this.getHibernateTemplate().delete(entity);
				this.getHibernateTemplate().flush();
				return 1;
				
			} catch(Exception e) {
				logger.error(e);
				throw new ApplyException(e);
			}
		}
//		
//		
//
		@SuppressWarnings("unchecked")
		public T get(Integer id){
			return (T)this.getHibernateTemplate().get(getPersistentClass(), id);
		}
//
		public Serializable save(T entity) throws ApplyException {
			Serializable i=null;
			try {
				 i=this.getHibernateTemplate().save(entity);
				this.getHibernateTemplate().flush();
				return i;
			}catch(Exception e) {
				logger.error(e);
				throw new ApplyException(e);
			}
		}

		public Serializable update(T entity) throws ApplyException {
			try {
				this.getHibernateTemplate().update(entity);
				this.getHibernateTemplate().flush();
				return -1;
			}catch(Exception e) {
				logger.error(e);
				throw new ApplyException(e);
			}
		}
		public Serializable saveOrUpdate(T entity) throws ApplyException {
			try {
				this.getHibernateTemplate().saveOrUpdate(entity);
				this.getHibernateTemplate().flush();
				return -1;
			}catch(Exception e) {
				logger.error(e);
				throw new ApplyException(e);
			}
		}
		
		public Map<String, Object> getByPage(Jqpage jqpage){
			Criteria criteria=this.getSession().createCriteria(persistentClass);
			jqpage.setTotalRecords(criteria.list().size());
			Map<String, Object> map=new HashMap<String, Object>();
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
				List<T> list= criteria.list();
				
			map.put("entity", list);
			map.put("jqpage", jqpage);
			return map;
	}
		
}
