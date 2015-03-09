package com.gw.controller;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.Serializable;
import java.sql.Blob;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.hibernate.Hibernate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.gw.listener.Initweb;
import com.gw.model.Images;
import com.gw.model.JqgridPage;
import com.gw.model.Jqpage;
import com.gw.model.Products;
import com.gw.services.ImagesSer;
import com.gw.services.ProductsSer;
import com.gw.tools.ImageUtils;

@Controller
public class ProductsControl {
@Autowired
private ProductsSer productsSer;

@Autowired
private ImagesSer imagesSer;
@RequestMapping("lastProducts") 
		@ResponseBody
	    public List<Products> lastProducts(@RequestParam("producttype") String producttype,@RequestParam("num") int num) {  
//				  List<Products> arts=productsSer.lastProducts(num, producttype);
//				  List<Products> arts=productsSer.lastProducts(num);
				  List<Products> arts=productsSer.lastProducts(num, producttype);
//				  for(int i=0;i<arts.size();i++){
//					  arts.get(i).setData(null);
//				  }
				return arts;
	    }
@RequestMapping("lastOneProductsByTypes") 
@ResponseBody
public List<Products> lastOneProductsByTypes(@RequestParam("producttypes") String producttypes) {  
//				  List<Products> arts=productsSer.lastProducts(num, producttype);
//				  List<Products> arts=productsSer.lastProducts(num);
	List<Products> arts=new ArrayList<Products>();
	for(int i=0;i<producttypes.split(",").length;i++){
		 arts.addAll(productsSer.lastProducts(1, producttypes.split(",")[i]));
	}
	return arts;
}
@RequestMapping({"ProductById","background/ProductById"}) 
@ResponseBody
public Products ProductById(@RequestParam("id") int id) {  
 Products arts=productsSer.getById(id);
//				  for(int i=0;i<arts.size();i++){
//					  arts.get(i).setData(null);
//				  }
	return arts;
}

@RequestMapping ("productByPage") 
@ResponseBody
public Map<String, Object> productByPage( @ModelAttribute("jqpage") Jqpage jqpage,@RequestParam("type") String type) {  
	  
	  Map<String, Object> arts=productsSer.findByPage(jqpage,type);
	  return arts;  
}  

@RequestMapping ({"productByJqgrid","background/productByJqgrid"}) 
@ResponseBody
public Map<String, Object> productByJqgrid( @ModelAttribute("jqpage") JqgridPage jqgridPage,@RequestParam("type") String type) {  
	  
	  Map<String, Object> arts=productsSer.findByJqgridAndType(jqgridPage,type);
	  return arts;  
}  
@RequestMapping ({"productByJqgridAndType","background/productByJqgridAndType"}) 
@ResponseBody
public Map<String, Object> productByJqgridAndType( @ModelAttribute("jqpage") JqgridPage jqgridPage) {  
	
	Map<String, Object> arts=productsSer.findByJqgrid(jqgridPage);
	return arts;  
}  
@RequestMapping ({"productEditByJqgrid","background/productEditByJqgrid"})
@ResponseBody
public String productEditByJqgrid( @ModelAttribute("jqpage") JqgridPage jqgridPage,@ModelAttribute("products") Products products) {  
	  if(products.getId()==0){
//		  article.setId();
		  jqgridPage.setOper("add");
	  }
	  products.setAddtime(new Timestamp(System.currentTimeMillis())); 
			 Serializable i= productsSer.edit(products, jqgridPage);
	  return "success";
}  
@RequestMapping ({"productImgUpload","background/productImgUpload"}) 
@ResponseBody
public String productImgUpload(
    @RequestParam("file") MultipartFile file,HttpServletRequest request) {  
    //MultipartFile是对当前上传的文件的封装，当要同时上传多个文件时，可以给定多个MultipartFile参数  
  String fileinname=null;
    if (!file.isEmpty()) {  
        try {
			byte[] bytes = file.getBytes();
			  System.out.println("开始");  
		        String path = request.getSession().getServletContext().getRealPath("uploadimg");  
		        String fileName = file.getOriginalFilename();
//		        String fileName = new Date().getTime()+".jpg";  
		        SimpleDateFormat df = new SimpleDateFormat("yyyyMMddHHmmss");//设置日期格式
		        System.out.println(df.format(new Date()));// new Date()为获取当前系统时间
//		        System.out.println(Initweb.imgPath);  
		        System.out.println(path);  
		         fileinname=df.format(new Date())+"."+file.getOriginalFilename().split("\\.")[1];
//		        File targetFile = new File(Initweb.imgPath, fileinname);  
		        File targetFile2 = new File(path, fileinname);  
//		        if(!targetFile.exists()){  
//		            targetFile.mkdirs();  
//		        }  
//		        if(!targetFile2.exists()){  
//		        	targetFile2.mkdirs();  
//		        }  
		        //保存  
		        try {  
		        	file.transferTo(targetFile2);  
	  				insertIntoImages(fileinname,bytes);
	  				
//		            file.transferTo(targetFile);  
//		            copyFile(targetFile,targetFile2); 
		            ImageUtils.resize(path,fileinname,	0.2);
//		            ImageUtils.resize(Initweb.imgPath,fileinname,	0.2);
		        } catch (Exception e) {  
		            e.printStackTrace();  
		        }  
//		        model.addAttribute("fileUrl", request.getContextPath()+"/upload/"+fileName);  

		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}  
       return fileinname;  
   } else {  
       return "uploadFailure";  
   }  
}  
@RequestMapping ({"productsImgUpload","background/productsImgUpload"}) 
@ResponseBody
public String productsImgUpload(
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
			SimpleDateFormat df = new SimpleDateFormat("yyyyMMddHHmmssSSS");//设置日期格式
			System.out.println(df.format(new Date()));// new Date()为获取当前系统时间
//			System.out.println(Initweb.imgPath);  
			System.out.println(path);  
			String n=df.format(new Date())+"."+file[i].getOriginalFilename().split("\\.")[1];
			fileinname.add(n);
//			File targetFile = new File(Initweb.imgPath, n);  
			File targetFile2 = new File(path, n);  
//			File targetFile = new File(path, n);  
//			if(!targetFile.exists()){  
//				targetFile.mkdirs();  
//			}  
//			if(!targetFile2.exists()){  
//				targetFile2.mkdirs();  
//			}  
			//保存  
			try {  
				file[i].transferTo(targetFile2);  
  				insertIntoImages(n,bytes);
  				
				
//				file[i].transferTo(targetFile);  
//				copyFile(targetFile,targetFile2);
//				ImageUtils.resize(Initweb.imgPath,n,	0.2);
				ImageUtils.resize(path,n,	0.2);
			} catch (Exception e) {  
				e.printStackTrace();  
			}  
//		        model.addAttribute("fileUrl", request.getContextPath()+"/upload/"+fileName);  
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
//