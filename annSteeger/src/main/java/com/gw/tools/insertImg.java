package com.gw.tools;

import java.awt.Image;
import java.awt.Toolkit;
import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

public class insertImg {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		insertImg();
		//getImg(1);
	}
private static void getImg(int i) {
		// TODO Auto-generated method stub
	 try {
         Connection con = null; //定义一个MYSQL链接对象
         Class.forName("com.mysql.jdbc.Driver").newInstance(); //MYSQL驱动
         con = DriverManager.getConnection("jdbc:mysql://114.215.130.235:3306/annSteeger", "root", "mysql"); //链接本地MYSQL
         System.out.println("yes");
         Statement stmt; //创建声明
         stmt = con.createStatement();
         
         ResultSet rs=stmt.executeQuery("select * from images where id='"+i+"'");
         if (!rs.next()) {
           System.out.println("Image:"+i+" not found");
         }
       //  int len=rs.getInt(2);

        // byte [] b=new byte[len];
         InputStream in = rs.getBinaryStream("img");
         String name=rs.getString("name");
         BufferedInputStream bin = new BufferedInputStream(in);
        // int n=in.read(b);
        // System.out.println("n: "+n);
//         Image img=Toolkit.getDefaultToolkit().createImage(b);
//         System.out.println("Image: "+i+" retrieved ok, size: "+len);
         
//         
         PrintStream pout = new PrintStream("/Users/zhangkaisheng/Desktop/"+name);
         BufferedOutputStream bout = new BufferedOutputStream(pout);
         int count;
         while((count = bin.available())!= 0){
        	 int c = bin.read();  //从输入流中读一个字节
        	 bout.write((char)c);  //将字节（字符）写到输出流中     
         }
         bout.close();
         pout.close();
//         
         bin.close();
         in.close();
         
       System.out.println("End");
         
      

     } catch (Exception e) {
         System.out.print(" ERROR:" + e.getMessage());
     }
	}
private static void insertImg(){
	   try {
           Connection con = null; //定义一个MYSQL链接对象
           Class.forName("com.mysql.jdbc.Driver").newInstance(); //MYSQL驱动
           con = DriverManager.getConnection("jdbc:mysql://114.215.130.235:3306/annSteeger", "root", "mysql"); //链接本地MYSQL
           System.out.println("yes");
           Statement stmt; //创建声明
           stmt = con.createStatement();
           
           
           File origindirectory = new File("/usr/software/updateImg");   //源路径File实例
           if(!origindirectory.isDirectory() ){    //判断是不是正确的路径
                       System.out.println("不是正确的目录！");
                       return;
           }
           File[] fileList = origindirectory.listFiles();  //目录中的所有文件
           for(File file : fileList){
                     if(!file.isFile())   //判断是不是文件
                     continue;
                     System.out.println(file.getName());
                     try{
                              FileInputStream fin = new FileInputStream(file);
                          
                              //新增一条数据
//              	            stmt.executeUpdate("INSERT INTO images (name, img) VALUES ("+file.getName()+", "+fin+")");
              	            
              	         
                           PreparedStatement ps = con.prepareStatement("INSERT INTO images (name, img) VALUES (?,?)");
                           ps.setString(1, file.getName());
                           ps.setBinaryStream(2, fin, (int) fin.available());
                           ps.executeUpdate(); 
              	            
              	            
              	            ResultSet res = stmt.executeQuery("select LAST_INSERT_ID()");
              	            int ret_id;
              	            if (res.next()) {
              	                ret_id = res.getInt(1);
              	                System.out.print(ret_id);
              	            }
              	            fin.close();
              	          //  ps.close();
                     }catch(IOException e){
                              e.printStackTrace();
                     }
          }
         System.out.println("End");
           
           
////           //新增一条数据
//           stmt.executeUpdate("INSERT INTO images (name, img) VALUES ('init', '123456')");
//           ResultSet res = stmt.executeQuery("select LAST_INSERT_ID()");
//           int ret_id;
//           if (res.next()) {
//               ret_id = res.getInt(1);
//               System.out.print(ret_id);
//           }
//
//           //删除一条数据
//           String sql = "DELETE FROM user WHERE id = 1";
//           long deleteRes = stmt.executeUpdate(sql); //如果为0则没有进行删除操作，如果大于0，则记录删除的条数
//           System.out.print("DELETE:" + deleteRes);
//
//           //更新一条数据
//           String updateSql = "UPDATE user SET username = 'xxxx' WHERE id = 2";
//           long updateRes = stmt.executeUpdate(updateSql);
//           System.out.print("UPDATE:" + updateRes);

           //查询数据并输出
//           String selectSql = "SELECT * FROM user";
//           ResultSet selectRes = stmt.executeQuery(selectSql);
//           while (selectRes.next()) { //循环输出结果集
//               String name = selectRes.getString("username");
//               InputStream img = selectRes.getBinaryStream("img");
//               
//           }

       } catch (Exception e) {
           System.out.print("MYSQL ERROR:" + e.getMessage());
       }
}
}
