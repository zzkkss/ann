package com.gw.controller;

import java.io.Serializable;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.gw.model.JqgridPage;
import com.gw.model.Jqpage;
import com.gw.model.Users;
import com.gw.services.UsersSer;
import com.gw.tools.ViewExcel;


@Controller
public class UsersControl {
	@Autowired
	private UsersSer usersSer;

	@RequestMapping("usersEdit")
	@ResponseBody
	public String usersEdit( @ModelAttribute("member") Users member) { 

UserDetails userDetails = (UserDetails) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
member.setId(userDetails.getUsername());
member.setEnabled(true);
		usersSer.update(member);
			  return "success";
		  }  
}
