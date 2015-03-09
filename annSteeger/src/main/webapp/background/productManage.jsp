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
<script src="js/tinymce_4.1.7/js/tinymce/tinymce.min.js" type="text/javascript" ></script>

<script>
	tinymce.init({
		selector:'textarea',
		language : 'zh_CN'});
	
	
</script>
<script type="text/javascript">
var jsonServerBack;
$(function() {
	$(".consoleForm").Validform({
		tiptype:2
	});
	 $( "#showtime" ).dialog({
		 autoOpen: false,
		 show: {
		 effect: "blind",
		 duration: 300,
		 },
		 hide: {
		 effect: "explode",
		 duration: 300
		 },
		 width:800
		 });

});
function GetQueryString(name)
{
     var reg = new RegExp("(^|&)"+ name +"=([^&]*)(&|$)");
     var r = window.location.search.substr(1).match(reg);
     if(r!=null)return  unescape(r[2]); return null;
}
var t=GetQueryString("type");
if(t==null){
	t=1;
}
$(document).ready(function(){
switch (parseInt(t)) {
case 1:
	$("#shuoming").html("使用说明：这个是香氛系列的第一个窗口显示内容。<p>广告语以及产品内容可以使用html代码，例如颜色，背景等。<p>标题不应超过10汉字。英文标题和规格参数不应超过20字母。广告语1和广告语二不应超过50汉字，产品内容不应超过100汉字。");
	break;
case 2:
	$("#shuoming").html("使用说明：这个是香氛系列的第二个窗口显示内容。<p>广告语以及产品内容可以使用html代码，例如颜色，背景等。<p>标题不应超过10汉字。英文标题和规格参数不应超过20字母。广告语1和广告语二不应超过50汉字，产品内容不应超过100汉字。");
	break;
case 3:
	$("#shuoming").html("使用说明：这个是香氛系列的第三个窗口显示内容。<p>广告语以及产品内容可以使用html代码，例如颜色，背景等。<p>标题不应超过10汉字。英文标题和规格参数不应超过20字母。广告语1和广告语二不应超过50汉字，产品内容不应超过100汉字。");
	break;
case 4:
	$("#shuoming").html("使用说明：这个是草棉籽油系列的产品列表。<p>广告语以及产品内容可以使用html代码，例如颜色，背景等。<p>标题不应超过10汉字。广告语1和广告语二不应超过50汉字，产品内容不应超过100汉字。");
	break;
case 5:
	$("#shuoming").html("使用说明：这个是草棉籽油橱窗窗口显示内容。<p>广告语以及产品内容可以使用html代码，例如颜色，背景等。<p>标题不应超过15汉字.英文标题和规格参数不应超过20字母。广告语1和广告语二不应超过50汉字，产品内容不应超过100汉字");
	break;
	
default:
	$("#shuoming").html("使用说明。");
	break;
}
});
var selectedRowid;
$(document).ready(function(){
    jQuery("#list1").jqGrid({
       	url:"productByJqgrid.do",
    	datatype: "json",
    	height: "80%",
    	autowidth:true,
    	postData:{
    		type:t
    	},
       	colNames:['ID','产品名称','英文名称','广告语1','广告语2','产品类型','图片链接','发布时间','产品内容','产品规格','主要展示图'],
       	colModel:[
			{name:'id',index:'Id', width:50,hidden:true,editoptions:{defaultValue:0}},
       		{name:'name',index:'name', width:50,editable:true},
       		{name:'ename',index:'ename', width:50,editable:true},
       		{name:'ad1',index:'ad1', width:50,editable:true,formatter:contentformat},
       		{name:'ad2',index:'ad2', width:50,editable:true,formatter:contentformat},
       		{name:'type',index:'type', width:50,editable:true,edittype:'select',formatter:typeformat,editoptions:{
       			value:{0:'进口果仁系列',1:'香氛系列1',2:'香氛系列2',3:'香氛系列3',4:'草棉籽油系列',5:'草棉籽油展示橱窗',6:'礼品装系列',7:'专卖店专有系列',8:'其他系列',9:'服务性产品',10:'最新产品'
       				}}},
       		{name:'imgpath',index:'imgpath', width:50,editable:true,formatter:imgformat},
       		{name:'addtime',index:'addtime', width:50,sortable:false,editable:false,formatter:timeformat},
       		{name:'content',index:'content', editable:true,formatter:contentformat},
       		{name:'capacity',index:'capacity', width:50,editable:true},
       		{name:'firstimg',index:'firstimg', width:50,editable:true,formatter:imgformatfirst}
       	],
   /*  }else if(e==1){
		return "香氛系列1";
	}else if(e==2){
		return "香氛系列2";
	}else if(e==3){
		return "香氛系列3";
	}else if(e==4){
		return "草棉籽油系列";
	}else if(e==5){
		return "草棉籽油展示橱窗"; */
       	rowNum:10,
       	rowList:[10,20,30],
       	jsonReader: {  
           // root:"entity",        // 数据行（默认为：rows）  
           root:function (obj) { 
        	   jsonServerBack=obj;
        	   return obj.entity; },
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
       // caption:"产品管理",
        editurl:"productEditByJqgrid.do",
        onSelectRow:function(rowid,status){
        	selectedRowid=rowid;
        }

    });
    jQuery("#list1").jqGrid('navGrid','#pager1',{edit:false,add:false,del:false,search:false}, {}, {}, {}, {}
    );
    // 配置对话框  
    $("#consoleDlg").dialog({  
        autoOpen: false,      
        modal: true,    // 设置对话框为模态（modal）对话框  
        resizable: true,      
        width: 800,  
        buttons: {  // 为对话框添加按钮  
            "取消": function() {$("#consoleDlg").dialog("close")},  
            "创建": addContact,  
            "保存": updateContact,  
            "删除": deleteContact  
        }  
    });  
   /*  if(t==5){
    jQuery("#list1").jqGrid('hideCol',["ad1","ename","ad2","type","imgpath","content","capacity"]);
  
 
    $("#ad1").parent().parent().css("display","none");
    $("#ad2").parent().parent().css("display","none");
    $("#ename").parent().parent().css("display","none");
    $("#type").parent().parent().css("display","none");
    $("#imgpath").parent().parent().css("display","none");
    $("#content").parent().parent().css("display","none");
    $("#capacity").parent().parent().css("display","none");
    }else{
    	
    } */
	}); 
$("#btnAdd").click(function(){
    jQuery("#list1").jqGrid('editGridRow','new',{height:280,reloadAfterSubmit:true,closeOnEscape:true,addedrow:first});
});

function timeformat(e){
	return new Date(e).toLocaleString();
}
function contentformat(e){
	return "\<button class='djck' onclick='dianjichakan(this)' name='"+ e+"' \\>点击查看\<\/button\>";
}
function imgformat(e){
	return "\<button class='djck' onclick='dianjichakanimg(this)' name='"+ e+"' \\>点击查看\<\/button\>";
}
function imgformatfirst(e){
	return "\<button class='djck' onclick='dianjichakanimgf(this)' name='"+ e+"' \\>点击查看\<\/button\>";
}

function dianjichakan(e){
	$( "#showtime" ).html();
	$( "#showtime" ).html(e.name);
	$( "#showtime" ).dialog( "open" );
}
function dianjichakanimg(e){
	$( "#showtime" ).html();
	$( "#showtime" ).html("<img src='../uploadimg/"+e.name.substring(1,e.name.length-1)+"' />");
	$( "#showtime" ).dialog( "open" );
}
function dianjichakanimgf(e){
	$( "#showtime" ).html();
	$( "#showtime" ).html("<img src='../uploadimg/"+e.name+"' />");
	$( "#showtime" ).dialog( "open" );
}
$( "#showtime" ).dialog({
	autoOpen: false,
	width: 400,
	buttons: [
		{
			text: "Ok",
			click: function() {
				$( this ).dialog( "close" );
			}
		}
		/* ,
		{
			text: "Cancel",
			click: function() {
				$( this ).dialog( "close" );
			}
		} */
	]
});
function typeformat(e){
	if(e==0){
		return "进口果仁系列";
	}else if(e==1){
		return "香氛系列1";
	}else if(e==2){
		return "香氛系列2";
	}else if(e==3){
		return "香氛系列3";
	}else if(e==4){
		return "草棉籽油系列";
	}else if(e==5){
		return "草棉籽油展示橱窗";
	}else if(e==6){
		return "礼品装系列";
	}else if(e==7){
		return "专卖店专有系列";
	}else if(e==8){
		return "其他系列";
	}else if(e==9){
		return "服务性产品";
	}else if(e==10){
		return "最新产品";
	}else{
		return "其他";
	}
}


var openDialog4Adding = function() {  
	$("#type").val(t);
    var consoleDlg = $("#consoleDlg");  
    var dialogButtonPanel = consoleDlg.siblings(".ui-dialog-buttonpane");  
    consoleDlg.find("input").removeAttr("disabled").val("");  
    dialogButtonPanel.find("button:not(:contains('取消'))").hide();  
    dialogButtonPanel.find("button:contains('创建')").show(); 
    consoleDlg.dialog("option", "title", "添加产品信息").dialog("open");  
	  consoleDlg.find("#type").val(t);  
};  
var openDialog4Updating = function() {  
    var consoleDlg = $("#consoleDlg");  
    var dialogButtonPanel = consoleDlg.siblings(".ui-dialog-buttonpane");  
      
    consoleDlg.find("input").removeAttr("disabled");  
    dialogButtonPanel.find("button:not(:contains('取消'))").hide();  
    dialogButtonPanel.find("button:contains('保存')").show();  
    consoleDlg.dialog("option", "title", "修改产品信息");  
    loadSelectedRowData();  
};
var openDialog4Deleting = function() {  
    var consoleDlg = $("#consoleDlg");  
    var dialogButtonPanel = consoleDlg.siblings(".ui-dialog-buttonpane");  
      
    consoleDlg.find("input").attr("disabled", true);  
    dialogButtonPanel.find("button:not(:contains('取消'))").hide();  
    dialogButtonPanel.find("button:contains('删除')").show();  
    consoleDlg.dialog("option", "title", "删除产品信息");  
    loadSelectedRowData();  
};  
var loadSelectedRowData = function() {    
    var selectedRowId = $("#list1").jqGrid("getGridParam", "selrow");  
    if (!selectedRowId) {  
        alert("请先选择需要编辑的行!");  
        return false;  
    } else {  
        var params = {  
            "id" : selectedRowId  
        };  
        var actionUrl = "ProductById.do";  
        // 从Server读取对应ID的JSON数据  
        $.ajax( {  
        	 type:"post",
            url : actionUrl,  
            data : params,  
            dataType : "json",  
            cache : false,  
            error : function(textStatus, errorThrown) {  
                alert("系统ajax交互错误: " + textStatus);  
            },  
            success : function(data, textStatus) {  
                // 如果读取结果成功，则将信息载入到对话框中                   
                var rowData = data;  
                var consoleDlg = $("#consoleDlg");  
             /*    var name = $.trim(consoleDlg.find("#name").val());  
                var type = $.trim(consoleDlg.find("#type").val());  
                var imgpath = $.trim(consoleDlg.find("#imgpath").val());  
                var content = $.trim(consoleDlg.find("#content").val());   */
                /* 	<tr>
            	<th>产品名称：</th>
            	<td><input type="text" class="textField" id="name"
            		name="name" datatype="*" /></td>
            	<th>英文名称：</th>
            	<td><input type="text" class="textField" id="ename"
            		name="ename" datatype="*" /></td>
            	<th>产品规格：</th>
            	<td><input type="text" class="textField" id="capacity"
            		name="capacity" datatype="*" /></td>
            	<th>产品类型：</th>
            	<td><select id="type" name="type">
            	<th>广告语1：</th>
            	<td><input type="text" class="textField" id="ad1"
            		name="ad1" style="display: none" /> <textarea id="tinyT"
            	<th>广告语2：</th>
            	<td><input type="text" class="textField" id="ad2"
            		name="ad2" style="display: none" /> <textarea id="tinyT"
            	<th>产品内容：</th>
            	<td><input type="text" class="textField" id="content"
            		name="content" style="display: none" /> <textarea id="tinyT"
            	<th>图片路径：</th>
            	<td><input type="text" class="textField" id="imgpath"
            		name="imgpath" readonly="readonly" datatype="*" /></td>
            </tr>
             */
             
                consoleDlg.find("#selectId").val(rowData.id);  
                consoleDlg.find("#name").val(rowData.name);  
                consoleDlg.find("#ename").val(rowData.ename);  
                consoleDlg.find("#capacity").val(rowData.capacity);  
                consoleDlg.find("#type").val(rowData.type);  
                consoleDlg.find("#ad1").val(rowData.ad1);  
                consoleDlg.find("#ad2").val(rowData.ad2);  
                
                consoleDlg.find("#imgpath").val(rowData.imgpath);  
                consoleDlg.find("#content").val(rowData.content);  
                consoleDlg.find("#firstimg").val(rowData.firstimg);  
                  
                tinyMCE.get('tinyTad1').setContent(rowData.ad1);
                tinyMCE.get('tinyTad2').setContent(rowData.ad2);
                tinyMCE.get('tinyT').setContent(rowData.content);
                // 根据新载入的数据将表格中的对应数据行一并更新一下  
                var dataRow = {  
                        id : rowData.id,  
                        name : rowData.name,  
                        ename : rowData.ename,  
                        capacity : rowData.capacity,  
                        type : rowData.type,  
                        ad1 : rowData.ad1,  
                        ad2 : rowData.ad2,  
                        imgpath : rowData.imgpath,  
                        content : rowData.content,
                        firstimg:rowData.firstimg
                    };  
                  
                $("#gridTable").jqGrid("setRowData", data.id, dataRow);  
                      
                // 打开对话框  
                consoleDlg.dialog("open");  
            }  
        });  
          
    }  
};  
var addContact = function() {  
	var demo=$(".consoleForm").Validform();
	if(demo.check(false,'')){
		   var consoleDlg = $("#consoleDlg");  

      /*      consoleDlg.find("#selectId").val(rowData.id);  
           consoleDlg.find("#name").val(rowData.name);  
           consoleDlg.find("#ename").val(rowData.ename);  
           consoleDlg.find("#capacity").val(rowData.capacity);  
           consoleDlg.find("#type").val(rowData.type);  
           consoleDlg.find("#ad1").val(rowData.ad1);  
           consoleDlg.find("#ad2").val(rowData.ad2);  
           
           consoleDlg.find("#imgpath").val(rowData.imgpath);  
           consoleDlg.find("#content").val(rowData.content);  
           consoleDlg.find("#firstimg").val(rowData.firstimg);  
             
           tinyMCE.get('tinyTad1').setContent(rowData.ad1);
           tinyMCE.get('tinyTad2').setContent(rowData.ad2);
           tinyMCE.get('tinyT').setContent(rowData.content); */
		    var name = $.trim(consoleDlg.find("#name").val());  
		    var ename = $.trim(consoleDlg.find("#ename").val());  
		    var capacity = $.trim(consoleDlg.find("#capacity").val());  
		    var type = $.trim(consoleDlg.find("#type").val());  
		    var imgpath = $.trim(consoleDlg.find("#imgpath").val());  
		    var firstimg = $.trim(consoleDlg.find("#firstimg").val());  
		    var content = tinyMCE.get('tinyT').getContent();  
		    var ad1 = tinyMCE.get('tinyTad1').getContent();  
		    var ad2 = tinyMCE.get('tinyTad2').getContent();  
		    
		   /*  {name:'id',index:'Id', width:150,hidden:true,editoptions:{defaultValue:0}},
				{name:'name',index:'name', width:150,editable:true},
				{name:'type_id',index:'type_id', width:150,editable:true,edittype:'select',formatter:typeformat,editoptions:{
					value:{0:'进口果仁系列',1:'进口果干系列',2:'国产果仁系列',3:'国产蜜饯系列',4:'西梅系列',5:'罐装系列',6:'礼品装系列',7:'专卖店专有系列',8:'其他系列',9:'服务性产品'
						}}},
				{name:'imgpath',index:'imgpath', width:150,editable:true},
				{name:'addtime',index:'addtime', width:150,sortable:false,editable:false,formatter:timeformat} */
		    var params = {  
				"oper":"add",
		        "name":name,  
		        "ename":ename,  
		        "capacity":capacity,  
		        "firstimg":firstimg,  
		        "type":type,  
		        "imgpath":imgpath,  
		        "content":content, 
		        "ad1":ad1, 
		        "ad2":ad2, 
		        "id":0
		    };  
		      
		    var actionUrl = "productEditByJqgrid.do";
		      
		  $.ajax({
			  type:"post",
		        url : actionUrl,  
		        data : params,  
		        dataType : "text",  
		        cache : false,  
		        error : function(textStatus, errorThrown) {  
		            alert("系统ajax交互错误: " + textStatus);  
		        },  
		        success : function(data, textStatus) {  
		            if(data == "success") {  
		                var dataRow = {  
		                  //  id : data.contact.id,   // 从Server端得到系统分配的id  
		                    name : name,  
		                    type : type,  
		                    imgpath : imgpath,  
		                    content : content  
		                };  
		                  
		                var srcrowid = $("#list1").jqGrid("getGridParam", "selrow");  
		                  
		                if(srcrowid) {  
		                    $("#list1").jqGrid("addRowData", 0, dataRow, "before", srcrowid);  
		                } else {  
		                    $("#list1").jqGrid("addRowData", 0, dataRow, "first");  
		                }  
		                consoleDlg.dialog("close");  
		                  
		                  
		            } else {  
		                alert("添加操作失败!");  
		            }  
		        }  
		    });  
	}else{
		//alert("请检查表单！");
	}
 
};  
var updateContact = function() {  var demo=$(".consoleForm").Validform();
if(demo.check(false,'')){

    var consoleDlg = $("#consoleDlg");  
      
    var pId = $.trim(consoleDlg.find("#selectId").val());  
    var name = $.trim(consoleDlg.find("#name").val());  
    var ename = $.trim(consoleDlg.find("#ename").val());  
    var capacity = $.trim(consoleDlg.find("#capacity").val());  
    var type = $.trim(consoleDlg.find("#type").val());  
    var imgpath = $.trim(consoleDlg.find("#imgpath").val());  
    var firstimg = $.trim(consoleDlg.find("#firstimg").val());  
    var content = tinyMCE.get('tinyT').getContent();  
    var ad1 = tinyMCE.get('tinyTad1').getContent();  
    var ad2 = tinyMCE.get('tinyTad2').getContent();  
    
    
   /*  {name:'id',index:'Id', width:150,hidden:true,editoptions:{defaultValue:0}},
		{name:'name',index:'name', width:150,editable:true},
		{name:'type_id',index:'type_id', width:150,editable:true,edittype:'select',formatter:typeformat,editoptions:{
			value:{0:'进口果仁系列',1:'进口果干系列',2:'国产果仁系列',3:'国产蜜饯系列',4:'西梅系列',5:'罐装系列',6:'礼品装系列',7:'专卖店专有系列',8:'其他系列',9:'服务性产品'
				}}},
		{name:'imgpath',index:'imgpath', width:150,editable:true},
		{name:'addtime',index:'addtime', width:150,sortable:false,editable:false,formatter:timeformat} */
    var params = {  
		"oper":"edit",
        "name":name,  
        "ename":ename,  
        "capacity":capacity,  
        "firstimg":firstimg,  
        "type":type,  
        "imgpath":imgpath,  
        "content":content, 
        "ad1":ad1, 
        "ad2":ad2, 
        "id":pId
    };  
    var actionUrl = "productEditByJqgrid.do";  
    
    $.ajax( {  
    	 type:"post",
        url : actionUrl,  
        data : params,  
        dataType : "text",  
        cache : false,  
        error : function(textStatus, errorThrown) {  
            alert("系统ajax交互错误: " + textStatus);  
        },  
        success : function(data, textStatus) {  
             if (data == "success") {  
                var dataRow = {  
                    id : pId,  
                    name : name,  
                    type : type,  
                    imgpath : imgpath,  
                    content : content  
                };  
                $("#list1").jqGrid("setRowData", pId, dataRow, {color:"#FF0000"});  
                  
                  
                consoleDlg.dialog("close");  
                  
            } else {  
                alert("修改操作失败!");  
            }   
        }  
    }); 
}else{
	//alert("请检查表单！");
}
};  
var deleteContact = function() {  
    var consoleDlg = $("#consoleDlg");  
      
    var pId = $.trim(consoleDlg.find("#selectId").val());  
    var params = {  
    		"oper":"del",
        "id" : pId  
    };  
    var actionUrl = "productEditByJqgrid.do";  
    $.ajax({  
    	 type:"post",
        url : actionUrl,  
        data : params,  
        dataType : "text",  
        cache : false,  
        error : function(textStatus, errorThrown) {  
            alert("系统ajax交互错误: " + textStatus);  
        },  
        success : function(data, textStatus) {  
            if (data == "success") {  
                $("#list1").jqGrid("delRowData", pId);  
                  
                consoleDlg.dialog("close");  
            } else {  
                alert("删除操作失败!");  
            }  
        }  
    });  
};  

</script>
<script type="text/javascript">
	
    var count = 1;  
    /** 
    * 生成多附件上传框 
    */  
    function createInput(parentId){  
        count++;  
        var str = '<div name="div" ><font style="font-size:12px;">附件</font>'+  
        '   '+ '<input type="file" contentEditable="false" id="file' + count + '' +  
        '" name="file'+ count +'"  value="" style="width: 220px"/><input type="button"  value="删除" onclick="removeInput(event,'+"'more'"+')" />'+'</div>';  
        document.getElementById(parentId).insertAdjacentHTML("beforeEnd",str);  
    }  
    /** 
    * 删除多附件删除框 
    */  
    function removeInput(evt, parentId){  
       var el = evt.target == null ? evt.srcElement : evt.target;  
       var div = el.parentNode;  
       var cont = document.getElementById(parentId);         
       if(cont.removeChild(div) == null){  
        return false;  
       }  
       return true;  
    }  
    function addOldFile(data){  
        var str = '<div name="div' + data.name + '" ><a href="#" style="text-decoration:none;font-size:12px;color:red;" onclick="removeOldFile(event,' + data.id + ')">删除</a>'+  
        '   ' + data.name +   
        '</div>';  
        document.getElementById('oldImg').innerHTML += str;  
    }  
      
    function removeOldFile(evt, id){  
        //前端隐藏域，用来确定哪些file被删除，这里需要前端有个隐藏域  
        $("#imgIds").val($("#imgIds").val()=="" ? id :($("#imgIds").val() + "," + id));  
        var el = evt.target == null ? evt.srcElement : evt.target;  
        var div = el.parentNode;  
        var cont = document.getElementById('oldImg');      
        if(cont.removeChild(div) == null){  
            return false;  
        }  
        return true;  
    }  
    function ajaxFileUploadImg(id){ 
    	$(document)
		.ajaxStart(function(){
			 var consoleDlg = $("#consoleDlg");  
			 var dialogButtonPanel = consoleDlg.siblings(".ui-dialog-buttonpane");  
			 dialogButtonPanel.find("button:contains('创建')").hide(); 
			$("#loading").show();
		})
		.ajaxComplete(function(){
			 var consoleDlg = $("#consoleDlg");  
			 var dialogButtonPanel = consoleDlg.siblings(".ui-dialog-buttonpane");  
			 dialogButtonPanel.find("button:contains('创建')").show(); 
			$("#loading").hide();
		});
        //获取file的全部id  
        var uplist = $("input[name^=file]");  
    var file = [];  
    for (var i=0; i< uplist.length; i++){  
        if(uplist[i].value){  
        	file[i] = uplist[i].id;  
        }  
        }  
    $.ajaxFileUpload({  
        url:'productsImgUpload.do',  
        secureuri:false,  
        fileElementId: file,  //这里不在是以前的id了，要写成数组的形式哦！  
        fileElementName: "file",  //这里不在是以前的id了，要写成数组的形式哦！  
        dataType: 'text',  
        data: {  
                     //需要传输的数据  
                },  
        success: function (data){  
        	$("#imgpath").val(data);
        },  
        error: function(data){  
        }  
    });  
}
    //firstimg 上传
    $(function () {$("#firstimgbtn").click(function () {
    	$(document)
		.ajaxStart(function(){
			$("#loadingimg").show();
		})
		.ajaxComplete(function(){
			$("#loadingimg").hide();
		});
            $.ajaxFileUpload({
                    url: 'productImgUpload.do', //用于文件上传的服务器端请求地址
                    secureuri: false, //是否需要安全协议，一般设置为false
                    fileElementId: ['firstimgi'], //文件上传域的ID
                    fileElementName: "file",  //这里不在是以前的id了，要写成数组的形式哦！ 
                    dataType: 'text', //返回值类型 一般设置为json
                    success: function (data, status)  //服务器成功响应处理函数
                    {
                        /* $("#img1").attr("src", data.imgurl);
                        if (typeof (data.error) != 'undefined') {
                            if (data.error != '') {
                                alert(data.error);
                            } else {
                                alert(data.msg);
                            }
                        } */
                        $("#firstimg").val(data);
                        console.log('update success!');
                    },
                    error: function (data, status, e)//服务器响应失败处理函数
                    {
                        alert(e);
                    }
                });
        });
    });
	</script>	
<style type="text/css">
/*==========以下部分是Validform必须的===========*/
.Validform_checktip{
	margin-left:8px;
	line-height:20px;
	height:20px;
	overflow:hidden;
	color:#999;
	font-size:12px;
}
.Validform_right{
	color:#71b83d;
	padding-left:20px;
	background:url(js/Validform_v5.3.2/Validform_v5.3.2/demo/images/right.png) no-repeat left center;
}
.Validform_wrong{
	color:red;
	padding-left:20px;
	white-space:nowrap;
	background:url(js/Validform_v5.3.2/Validform_v5.3.2/demo/images/error.png) no-repeat left center;
}
.Validform_loading{
	padding-left:20px;
	background:url(js/Validform_v5.3.2/Validform_v5.3.2/demo/images/onLoad.gif) no-repeat left center;
}
.Validform_error{
	background-color:#ffe7e7;
}
#Validform_msg{color:#7d8289; font: 12px/1.5 tahoma, arial, \5b8b\4f53, sans-serif; width:280px; -webkit-box-shadow:2px 2px 3px #aaa; -moz-box-shadow:2px 2px 3px #aaa; background:#fff; position:absolute; top:0px; right:50px; z-index:99999; display:none;filter: progid:DXImageTransform.Microsoft.Shadow(Strength=3, Direction=135, Color='#999999');}
#Validform_msg .iframe{position:absolute; left:0px; top:-1px; z-index:-1;}
#Validform_msg .Validform_title{line-height:25px; height:25px; text-align:left; font-weight:bold; padding:0 8px; color:#fff; position:relative; background-color:#000;}
#Validform_msg a.Validform_close:link,#Validform_msg a.Validform_close:visited{line-height:22px; position:absolute; right:8px; top:0px; color:#fff; text-decoration:none;}
#Validform_msg a.Validform_close:hover{color:#cc0;}
#Validform_msg .Validform_info{padding:8px;border:1px solid #000; border-top:none; text-align:left;}

#atop{
display: block;
}
#atop div:hover{
background-image: url('images/background_xuan_0000s_0000s_0001_filter-active-bg.png')
}
#atop div {
  display: inline-block;
  height: 20px;
  text-align: center;
  width: 72px;
  cursor: pointer;
}
</style>
<style type="text/css">
#atop {
  background-color: #eef1f7;
  display: block;
  height: 70px;
}
#atop div:hover{
background-image: url('images/background_xuan_0000s_0000s_0001_filter-active-bg.png');
background-position:center;
	background-size:100% 100%;
background-repeat: no-repeat;
}
#atop div {
  display: inline-block;
  height: 20px;
  text-align: center;
  width: 120px;
  cursor: pointer;
  position: relative;
  top:24px;
}
body div button{
width: 200px;
height: 50px;
}
#shuoming {
  display: block;
  float: right;
  height: 100%;
  width: 500px;
}
</style>
<style type="text/css">
.ui-jqgrid tr.jqgrow td {
    text-overflow: ellipsis;-o-text-overflow: ellipsis;
}
.ui-jqgrid tr.jqgrow.ui-state-highlight td {
    word-wrap: break-word; /* IE 5.5+ and CSS3 */
    white-space: pre-wrap; /* CSS3 */
    white-space: -moz-pre-wrap; /* Mozilla, since 1999 */
    white-space: -pre-wrap; /* Opera 4-6 */
    white-space: -o-pre-wrap; /* Opera 7 */
    overflow: hidden;
    height: auto;
    vertical-align: middle;
    padding-top: 2px;
    padding-bottom: 2px
}
.djck {
  height: 100%;
  width: 100%;
}
</style>
<title>产品管理</title>
</head>
<body>
<div id="atop">
<div class="atopd" id="atopd0"><a href="productManage.jsp?type=1">香氛系列第一橱窗</a></div>
<div class="atopd" id="atopd1"><a href="productManage.jsp?type=2">香氛系列第二橱窗</a></div>
<div class="atopd" id="atopd2"><a href="productManage.jsp?type=3">香氛系列第三橱窗</a></div>
<div class="atopd" id="atopd3"><a href="productManage.jsp?type=4">草棉籽油系列</a></div> 
<div class="atopd" id="atopd3"><a href="productManage.jsp?type=5">草棉籽油橱窗</a></div> 
<span class="shuoming" id="shuoming"></span>
</div>
	<table id="list1"></table>
	<div id="pager1"></div>
	<div>
		<button onclick="openDialog4Adding()">添加产品</button>
		<button onclick="openDialog4Updating()">修改产品</button>
		<button onclick="openDialog4Deleting()">删除产品</button>
	</div>

	<div id="consoleDlg" >
	
		<div id="formContainer">
			<form id="consoleForm" class="consoleForm">
				<input type="hidden" id="selectId" />
				<table class="formTable">
					<tr>
						<!-- 	colNames:['ID','产品名称','英文名称',
				
				'广告语1','广告语2','产品类型','图片链接',
				'发布时间','产品内容','产品规格','主要展示图'],
        -->
						<th>产品名称：</th>
						<td><input type="text" class="textField" id="name"
							name="name" datatype="*" /></td>
						<td><div class="Validform_checktip"></div></td>
					</tr>
						<tr>
				
						<th>英文名称：</th>
						<td><input type="text" class="textField" id="ename"
							name="ename" datatype="*" ignore="ignore"/></td>
						<td><div class="Validform_checktip"></div></td>
					</tr>
	<tr>
						<!-- 	colNames:['ID','产品名称','英文名称',
				
				'广告语1','广告语2','产品类型','图片链接',
				'发布时间','产品内容','产品规格','主要展示图'],
        -->
						<th>产品规格：</th>
						<td><input type="text" class="textField" id="capacity"
							name="capacity" datatype="*" ignore="ignore"/></td>
						<td><div class="Validform_checktip"></div></td>
					</tr>

					<tr>
						<th>产品类型：</th>
						<td><select id="type" name="type" disabled="disabled" ignore="ignore">
								
								<option value="1">香氛系列1</option>
								<option value="2">香氛系列2</option>
								<option value="3">香氛系列3</option>
								<option value="4">草棉籽油系列</option>
								<option value="5">草棉籽油展示橱窗</option>
								<option value="6">礼品装系列</option>
								<option value="7">专卖店专有系列</option>
								<option value="8">其他系列</option>
								<option value="9">服务性产品</option>
								<option value="10">最新产品</option>
								<!-- 	return "香氛系列1";
	}else if(e==2){
		return "香氛系列2";
	}else if(e==3){
		return "香氛系列3";
	}else if(e==4){
		return "草棉籽油系列";
	}else if(e==5){
		return "草棉籽油展示橱窗"; -->
						</select></td>
					</tr>
					<tr>
						<!-- 	colNames:['ID','产品名称','英文名称',
				
				'广告语1','广告语2','产品类型','图片链接',
				'发布时间','产品内容','产品规格','主要展示图'],
        -->
						<th>广告语1：</th>
						<td><input type="text" class="textField" id="ad1"
							name="ad1" style="display: none" />
							 <textarea id="tinyTad1"
								name="tinyT" datatype="*" ignore="ignore">&lt;p&gt;输入内容&lt;/p&gt;</textarea></td>
						<td><div class="Validform_checktip"></div></td>
					</tr>
						<tr>
						<!-- 	colNames:['ID','产品名称','英文名称',
				
				'广告语1','广告语2','产品类型','图片链接',
				'发布时间','产品内容','产品规格','主要展示图'],
        -->
						<th>广告语2：</th>
						<td><input type="text" class="textField" id="ad2"
							name="ad2" style="display: none" /> <textarea id="tinyTad2"
								name="tinyT" datatype="*" ignore="ignore">&lt;p&gt;输入内容&lt;/p&gt;</textarea></td>
						<td><div class="Validform_checktip"></div></td>
					</tr>
						<tr>
						<!-- 	colNames:['ID','产品名称','英文名称',
				
				'广告语1','广告语2','产品类型','图片链接',
				'发布时间','产品内容','产品规格','主要展示图'],
        -->
						<th>产品内容：</th>
						<td><input type="text" class="textField" id="content"
							name="content" style="display: none" /> <textarea id="tinyT"
								name="tinyT" datatype="*" ignore="ignore">&lt;p&gt;输入内容&lt;/p&gt;</textarea></td>
						<td><div class="Validform_checktip"></div></td>
					</tr>
					<tr>
						<th>详细内容图片：</th>
						<td><input type="text" class="textField" id="imgpath"
							name="imgpath" readonly="readonly" datatype="*" ignore="ignore" />
									 <input type="file"
										contenteditable="false" style="width: 220px" value=""
										name="file2" id="file2">
							<!-- <button class="button" id="" onclick="createInput('more'); return false;">添加图片</button> -->
							<button class="button" id="buttonUpload" onclick="ajaxFileUploadImg(); return false;">上传</button>
							 <img id="loading" class="loading" src="js/AjaxFileUploader/loading.gif" style="display:none;">  
							</td>
						<td><div class="Validform_checktip"></div></td>
					</tr>
					<tr>
						<th>封面展示图：</th>
						
						<td>
						<input type="text" class="textField" id="firstimg"
							name="firstimg" readonly="readonly" datatype="*" ignore="ignore"/>
						<input type="file" class="textField" id="firstimgi"
							name="firstimgi" />
    						<button type="button" value="上传" id="firstimgbtn" onclick="javascript:return false();">上传</button>
   						 <p><img id="loadingimg" class="loading" src="js/AjaxFileUploader/loading.gif" style="display:none;">  </p> </td>
						<td><div class="Validform_checktip"></div></td>
					</tr>
					<tr>
					<th>说明：</th>
						<td><span>封面展示图图片比例为1.25:1；详细内容图片长宽比为1.5:1。<br>标题不应超过10汉字。英文标题和规格参数不应超过20字母。广告语1和广告语二不应超过50汉字，产品内容不应超过100汉字。</span></td>
					</tr>
				</table>
			</form>
					
		</div>
	</div>
	<script type="text/javascript">
	</script>
	<div id="showtime"></div>
</body>
	

</html>