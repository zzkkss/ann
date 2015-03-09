<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <%  
      String path = request.getContextPath();  
      String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";  
    %>  
<base href="<%=basePath %>"/>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="Author" content="zks" />
<meta http-equiv="X-UA-Compatible" content="IE=7,9,10" />
<script type="text/javascript" src="background/js/jquery-1.11.1.min.js"></script>
<style type="text/css">
body
  {
  background-color: #1f2637;
  }
 .zuo {
  display: block;
  font-size: 12px;
  line-height: 50px;
  text-align: center;
  color: #78829d;
}
.zuo:hover{
color: #ffffff;
      background: none repeat scroll 0 0 #26723a;
      cursor: pointer;
}

</style>

 <script type="text/javascript">
	$(function() {
					
		  $( ".zuo" ).click(function() {
		    		$(".zuo").css("background-image","");
		    		$(".zuo").css("color","#78829d");
		    		$("#"+this.id).css("background-image","url('background/images/health_0000s_0000s_0001s_0001_lv.png'");
		    		 $("#productManage img").attr("src","background/images/background_hui_0000s_0003_product.png");
	    			 $("#aticleManage img").attr("src","background/images/background_hui_0000s_0002_article.png");
	    			 $("#workManage img").attr("src","background/images/background_hui_0000s_0001_work.png");
	    			 $("#trainingManage img").attr("src","background/images/background_hui_0000s_0001_work.png");
	    			 $("#memberManage img").attr("src","background/images/background_hui_0000s_0000_member.png");
		    		//self.parent.frames["indexRight"].src="background/"+this.id+".jsp";
		    		self.parent.document.getElementById("indexRight").src="background/"+this.id+".jsp?type=0";
		    		if(this.id=="productManage"){
		    			 $("#productManage img").attr("src","background/images/background_bai_0000s_0003_product.png");
		    			 $("#"+this.id).css("color","#ffffff");
		    		}else if(this.id=="aticleManage"){
		    			 $("#aticleManage img").attr("src","background/images/background_bai_0000s_0003_product.png");
		    			 $("#"+this.id).css("color","#ffffff");
		    		}else if(this.id=="workManage"){
		    			 $("#workManage img").attr("src","background/images/background_bai_0000s_0003_product.png");
		    			 $("#"+this.id).css("color","#ffffff");
		    		
		    		}else if(this.id=="trainingManage"){
		    			 $("#trainingManage img").attr("src","background/images/background_bai_0000s_0003_product.png");
		    			 $("#"+this.id).css("color","#ffffff");
		    		}else if(this.id=="memberManage"){
		    			 $("#memberManage img").attr("src","background/images/background_bai_0000s_0003_product.png");
		    			 $("#"+this.id).css("color","#ffffff");
		    		}
		    	});
		/*    $("#productManage").mouseover(function(){
			  $("#productManage img").attr("src","background/images/background_bai_0000s_0003_product.png");
		   });
		   $("#productManage").mouseout(function(){
			  $("#productManage img").attr("src","background/images/background_hui_0000s_0003_product.png");
		   });
		   $("#aticleManage").mouseover(function(){
			  $("#aticleManage img").attr("src","background/images/background_bai_0000s_0002_article.png");
		   });
		   $("#aticleManage").mouseout(function(){
			  $("#aticleManage img").attr("src","background/images/background_hui_0000s_0002_artcle.png");
		   });
		   $("#workManage").mouseover(function(){
			  $("#workManage img").attr("src","background/images/background_bai_0000s_0001_work.png");
		   });
		   $("#workManage").mouseout(function(){
			  $("#workManage img").attr("src","background/images/background_hui_0000s_0001_work.png");
		   });
		   $("#memberManage").mouseover(function(){
			  $("#memberManage img").attr("src","background/images/background_bai_0000s_0000_member.png");
		   });
		   $("#memberManage").mouseout(function(){
			  $("#memberManage img").attr("src","background/images/background_hui_0000s_0000_member.png");
		   }); */
				/* 	$("#aticleManage").click(); */
	});
		  
 </script>
</head>

<body>
<div>
<span  class="zuo" id="aticleManage"><img alt="" src="background/images/background_hui_0000s_0002_article.png">文章管理</span>
</div>
<div>
<span class="zuo" id="productManage"><img  alt="" src="background/images/background_hui_0000s_0003_product.png">产品管理</span>
</div>
<!-- <div>
<span  class="zuo" id="workManage"><img alt="" src="background/images/background_hui_0000s_0001_work.png">招聘管理</span>
</div>
<div>
<span  class="zuo" id="trainingManage"><img alt="" src="background/images/background_hui_0000s_0001_work.png">培训管理</span>
</div> -->
<div>
<span  class="zuo" id="memberManage"><img alt="" src="background/images/background_hui_0000s_0000_member.png">会员管理</span>
</div>
</body>
</html>