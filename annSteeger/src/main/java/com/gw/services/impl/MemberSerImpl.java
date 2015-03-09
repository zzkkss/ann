package com.gw.services.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.gw.dao.BaseDao;
import com.gw.model.Member;
import com.gw.services.MemberSer;
@Service
@Transactional 
public class MemberSerImpl extends BaseSerImpl<Member> implements MemberSer{
	  /** 
     * 注入DAO 
     */  
    @Resource(name = "memberDao")  
    public void setDao(BaseDao<Member> dao) {  
        super.setDao(dao);  
    }  
  
    /** 
     * 若CustomerService 定义了BaseService没有的方法，则可以在这里实现 
     */  
}
