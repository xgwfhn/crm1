
<!-- 
	datatables插件显示
	https://www.datatables.net/blog/2012-02-01(不错) 
	https://datatables.net/(官网)    http://datatables.club/ (对应中文网)
	选项配置说明   http://blog.csdn.net/zhu_xiao_yuan/article/details/51252300
	bootstrap  响应式布局   随着浏览器的大小  自动跳转布局格式
	bootstrap 可以兼容pc ipad  移动端
	一般图标 可以用 <i 标签或<span  标签  来显示
	提供分页功能
	ajax删除   修改     停留在当前页  (始终保持每页显示的记录数，方案是 把当前页码传递到后台)
	ajax新增 /修改 局部刷新表格数据
	支持每页显示多少条的切换
	支持当前显示 当前页  为xx条记录到xx条记录  格式显示
	支持点击表头字段 可排序
	支持可某个字段内容过滤记录  显示
	
	css设置
	设置 表格行间隔之间  斑马条纹样式 table-striped
	设置表格边框 table-bordered
	每一行对鼠标悬停状态作出响应  table-hover
	紧缩表格  table-condensed
	将表格设置为响应式
	<div class="table-responsive">
  		<table class="table">
    		...
  		</table>
	</div>
		
	
	
 -->
 <!-- 国际化
 	var table = $('#example').DataTable({
	    "language": {
	        "processing": "处理中...",
	        "lengthMenu": "显示 _MENU_ 项结果",
	        "zeroRecords": "没有匹配结果",
	        "info": "显示第 _START_ 至 _END_ 项结果，共 _TOTAL_ 项",
	        "infoEmpty": "显示第 0 至 0 项结果，共 0 项",
	        "infoFiltered": "(由 _MAX_ 项结果过滤)",
	        "infoPostFix": "",
	        "search": "搜索:",
	        "searchPlaceholder": "搜索...",
	        "url": "",
	        "emptyTable": "表中数据为空",
	        "loadingRecords": "载入中...",
	        "infoThousands": ",",
	        "paginate": {
	            "first": "首页",
	            "previous": "上页",
	            "next": "下页",
	            "last": "末页"
	        },
	        "aria": {
	            paginate: {
	                first: '首页',
	                previous: '上页',
	                next: '下页',
	                last: '末页'
	            },
	            "sortAscending": ": 以升序排列此列",
	            "sortDescending": ": 以降序排列此列"
	        },
	        "decimal": "-",
	        "thousands": "."
	    }
	});
  -->
  <!-- 
     	加载时异常报错  dataTables warning: table id={example} - Requested unknown parameter '0' for row {0}, column{0}`
     	解决:http://stackoverflow.com/questions/21552041/datatables-warning-table-id-example-requested-unknown-parameter-0-from
   -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false" %>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>   
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
    <title>datatables插件分页</title>
	
    <!--font-awesome.css 下载地址 http://www.bootcdn.cn/font-awesome/ 然后需要下载其图标  放到font目录中   再重新编译   注意该图标在font目录下   上传组件的图标在fonts下-->
    <link href="http://127.0.0.1:8080/crm-project-controller/style/bootstrap/font-awesome.css" rel="stylesheet" type="text/css" />
    <link href="http://127.0.0.1:8080/crm-project-controller/style/bootstrap/bootstrap.css" rel="stylesheet">
    <!-- 首先要下载  bootstrap源码 版     dashboard.css 在bootstrap-3.3.5\docs\examples\dashboard    -->
    <link href="http://127.0.0.1:8080/crm-project-controller/style/bootstrap/dashboard.css" rel="stylesheet">
     
    <!-- dataTables 所需   begin -->
    <link href="http://127.0.0.1:8080/crm-project-controller/style/bootstrap/jquery.dataTables.css" rel="stylesheet">
    <script src="http://127.0.0.1:8080/crm-project-controller/script/bootstrap/jquery.js"></script>
    <script src="http://127.0.0.1:8080/crm-project-controller/script/bootstrap/jquery.dataTables.js"></script>
    <!-- dataTables 所需   end -->
    <script src="http://127.0.0.1:8080/crm-project-controller/script/bootstrap/bootstrap.js"></script>
  
    <script type="text/javascript">
    	$(function(){
    		 	  $('#example').DataTable( {
    			 	"pagingType": "full_numbers",//显示首页 及尾页
    			 	//"bProcessing": true,
    			 	"sAjaxSource": "getCurrentPageData3.do",
    			 	"aoColumns": [
		    			 	         { "mData": 'first_name' },
		    			 	         { "mData": 'last_name' },
		    			 	         { "mData": 'position' },
		    			 	         { "mData": 'office' },
		    			 	         { "mData": 'start_date' },
		    			 	         { "mData": 'salary' }
    			 	     		 ],
	 	     		"language": {
	 	   	        "processing": "处理中...",
	 	   	        "lengthMenu": "显示 _MENU_ 项结果",
	 	   	        "zeroRecords": "没有匹配结果",
	 	   	        "info": "显示第 _START_ 至 _END_ 项结果，共 _TOTAL_ 项",
	 	   	        "infoEmpty": "显示第 0 至 0 项结果，共 0 项",
	 	   	        "infoFiltered": "(由 _MAX_ 项结果过滤)",
	 	   	        "infoPostFix": "",
	 	   	        "search": "搜索:",
	 	   	        "searchPlaceholder": "搜索...",
	 	   	        "url": "",
	 	   	        "emptyTable": "表中数据为空",
	 	   	        "loadingRecords": "载入中...",
	 	   	        "infoThousands": ",",
	 	   	        "paginate": {
	 	   	            "first": "首页",
	 	   	            "previous": "上页",
	 	   	            "next": "下页",
	 	   	            "last": "末页"
	 	   	        },	 	   	       
	 	   	        "decimal": "-",
	 	   	        "thousands": "."
	 	   	    },
	 	   		
    		   });   		 
    		   		
    	})
    	
    	
    </script>
  </head>
  <body>        
		<nav class="navbar navbar-inverse navbar-fixed-top">
			<div class="container-fluid">
				<div class="navbar-header">
					<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
						<span class="sr-only">Toggle navigation</span>
						<span class="icon-bar"></span>
						<span class="icon-bar"></span>
						<span class="icon-bar"></span>
					</button>
					<a class="navbar-brand" href="#">Project name</a>
				</div>
				<div id="navbar" class="navbar-collapse collapse">
					<ul class="nav navbar-nav navbar-right">
						<li><a href="#">Dashboard</a></li>
						<li><a href="#">Settings</a></li>
						<li><a href="#">Profile</a></li>
						<li><a href="#">Help</a></li>
					</ul>
					<form class="navbar-form navbar-right">
						<input type="text" class="form-control" placeholder="Search...">
					</form>
				</div>
		  </div>
		</nav>

		<div class="container-fluid">
		    <div class="row">
				<div class="col-sm-3 col-md-2 sidebar">
				  <ul class="nav nav-sidebar">
					<li class="active"><a href="#">Overview <span class="sr-only">(current)</span></a></li>
					<li><a href="#">Reports</a></li>
					<li><a href="#">Analytics</a></li>
					<li><a href="#">Export</a></li>
				  </ul>
				  <ul class="nav nav-sidebar">
					<li><a href="">Nav item</a></li>
					<li><a href="">Nav item again</a></li>
					<li><a href="">One more nav</a></li>
					<li><a href="">Another nav item</a></li>
					<li><a href="">More navigation</a></li>
				  </ul>
				  <ul class="nav nav-sidebar">
					<li><a href="">Nav item again</a></li>
					<li><a href="">One more nav</a></li>
					<li><a href="">Another nav item</a></li>
				  </ul>
				</div>
			<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
				<input type="button" value="aaa" onclick="tt()"/>
				<h2 class="sub-header">Section title</h2>
				<table id="example" class="display" cellspacing="0" width="100%">   
					 <thead>
			            <tr>
			                <th>First name</th>
			                <th>Last name</th>
			                <th>Position</th>
			                <th>Office</th>
			                <th>Start date</th>
			                <th>Salary</th>
			            </tr>
	       			 </thead>    
   			 </table>
			</div>
		  </div>
		</div>
  </body>
</html>