<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix='c' uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<html>
<head>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>後台</title>
<style type="text/css">
th {
	background: #ff2f24;
}

table {
	background: #ffffff;
}

.button {
	background-color: #4CAF50;
	color: white;
	padding: 15px 10px;
	margin: 8px 0;
	border: none;
	cursor: pointer;
	width: 90%;
	border-radius: 10px;
}

input[type=text] {
	outline: none;
	border-radius: 10px;
	margin-top: 10px;
}

.search {
	background-color: #4CAF50;
	/* border-radius: 10px 10px 10px 10px; */
	margin-left: -20px;
	font-size: 13px;
	padding: 3px
}
</style>
</head>
<body style="background: #e1e1e8">
	<div class="col-md-3 "
		style="width: 15%; background-color: #363636; height: 750px; position: fixed;">
		<ul class="nav nav-pills nav-stacked">
			<li class="active"><a href="backIndex"
				style="text-align: center;">商城管理系統</a></li>
			<li><a href="addCarousel" style="color: #5d76cf">輪播牆管理</a></li>
			<li><a href="test" style="color: #5d76cf">會員管理</a></li>
			<li><a href="Brand" style="color: #5d76cf">品牌管理</a></li>
			<li><a href="Product" style="color: #5d76cf">商品管理</a></li>
			<li><a href="OOrders" style="color: #5d76cf">訂單管理</a></li>
			<li><a href="webwebBack" style="color: #5d76cf">客服</a></li>
			<li><a href="statistic" style="color: #5d76cf">統計</a></li>
			<div>
				<a href="<c:url value='/' />"
					style="color: #5d76cf; box-sizing: border-box; position: absolute; bottom: 0; margin-bottom: 50px; padding-left: 50px; padding-bottom: 30px">回購物首頁</a>
			</div>
		</ul>
	</div>
	<div align='center'
		style="position: absolute; left: 300px; right: 50px">
		<h3>商品資料</h3>
		<a href='addProduct'>新增產品資料</a> &nbsp;&nbsp;&nbsp; <a
			href="<c:url value='/'/> ">回商品首頁</a>
		<hr>
		<div>
			<form:form method="get" modelAttribute="ProductBean">
				<form:select path="brandBean.BrandID" id="queryp">
					<form:option value="-1" label="請挑選品牌" />
					<form:option value="*" label="顯示全部" />
					<form:options items="${BrandMap}" />
				</form:select>
			</form:form>
		</div>
		<table border='2' cellpadding="3" cellspacing="1">
			<thead>
				<tr>
					<th>產品編號</th>
					<th>產品名稱</th>
					<th>產品類型</th>
					<th>產品品牌</th>
					<th>產品資訊</th>
					<th>產品照片</th>
					<th>產品價錢</th>
					<th>上架時間</th>
					<th>產品庫存</th>
					<th>選項</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var='product' items='${Products}'>
					<tr>
						<td style="text-align: center">${product.productID}</td>
						<td>${product.productName}</td>
						<td style="text-align: center">${product.typeBean.typeName}</td>
						<td style="text-align: center">${product.brandBean.brandName}</td>
						<td>${product.productIntro}</td>
						<td height='300'><img style="display: block" width='100'
							height='100'
							src="<c:url value='/getproductimg/${product.productID}'/>" /> <img
							style="display: block" width='100' height='100'
							src="<c:url value='/getproductimg2/${product.productID}'/>" /> <img
							style="display: block" width='100' height='100'
							src="<c:url value='/getproductimg3/${product.productID}'/>" /></td>
						<td>${product.unitPrice}元</td>
						<td>${product.releasedDate}</td>
						<td>${product.stockQuantity}</td>
						<td><a
							href="<c:url value='/upproduct/${product.productID}'/>"><button
									type="button" class="button">編輯</button></a> <a
							href="<c:url value='/peb/${product.productID}'/>"><button
									type="button" class="button" onclick="return delForm()">刪除</button></a>
							<a href="<c:url value='/upSpec/${product.productID}'/>"><button
									type="button" class="button">編輯規格</button></a></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		<hr>
	</div>
	<script>
		function delForm() {
			if (confirm("確定刪除嗎?")) {
				return true;
			}
			return false;
		}
		function delForm() {
			if (confirm("確定刪除嗎?")) {
				return true;
			}
			return false;
		}
		$("#queryp")
				.click(
						function() {
							var options = $("#queryp option:selected");
							console.log(options.val())
							$
									.ajax({
										url : "<c:url value='/find'/>", //後端的URL
										type : "GET", //用POST的方式
										data : {
											brandID : this.value
										}, //response的資料格式
										cache : false, //是否暫存
										success : function(options) {
											console
													.log('Submission was successful.');
											console.log(options); //成功後回傳的資料
											for (var i = 0; i < options.length; i++) {
												"<tbody>"
														+ "<tr>"
														+ "<td style='text-align: center'>"
														+ options[i].productID
														+ "</td>"
														+ "<td>ZS600KL</td>"
														+ "<td style='text-align: center'>"
														+ options[i].productID
														+ "</td>"
														+ "<td style='text-align: center'>"
														+ options[i].productID
														+ "</td>"
														+ "<td>"
														+ options[i].productID
														+ "</td>"
														+ "<td height='300'>"
														+ "<img style='display: block' width='100' height='100' src='/CrazyPhone222/getproductimg/'"+options[i].productID+" />"
														+ "<img style='display: block' width='100' height='100' src='/CrazyPhone222/getproductimg2/'"+options[i].productID+" />"
														+ "<img style='display: block' width='100' height='100' src='/CrazyPhone222/getproductimg3/'"+options[i].productID+" />"
														+ "</td>"
														+ "<td>"
														+ options[i].productID
														+ "</td>"
														+ "<td>"
														+ options[i].productID
														+ "</td>"
														+ "<td>"
														+ options[i].productID
														+ "</td>"
														+ "<td>"
														+ "<a href='/CrazyPhone222/upproduct/"+options[i].productID+"'>"
														+ "<button type='button' class='button'>編輯</button>"
														+ "</a>"
														+ "<a href='/CrazyPhone222/peb/"+options[i].productID+"'>"
														+ "<button type='button' class='button' onclick='return delForm()'>刪除</button></a>"
														+ "<a href=''/CrazyPhone222/upSpec/"+options[i].productID+"'><button type='button' class='button'>編輯規格</button></a></td>"
														+ "</tr>" + "</tbody>"
											}
										}
									})
						});
	</script>
</body>
</html>