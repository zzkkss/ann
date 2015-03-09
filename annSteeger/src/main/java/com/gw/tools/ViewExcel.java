package com.gw.tools;
import java.io.OutputStream;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFCellStyle;
import org.apache.poi.hssf.usermodel.HSSFDataFormat;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.springframework.web.servlet.view.document.AbstractExcelView;

import com.gw.model.Article;
import com.gw.model.Member;
/**
* 生成excel视图，可用excel工具打开或者保存
* 由ViewController的return new ModelAndView(viewExcel, model)生成
* @author Tony Lin Created on 2008-10-22
* @version Version 1.0
*/
public class ViewExcel extends AbstractExcelView {  
  
    public void buildExcelDocument(Map model, HSSFWorkbook workbook,  
            HttpServletRequest request, HttpServletResponse response)  
            throws Exception {  
  
        HSSFSheet sheet = workbook.createSheet("list");  
        sheet.setDefaultColumnWidth((short) 12);  
  
        HSSFCell cell = getCell(sheet, 0, 0);  
        setText(cell, "会员记录导出");  
        cell = getCell(sheet, 0, 1);  
        setText(cell, "序号");  
        cell = getCell(sheet, 0, 2);  
        setText(cell, "姓名");  
        cell = getCell(sheet, 0, 3);  
//        setText(cell, "性别");  
//        cell = getCell(sheet, 0, 4);  
//        setText(cell, "电话");  
//        cell = getCell(sheet, 0, 5);  
//        setText(cell, "地址");  
//        cell = getCell(sheet, 0, 6);  
//        setText(cell, "电子邮件");  
//        cell = getCell(sheet, 0, 7);  
//        setText(cell, "证件类型");  
//        cell = getCell(sheet, 0, 8);  
//        setText(cell, "证件号码");  
//        cell = getCell(sheet, 0, 9);  
//        setText(cell, "是否接受推送");  
  int lie=0,hang=0;
        HSSFCellStyle dateStyle = workbook.createCellStyle();  
        //dateStyle.setDataFormat(HSSFDataFormat.getBuiltinFormat("mm/dd/yyyy"));  
        List<Member> list=(List<Member>) model.get("list");
        for(int i=0;i<list.size();i++){
        	cell = getCell(sheet, i+1, 1);  
            setText(cell, list.get(i).getId().toString());  
            cell = getCell(sheet, i+1, 2);  
            setText(cell, list.get(i).getName());  
//            cell = getCell(sheet, i+1, 3);  
//            setText(cell, list.get(i).getSex());  
//            cell = getCell(sheet, i+1, 4);  
//            setText(cell, list.get(i).getPhone());	
//            cell = getCell(sheet, i+1, 5);  
//            setText(cell, list.get(i).getAddress());	
//            cell = getCell(sheet, i+1, 6);  
//            setText(cell, list.get(i).getEmail());	
//            cell = getCell(sheet, i+1, 7);  
//            setText(cell, list.get(i).getIdtype());	
//            cell = getCell(sheet, i+1, 8);  
//            setText(cell, list.get(i).getIdnum());	
//            cell = getCell(sheet, i+1, 9);  
//            setText(cell, list.get(i).getPushmsg());	
        }
        SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");//设置日期格式
			System.out.println(df.format(new Date()));// new Date()为获取当前系统时间
  String filename="yonghuxiangqing"+df.format(new Date())+".xls";
  response.setContentType("application/vnd.ms-excel");
  response.setHeader("Content-disposition", "attachment;filename="+filename);
  OutputStream outputStream=response.getOutputStream();
  workbook.write(outputStream);
  outputStream.flush();
  outputStream.close();
  
    }  
}