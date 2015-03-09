package com.gw.controller;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.Serializable;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.gw.listener.Initweb;
import com.gw.model.JqgridPage;
import com.gw.model.Jqpage;
import com.gw.model.Work;
import com.gw.services.WorkSer;
import com.gw.tools.ImageUtils;

@Controller
public class WorkControl {
@Autowired
private WorkSer workSer;
	  @RequestMapping ("workByPage") 
	  @ResponseBody
	  public Map<String, Object> workByPage( @ModelAttribute("jqpage") Jqpage jqpage) {  
		  
		  Map<String, Object> arts=workSer.findByPage(jqpage);
		  return arts;  
	  }  
	  @RequestMapping ("workByJqgrid") 
	  @ResponseBody
	  public Map<String, Object> workByJqgrid( @ModelAttribute("jqpage") JqgridPage jqgridPage) {  
		  
		  Map<String, Object> arts=workSer.findByJqgrid(jqgridPage);
		  return arts;  
	  }  
	  @RequestMapping ("workEditByJqgrid") 
	  @ResponseBody
	  public String workEditByJqgrid( @ModelAttribute("jqpage") JqgridPage jqgridPage,@ModelAttribute("work") Work work) {  
		  if(work.getId()==0){
//			  article.setId();
			  jqgridPage.setOper("add");
		  }
		  work.setAddtime(new Timestamp(System.currentTimeMillis())); 
				 Serializable i= workSer.edit(work, jqgridPage);
		  return "success";
	  }  
	  @RequestMapping ("workById") 
	  @ResponseBody
	  public Work workById(@RequestParam("id") String id) {  
		  
		  Work arts=workSer.getById(Integer.parseInt(id));
		  return arts;  
	  }  
	  @RequestMapping ("worksImgUpload") 
	  @ResponseBody
	  public String worksImgUpload(
	  		@RequestParam("file") MultipartFile[] file,HttpServletRequest request) {  
	  	//MultipartFile是对当前上传的文件的封装，当要同时上传多个文件时，可以给定多个MultipartFile参数  
	  	List<String> fileinname=new ArrayList<String>();
	  	for(int i=0;i<file.length;i++){
	  	if (!file[i].isEmpty()) {  
	  		try {
	  			byte[] bytes = file[i].getBytes();
	  			System.out.println("开始"+i);  
	  			String path = request.getSession().getServletContext().getRealPath("uploadimg");  
	  			String fileName = file[i].getOriginalFilename();
//	  		        String fileName = new Date().getTime()+".jpg";  
	  			SimpleDateFormat df = new SimpleDateFormat("yyyyMMddHHmmssSSS");//设置日期格式
	  			System.out.println(df.format(new Date()));// new Date()为获取当前系统时间
//	  			System.out.println(Initweb.imgPath);  
	  			System.out.println(path);  
	  			String n=df.format(new Date())+"."+file[i].getOriginalFilename().split("\\.")[1];
	  			fileinname.add(n);
//	  			File targetFile = new File(Initweb.imgPath, n);  
	  			File targetFile2 = new File(path, n);  
//	  			if(!targetFile.exists()){  
//	  				targetFile.mkdirs();  
//	  			}  
//	  			if(!targetFile2.exists()){  
//	  				targetFile2.mkdirs();  
//	  			}  
	  			//保存  
	  			try {  
//	  				file[i].transferTo(targetFile);  
//	  				copyFile(targetFile,targetFile2);
//	  				ImageUtils.resize(Initweb.imgPath,n,	0.2);
	  				ImageUtils.resize(path,n,	0.2);
	  			} catch (Exception e) {  
	  				e.printStackTrace();  
	  			}  
//	  		        model.addAttribute("fileUrl", request.getContextPath()+"/upload/"+fileName);  
	  		} catch (IOException e) {
	  			// TODO Auto-generated catch block
	  			e.printStackTrace();
	  		}  
	  	} else {  
	  		System.out.println("文件为空"+i);  
	  	}  
	  }
	  	return fileinname.toString();  
	  	}

	// 复制文件
	private  void copyFile(File sourceFile, File targetFile) throws IOException {
	    BufferedInputStream inBuff = null;
	    BufferedOutputStream outBuff = null;
	    try {
	        // 新建文件输入流并对它进行缓冲
	        inBuff = new BufferedInputStream(new FileInputStream(sourceFile));

	        // 新建文件输出流并对它进行缓冲
	        outBuff = new BufferedOutputStream(new FileOutputStream(targetFile));

	        // 缓冲数组
	        byte[] b = new byte[1024 * 5];
	        int len;
	        while ((len = inBuff.read(b)) != -1) {
	            outBuff.write(b, 0, len);
	        }
	        // 刷新此缓冲的输出流
	        outBuff.flush();
	    } finally {
	        // 关闭流
	        if (inBuff != null)
	            inBuff.close();
	        if (outBuff != null)
	            outBuff.close();
	    }
	}
}
