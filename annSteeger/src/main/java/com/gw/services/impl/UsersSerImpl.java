package com.gw.services.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.gw.dao.BaseDao;
import com.gw.model.Users;
import com.gw.services.UsersSer;

@Service
@Transactional 
public class UsersSerImpl extends BaseSerImpl<Users> implements UsersSer{
	  /** 
     * 注入DAO 
     */  
    @Resource(name = "usersDao")  
    public void setDao(BaseDao<Users> dao) {  
        super.setDao(dao);  
    }  
  
    /** 
     * 若CustomerService 定义了BaseService没有的方法，则可以在这里实现 
     */  
}
