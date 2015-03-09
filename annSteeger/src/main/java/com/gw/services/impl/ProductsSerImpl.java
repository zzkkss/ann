package com.gw.services.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.gw.dao.BaseDao;
import com.gw.dao.ProductsDao;
import com.gw.model.JqgridPage;
import com.gw.model.Jqpage;
import com.gw.model.Products;
import com.gw.services.ProductsSer;
@Service("productsSer")
@Transactional 
public class ProductsSerImpl extends BaseSerImpl<Products> implements ProductsSer{
	  /** 
     * 注入DAO 
     */  
    @Resource(name = "productsDao")  
    public void setDao(BaseDao<Products> dao) {  
        super.setDao(dao);  
    }  
  
    /** 
     * 若CustomerService 定义了BaseService没有的方法，则可以在这里实现 
     */  
    public List<Products> lastProducts(int num) {
    	// TODO Auto-generated method stub
    	return productsDao.lastProducts(num);
    }
    @Autowired
    private ProductsDao productsDao;
	public List<Products> lastProducts(int num, String producttype) {
		// TODO Auto-generated method stub
		return productsDao.lastProducts(num, producttype);
	}
	public Map<String, Object> findByPage(Jqpage jqpage, String... strings) {
		// TODO Auto-generated method stub
		return productsDao.getByPage(jqpage, strings);
	}

	public Map<String, Object> findByJqgridAndType(JqgridPage jqgridPage,
			String type) {
		// TODO Auto-generated method stub
		return productsDao.getByJgridType(jqgridPage, type);
//		return artcleDao.getByJgridType(jqgridPage, type);
	}  
  
}
