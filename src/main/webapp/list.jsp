<%@page import="com.bw.bean.Goods"%>
<%@page import="com.util.FileUtils"%>
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
	body{
		-webkit-touch-callout:none;
		-webkit-user-select:none;
		-khtml-user-select:none;
		-moz-user-select:none;
		-ms-user-select:none;
		user-select:none;
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
		$("#chs").toggle(function(){
			$(":checkbox").attr("checked",true);
		},function(){
			$(":checkbox").attr("checked",false);
		})
	})
	function fy(pageNum){
		$("input[name=pageNum]").val(pageNum);
		$("form[name=listForm]").submit();
	}
	function add(){
		location="add.jsp";
	}
	function del(id){
		if(confirm("确认删除吗？")){
			$.post("delOne",{id:id},function(data){
				if(data > 0){
					alert("删除成功");
					location="query";
				}else{
					alert("删除失败");
				}
			})
		}
	}
	function delAll(){
		if($(":checkbox:checked").length == 0){
			alert("未选中商品");
		}else{
			var m = $(":checkbox:checked").map(function(){
				return $(this).val();
			}).get().join(",");
			$.post("delAll",{id:m},function(data){
				if(data > 0){
					alert("删除成功");
					location="query";
				}else{
					alert("删除失败");
				}
			})
		}
		
	}
	function up(id){
		location="toup?id="+id;
	}
</script>
</head>
<body>
	<f:form action="query" method="post" modelAttribute="g" name="listForm">
		<input type="hidden" value="1" name="pageNum">
		<select name="b_id">
			<option value="0">查询品牌</option>
		</select>
		<select name="t_id">
			<option value="0">查询类型</option>
		</select>
		商品名:<f:input path="g_name" size="10px"/>
		英文名：<f:input path="g_nick" size="10px"/>
		标签：<f:input path="g_label" size="10px"/>
		价格：<f:input path="start" size="10px"/>~<f:input path="end" size="10px"/>
		<input type="submit" value="查询">
	</f:form>
	<table>
		<thead>
			<tr>
				<td colspan="12">商品表</td>
			</tr>
			<tr>
				<td id="chs">状态</td>
				<td>商品编号</td>
				<td>商品品牌</td>
				<td>商品种类</td>
				<td>商品名称</td>
				<td>商品英文名</td>
				<td>商品尺寸</td>
				<td>商品单价</td>
				<td>商品数量</td>
				<td>商品标签</td>
				<td>商品图片</td>
				<td>操作</td>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${page.list }" var="g">
				<tr ondblclick="up(${g.g_id})">
					<td><input type="checkbox" value="${g.g_id}"> </td>
					<td>${g.g_id }</td>
					<td>${g.b_name }</td>
					<td>${g.t_name }</td>
					<td>${g.g_name }</td>
					<td>${g.g_nick }</td>
					<td>${g.g_size }</td>
					<td>${g.g_price }</td>
					<td>${g.g_num }</td>
					<td>${g.g_label }</td>
					<td><img alt="无图片" src="lookImg?path=${g.g_imgurl}" width="100px" height="100px"></td>
					<td><input type="button" value="删除" onclick="del(${g.g_id})"> </td>
				</tr>
			</c:forEach>
		</tbody>
		<tfoot>
			<tr>
				<td colspan="12">
					共${page.total }条记录，
					<a onclick="fy(1)">首页</a>
					<a onclick="fy(${page.isFirstPage?1:page.prePage})">上一页</a>
					当前${page.pageNum}/${page.pages}页
					<a onclick="fy(${page.isLastPage?page.pages:page.nextPage})">下一页</a>
					<a onclick="fy(${page.pages})">尾页</a>
				</td>
			</tr>
		</tfoot>
	</table>
	<input type="button" value="添加" class="btn btn-blues" onclick="add()">
	<input type="button" value="批删" class="btn btn-red" onclick="delAll()">
</body>
</html>