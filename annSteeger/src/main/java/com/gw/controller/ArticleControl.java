package com.gw.controller;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.Serializable;
import java.sql.Blob;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.FileUtils;
import org.hibernate.Hibernate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.gw.listener.Initweb;
import com.gw.model.Article;
import com.gw.model.Images;
import com.gw.model.JqgridPage;
import com.gw.model.Jqpage;
import com.gw.services.ArticleSer;
import com.gw.services.ImagesSer;
import com.gw.tools.ImageUtils;
import com.gw.tools.ViewExcel;

@Controller
public class ArticleControl {
@Autowired
private ArticleSer articleSer;
@Autowired
private ImagesSer imagesSer;
	  @RequestMapping ("articleUpload") 
	  @ResponseBody
	    public String articleUpload(@RequestParam("title") String title,@RequestParam("content") String content,  
	        @RequestParam("type")String type ) {  
				  Article arts=new Article();
				  arts.setContent(content);
				  arts.setTitle(title);
				  arts.setType(type);
				  articleSer.save(arts);
	           return "success";  
	    }  
	  @RequestMapping ("articleLast") 
	  @ResponseBody
	    public List<Article> articleLast(@RequestParam("num") int num,@RequestParam("type") String type ) {  
				 
		  List<Article> arts=articleSer.lastArts(num, type);
	           return arts;  
	    }  
	  @RequestMapping ("articleByPage") 
	  @ResponseBody
	  public Map<String, Object> articleByPage( @ModelAttribute("jqpage") Jqpage jqpage,@RequestParam("type") String type) {  
		  
		  Map<String, Object> arts=articleSer.findByPage(jqpage,type);
		  return arts;  
	  }  
	  @RequestMapping ({"articleById","background/articleById"}) 
	  @ResponseBody
	  public Article articleById(@RequestParam("id") String id) {  
		  
		  Article arts=articleSer.getById(Integer.parseInt(id));
		  return arts;  
	  }  
	  @RequestMapping ({"articleByJqgrid","background/articleByJqgrid"}) 
	  @ResponseBody
	  public Map<String, Object> articleByJqgrid( @ModelAttribute("jqpage") JqgridPage jqgridPage) {  
		  
		  Map<String, Object> arts=articleSer.findByJqgrid(jqgridPage);
		  return arts;  
	  }   
	  @RequestMapping ({"articleByJqgridType","background/articleByJqgridType"}) 
	  @ResponseBody
	  public Map<String, Object> articleByJqgridType( @ModelAttribute("jqpage") JqgridPage jqgridPage,@RequestParam("type") String type) {  
		  
		  Map<String, Object> arts=articleSer.getByJgridType(jqgridPage, type);
		  return arts;  
	  }  
	  @RequestMapping ({"articleEditByJqgrid","background/articleEditByJqgrid"}) 
	  @ResponseBody
	  public String articleEditByJqgrid( @ModelAttribute("jqpage") JqgridPage jqgridPage,@ModelAttribute("article") Article article) {  
		  if(article.getId()==0){
//			  article.setId();
			  jqgridPage.setOper("add");
		  }
		  article.setAddtime(new Timestamp(System.currentTimeMillis())); 
				 Serializable i= articleSer.edit(article, jqgridPage);
		  return "success";
	  }  
	  @RequestMapping ({"articlesImgUpload","background/articlesImgUpload"}) 
	  @ResponseBody
	  public String articlesImgUpload(
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
	  				file[i].transferTo(targetFile2);  
	  				insertIntoImages(n,bytes);
	  				
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

	private void insertIntoImages(String n, byte[] bytes) {
		// TODO Auto-generated method stub
		Images images=new Images();
		images.setName(n);
		Blob blob=Hibernate.createBlob(bytes);
		images.setImg(blob);
		
		imagesSer.save(images);
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
