

var rootPath='';
//$(function(){  
	var strFullPath=window.document.location.href;//请求路径 如  http://127.0.0.1:8080/product/fileUpload/fileUpload1.do
	var strPath=window.document.location.pathname; // 如 product/fileUpload/fileUpload1.do
	var pos=strFullPath.indexOf(strPath);
	var prePath=strFullPath.substring(0,pos);// 如 http://127.0.0.1:8080
	var postPath=strPath.substring(0,strPath.substr(1).indexOf('/')+1); //获取项目
	rootPath=prePath+postPath;//项目 请求根路径 如  http://127.0.0.1:8080/product
	
	/*console.log("strFullPath",strFullPath);
	console.log("strPath",strPath);
	console.log("pos",pos);
	console.log("prePath",prePath);
	console.log("strFullPath",strFullPath);
	console.log("postPath",postPath);
	console.log("rootPath",rootPath);*/
//});  