
<!-- 
	使用bootstrap 内置table样式  显示
	bootstrap  响应式布局   随着浏览器的大小  自动跳转布局格式
	bootstrap 可以兼容pc ipad  移动端
	一般图标 可以用 <i 标签或<span  标签  来显示
	提供分页功能
	ajax删除   修改     停留在当前页  (始终保持每页显示的记录数，方案是 把当前页码传递到后台)
	ajax新增 /修改 局部刷新表格数据
	将分页组件居中
	*没完成 每页显示多少条的切换
	*没完成点击列名排序  参考  http://www.imooc.com/article/8917   官网:http://www.bootcdn.cn/bootstrap-table/
	
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
	可设置分页组件显示的规格大小及是否居中等(其中居中 的样式 会和bootstrap.css的冲突),解决  找到bootstrap-combined.min.css和bootstrap.css冲突的样式,在本地覆盖即可.  备注bootstrap.css中也有分页的样式
		
	分页插件 
	下载地址:https://github.com/lyonlai/bootstrap-paginator
	参考:http://blog.fens.me/nodejs-bootstrap-paginator/
		http://blog.csdn.net/zxw394/article/details/30067827
		
	bootstrap表格插件:
	可编辑表格插件:https://github.com/mindmup/editable-table(css和js都是远程连接的不可访问   需要下载到本地)
	https://www.datatables.net/blog/2012-02-01(不错)  http://datatables.club/ (对应中文网)
	datagrid:http://www.pontikis.net/labs/bs_grid/
	
	http://my.oschina.net/shunshun/blog/204587
	bootstrap 树插件
	https://github.com/zgs225/easy-tree   注意里面文件引入不对  需要修改
	treevew:https://github.com/jonmiles/bootstrap-treeview  (例子打开没有看到效果)
	
	验证插件:
	http://reactiveraven.github.io/jqBootstrapValidation/	
	
	bootstrap插件:
	http://www.missyuan.net/school/other_2014/other_16472.html
	http://www.oschina.net/news/56950/jquery-bootstrap-plugins-for-your-next-projects
	http://www.oschina.net/translate/20-best-jquery-bootstrap-plugins-for-developers
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
    <title>bootstrap-paginator分页</title>
	
    
    <!--font-awesome.css 下载地址 http://www.bootcdn.cn/font-awesome/ 然后需要下载其图标  放到font目录中   再重新编译   注意该图标在font目录下   上传组件的图标在fonts下-->
    <link href="http://127.0.0.1:8080/crm-project-controller/style/bootstrap/font-awesome.css" rel="stylesheet" type="text/css" />
    <link href="http://127.0.0.1:8080/crm-project-controller/style/bootstrap/bootstrap.css" rel="stylesheet">
    <!--分页插件 css 引入 -->
    <link href="http://127.0.0.1:8080/crm-project-controller/style/bootstrap/bootstrap-combined.min.css" rel="stylesheet" type="text/css" />
    <!-- 首先要下载  bootstrap源码 版     dashboard.css 在bootstrap-3.3.5\docs\examples\dashboard    -->
     <link href="http://127.0.0.1:8080/crm-project-controller/style/bootstrap/dashboard.css" rel="stylesheet">
    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]  小于ie9的支持配置>
      <script src="//cdn.bootcss.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="//cdn.bootcss.com/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
    <style type="text/css">
    	.table > tbody > tr > td{
    		 vertical-align:middle;   /* 设置表格数据垂直居中*/
    	}
    	
    	.table{
    		margin-bottom:-20px;  /* 设置表格底线和分页组件的边距*/
    	}
    	.pagination {
		    display:block; /* 因为分页插件对齐样式和bootstrap.css的冲突了(如设置居中不生效),此处需要覆盖.备注bootstrap.css中也有分页的样式*/
		}
    </style>
    
    <!-- js 放在这里  是因为如果放到前面  在引入时会比较慢,可以考虑放置到末尾 -->
    <!--2 jQuery js库必须在  bootstrap.js之前-->
    <script src="http://127.0.0.1:8080/crm-project-controller/script/easyui/jquery.min.js"></script>
    <!-- 3 Include all compiled plugins (below), or include individual files as needed -->
    <script src="http://127.0.0.1:8080/crm-project-controller/script/bootstrap/bootstrap.js"></script>
    <!--分页插件 js 引入 -->
    <script src="http://127.0.0.1:8080/crm-project-controller/script/bootstrap/bootstrap-paginator.js"></script>
    <script type='text/javascript'>
		$(function(){
			 var options = {
		                currentPage: 3,//当前页
		                totalPages: "${totalPages}",//总页数
		                size:'normal',//控件显示大小  large,normal, small, mini
		                alignment:'center',//控件对齐方式
		                numberOfPages:8,//设置控件显示的页码数,如1-8
		                itemTexts: function (type, page, current) {//设置页码的文本
		                    switch (type) {
			                    case "first":
									return "首页";
			                    case "prev":
									return "上一页";
			                    case "next":
									return "下一页";
			                    case "last":
									return "末页";
			                    case "page":
									return page;
		                    }
		                 },
		                onPageClicked: function(e,originalEvent,type,page){ //点击某个页数后调用 		                     
		                   //ajax获取当前页记录
		                	 $.ajax({
			                		type : 'POST',
			                		url : 'getCurrentPageData.do?page='+page,
			                		dataType : 'json',
			                		success : function (response, status, xhr) {//
			                		 	var list=response.list;
			                		    var str="";
			                		 	for(var i=0;i<list.length;i++){
			                		 		str+="<tr><td>${product.itemid}</td><td>"+list[i].itemid+"</td><td>"+list[i].status+"</td><td>"+list[i].unitcost+"</td><td>"+list[i].productname+"</td>";
			                				str+="<td class='action'>";
			                				str+="<a class='btn btn-success' data-toggle='tooltip' href='#' title='Zoom'><i class='icon-zoom-in'></i></a>";
			                				str+="<a class='btn btn-info' href='#'><i class='icon-edit'></i></a>";
			                				str+="<a class='btn btn-danger' href='#'><i class='icon-trash'></i></a>";
			                				str+="</td></tr>";
			                		 	}
			                		    $('#tcontent').html(str);
			                		},
			                		error : function (xhr, errorText, errorStatus) {//XMLHttpRequest 对象、错误信息、（可选）捕获的异常对象。
			                			 alert('请求失败');
			                		}
		                		});
		                   
		                },
		                /*  pageUrl: function(type, page, current){  
		                     alert(1)
		                }   */
		     };
			
        	$('#example').bootstrapPaginator(options);       	      	 
        	$('#show-page-select').change(function (){//切换到第几页
                    var page = $(this).val();
                    $('#example').bootstrapPaginator("show",page);//使控件显示当前 切换后的 页码
					//ajax获取当前页记录
					$.ajax({
                		type : 'POST',
                		url : 'getCurrentPageData.do?page='+page,
                		dataType : 'json',
                		success : function (response, status, xhr) {//
                		 	var list=response.list;
                		    var str="";
                		 	for(var i=0;i<list.length;i++){
                		 		str+="<tr><td>${product.itemid}</td><td>"+list[i].itemid+"</td><td>"+list[i].status+"</td><td>"+list[i].unitcost+"</td><td>"+list[i].productname+"</td>";
                				str+="<td class='action'>";
                				str+="<a class='btn btn-success' data-toggle='tooltip' href='#' title='Zoom'><i class='icon-zoom-in'></i></a>";
                				str+="<a class='btn btn-info' href='#'><i class='icon-edit'></i></a>";
                				str+="<a class='btn btn-danger' href='#'><i class='icon-trash'></i></a>";
                				str+="</td></tr>";
                		 	}
                		    $('#tcontent').html(str);
                		},
                		error : function (xhr, errorText, errorStatus) {//XMLHttpRequest 对象、错误信息、（可选）捕获的异常对象。
                			 alert('请求失败');
                		}
            		});
             })
		});
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
				<h2 class="sub-header">Section title</h2>
				<div class="table-responsive">
					<table class="table table-striped">
					    <thead>
							<tr>
							  <th>#</th>
							  <th>Header</th>
							  <th>Header</th>
							  <th>Header</th>
							  <th>Header</th>
							  <th class='actions'>Action</th>
							</tr>
					    </thead>
						<tbody id="tcontent">
							<c:forEach items="${list}" var="product">
								<tr>
								  <td>${product.itemid}</td>
								  <td>${product.listprice}</td>
								  <td>${product.productname}</td>
								  <td>${product.status}</td>
								  <td>${product.unitcost}</td>
								  <td class="action">
									<a class='btn btn-success' data-toggle='tooltip' href='#' title='Zoom'>
										<i class='icon-zoom-in'></i>
									</a>
									<a class='btn btn-info' href='#'>
										<i class='icon-edit'></i>
									 </a>
									<a class='btn btn-danger' href='#'>
										<i class='icon-trash'></i>
									</a>
								  </td>
								</tr>  
							</c:forEach>                                           
					    </tbody>
					</table>     
				<div id="example"></div><!-- 分页插件标识 -->
				<select id="show-page-select" style="width:50px;"><!-- 分页页码切换下拉菜单 -->
					<c:forEach items="${list}" varStatus="status">
						<option value="${status.index + 1}">${ status.index + 1}</option>
					</c:forEach>					
				</select>
			  </div>
			</div>
		  </div>
		</div>
  </body>
</html>