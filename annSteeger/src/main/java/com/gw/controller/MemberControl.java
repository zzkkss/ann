package com.gw.controller;

import java.io.Serializable;
import java.sql.Timestamp;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.gw.model.Article;
import com.gw.model.JqgridPage;
import com.gw.model.Jqpage;
import com.gw.model.Member;
import com.gw.services.MemberSer;
import com.gw.tools.ViewExcel;


@Controller
public class MemberControl {
	@Autowired
	private MemberSer memberSer;

	@RequestMapping({"memberAdd","background/memberAdd"})
	@ResponseBody
	public String memberAdd( @ModelAttribute("member") Member member) {  
		memberSer.save(member);
			  return "success";
		  }  
	  @RequestMapping ({"memberByJqgrid","background/memberByJqgrid"}) 
	  @ResponseBody
	  public Map<String, Object> articleByJqgrid( @ModelAttribute("jqpage") JqgridPage jqgridPage) {  
		  
		  Map<String, Object> arts=memberSer.findByJqgrid(jqgridPage);
		  return arts;  
	  }  
	  @RequestMapping ({"memberEditByJqgrid","background/memberEditByJqgrid"}) 
	  @ResponseBody
	  public String articleEditByJqgrid( @ModelAttribute("jqpage") JqgridPage jqgridPage,@ModelAttribute("member") Member member) {  
		  if(member.getId()==0){
//			  article.setId();
			  jqgridPage.setOper("add");
		  }
		  member.setTime(new Timestamp(System.currentTimeMillis())); 
				 Serializable i= memberSer.edit(member, jqgridPage);
		  return "success";
	  }  
		@RequestMapping ({"viewExcel","background/viewExcel"}) 
		public ModelAndView viewExcel(HttpServletRequest request, HttpServletResponse response){
			  List<Member> list=memberSer.findAll();
		        Map model = new HashMap();  
		        model.put("list", list);  
		        ViewExcel viewExcel = new ViewExcel();  
		        return new ModelAndView(viewExcel, model);
		}
}
