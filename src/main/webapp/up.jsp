<%@page import="com.bw.bean.Goods"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="f" %>

<%
	String path = request.getContextPath();
	Goods g = (Goods)request.getAttribute("g");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>My Left and World</title>
<link rel="stylesheet" type="text/css" href="<%=path%>/css/index_work.css">
<script type="text/javascript" src="js/jquery-1.8.3.js"></script>
<script type="text/javascript" src="js/jquery.form.js"></script>
<style type="text/css">
	form{
		color:white;
	}
	input{
		color:black;
	}
</style>
<script type="text/javascript">
	$(function(){
		$.post("selTb",function(map){
			var brands = map.brands;
			var types = map.types;
			var str = "";
			var str1 = "";
			var bid=<%=g.getB_id()%>;
			var tid=<%=g.getT_id()%>;
			for(var i in brands){
				if(bid==brands[i].b_id){
					str += "<option selected value='"+brands[i].b_id+"'>"+brands[i].b_name+"</option>"					
				}else{
					str += "<option value='"+brands[i].b_id+"'>"+brands[i].b_name+"</option>"										
				}
			}
			$("select[name=b_id]").append(str);
			for(var i in types){
				if(tid==types[i].t_id){
					str1 += "<option selected value='"+types[i].t_id+"'>"+types[i].t_name+"</option>"
				}else{
					str1 += "<option value='"+types[i].t_id+"'>"+types[i].t_name+"</option>"					
				}
			}
			$("select[name=t_id]").append(str1);
		},"json")
	})
	function up(){
		$("form[name=upForm]").ajaxSubmit(function(data){
			if(data > 0){
				alert("修改成功");
				location="query";
			}else{
				alert("修改失败");
			}
		})
	}
</script>
</head>
<body>
	<form action="up" method="post" name="upForm">
		<select name="b_id">
			<option value="">选择品牌</option>
		</select>
		<select name="t_id">
			<option value="">选择类型</option>
		</select><br>
		商品名：<input type="text" name="g_name" value="${g.g_name }"><br>
		商品英文名：<input type="text" name="g_nick" value="${g.g_nick }"><br>
		商品尺寸：<input type="text" name="g_size" value="${g.g_size }"><br>
		商品单价：<input type="text" name="g_price" value="${g.g_price }"><br>
		商品数量：<input type="text" name="g_num" value="${g.g_num }"><br>
		商品标签：<input type="text" name="g_label" value="${g.g_label }"><br>
		商品图片：<img alt="无图片" src="lookImg?path=${g.g_imgurl}" width="100px" height="100px">
				换海报：<input type="file" name="imgfile"><br>
		<input type="button" value="修改" onclick="up()">
	</form>
</body>
</html>