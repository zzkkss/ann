package com.gw.dao.impl;

import org.springframework.stereotype.Repository;

import com.gw.dao.UsersDao;
import com.gw.model.Users;
@Repository("usersDao")
public class UsersDaoImpl extends BaseDaoImpl<Users> implements UsersDao{ 

}
