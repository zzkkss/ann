<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	
	<link rel="stylesheet" type="text/css" media="screen" href="js/jquery-ui-1.11.2.custom/jquery-ui.min.css" />
<link rel="stylesheet" type="text/css" media="screen" href="js/jquery.jqGrid-4.6.0/css/ui.jqgrid.css" />
<script type="text/javascript" src="js/jquery-1.11.1.min.js"></script>
<script src="js/jquery.jqGrid-4.6.0/js/i18n/grid.locale-cn.js" type="text/javascript"></script>
<script src="js/jquery.jqGrid-4.6.0/js/jquery.jqGrid.min.js" type="text/javascript"></script>
<script src="js/jquery-ui-1.11.2.custom/jquery-ui.min.js" type="text/javascript"></script>
<link href="js/AjaxFileUploader/ajaxfileupload.css" type="text/css" rel="stylesheet">
<script src="js/AjaxFileUploader/ajaxfileupload.js" type="text/javascript"></script>
<script src="js/Validform_v5.3.2/Validform_v5.3.2_min.js" type="text/javascript"></script>
	
<script type="text/javascript">
$(function() {
	$(".consoleForm").Validform({
		tiptype:2
	});
});
function timeformat(e){
	return new Date(e).toLocaleString();
}
var selectedRowid;
$(document).ready(function(){
    jQuery("#list1").jqGrid({
       	url:"memberByJqgrid.do",
    	datatype: "json",
    	height: "80%",
    	autowidth:true,
    	
       	colNames:['ID','姓名','时间','电话','地址','email','建议反馈'],
       	colModel:[
			{name:'id',index:'Id', width:150,hidden:true,editoptions:{defaultValue:0}},
       		{name:'name',index:'name', width:150,editable:true},
       		{name:'time',index:'time', width:50,sortable:false,editable:false,formatter:timeformat},
       		{name:'phone',index:'phone', width:150,editable:true},
       		{name:'address',index:'address', width:150,editable:true},
       		{name:'email',index:'email', width:150,editable:true},
       		{name:'demand',index:'demand', width:150,editable:true},
       	],
       	rowNum:10,
       	rowList:[10,20,30],
       	jsonReader: {  
            root:"entity",        // 数据行（默认为：rows）  
            page: "page",      // 当前页  
            total: "totalPages",  // 总页数  
            records: "totalRecords",  // 总记录数  
            repeatitems : false        // 设置成false，在后台设置值的时候，可以乱序。且并非每个值都得设  
        },  
        prmNames:{rows:"rows",page:"page",sort:"sort",order:"order", oper:"oper",},
       	pager: '#pager1',
       	sortname: 'Id',
        viewrecords: true,
        sortorder: "desc",
      //  caption:"会员管理",
        editurl:"memberEditByJqgrid.do",
        onSelectRow:function(rowid,status){
        	selectedRowid=rowid;
        }

    });
    jQuery("#list1").jqGrid('navGrid','#pager1',{edit:false,add:false,del:false,search:false}, {}, {}, {}, {}
    ).navButtonAdd('#pager1',{
    	   caption:"增加", 
    	   buttonicon:"ui-icon-add", 
    	   onClickButton: function(){ 
    	     jQuery("#list1").jqGrid('editGridRow', "new", {	
    	    	    addCaption: "增加新会员",
    	    		editCaption: "编辑当前会员",
    	    		bSubmit: "提交",
    	    		bCancel: "取消",
    	    		bClose: "关闭",
    	    		saveData: "数据已经改变，是否保存？",
    	    		bYes : "是",
    	    		bNo : "否",
    	    		bExit : "取消",
    	    		width:1024,
    	    		beforeShowForm : function(formid) {
    	    		},
    	    		beforeSubmit : function( postData,formid) {
    	    			postData.list1_id=0;
    	    			postData.addtime=new Date();
    	    			return[true,"success"];
    	    		},
    	    		closeAfterEdit:true
    	    		} );
    	   }, 
    	   position:"last"
    	}).navButtonAdd('#pager1',{
    	   caption:"修改", 
    	   buttonicon:"ui-icon-add", 
    	   onClickButton: function(){ 
    	     jQuery("#list1").jqGrid('editGridRow', selectedRowid, {	
    	    	    addCaption: "增加新慧眼",
    	    		editCaption: "编辑当前会员",
    	    		bSubmit: "提交",
    	    		bCancel: "取消",
    	    		bClose: "关闭",
    	    		saveData: "数据已经改变，是否保存？",
    	    		bYes : "是",
    	    		bNo : "否",
    	    		bExit : "取消",
    	    		width:1024,
    	    		beforeShowForm : function(formid) {
    	    		},
    	    		beforeSubmit : function( postData,formid) {
    	    			postData.addtime=new Date();
    	    			return[true,"success"];
    	    		},
    	    		closeAfterEdit:true
    	    		} );
    	   }, 
    	   position:"last"
    	}).navButtonAdd('#pager1',{
    	   caption:"删除", 
    	   buttonicon:"ui-icon-add", 
    	   onClickButton: function(){ 
    	     jQuery("#list1").jqGrid('delGridRow', selectedRowid, {	
    	    		bSubmit: "提交",
    	    		bCancel: "取消",
    	    		bClose: "关闭",
    	    		msg: "确定要删除吗？",
    	    		bYes : "是",
    	    		bNo : "否",
    	    		bExit : "取消",
    	    		beforeShowForm : function(formid) {
    	    		},
    	    		beforeSubmit : function( postData,formid) {
    	    			postData.addtime=new Date();
    	    			return[true,"success"];
    	    		}
    	    		} );
    	   }, 
    	   position:"last"
    	});	
  
	}); 
$("#btnAdd").click(function(){
    jQuery("#list1").jqGrid('editGridRow','new',{height:280,reloadAfterSubmit:true,closeOnEscape:true,addedrow:first});
});


function viewexcel(){
	var localObj = window.location;

		var contextPath = localObj.pathname.split("/")[1];

		var basePath = localObj.protocol+"//"+localObj.host+"/"+contextPath+"/";
		window.open(basePath+"viewExcel.do");
}
</script>
<style type="text/css">
#atop {
  background-color: #eef1f7;
  display: block;
  height: 70px;
}
#atop div:hover{
background-image: url('background/images/background_xuan_0000s_0000s_0001_filter-active-bg.png');
}
#atop div {
  display: inline-block;
  height: 20px;
  text-align: center;
  width: 72px;
  cursor: pointer;
  position: relative;
  top:24px;
}
#button{
width: 200px;
height: 50px;
}
</style>
<title>文章管理</title>
</head>
<body>
<div id="atop">
<!-- <div class="atopd" id="atopd0"><a href="background/aticleManage.jsp?type=0">全部</a></div>
<div class="atopd" id="atopd1"><a href="background/aticleManage.jsp?type=1">时尚生活</a></div>
<div class="atopd" id="atopd2"><a href="background/aticleManage.jsp?type=2">食品妙用</a></div>
<div class="atopd" id="atopd3"><a href="background/aticleManage.jsp?type=3">品牌动态</a></div> -->
</div>
<table id="list1" ></table> <div id="pager1"></div>
<input name="button" type="button" id="button" value="保存excel"
onclick="viewexcel()"/>
</body>
</html>