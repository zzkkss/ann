package com.gw.dao.impl;

import org.springframework.stereotype.Repository;

import com.gw.dao.MemberDao;
import com.gw.model.Member;
@Repository("memberDao")
public class MemberDaoImpl extends BaseDaoImpl<Member> implements MemberDao{ 

}
