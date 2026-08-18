<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메뉴 선택</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
      rel="stylesheet">

<style>

	body {
		background-color: #00FFD0;
	}

	/* 메뉴 선택 제목 */
	.page-title {
		text-align: center;
		margin-top: 30px;
		margin-bottom: 50px;
		color: white;
		font-weight: bold;
		font-family: "궁서체";
	}

	/* 카드 4개를 담는 영역 */
	.menu-list {
		width: 1000px;
		margin: 0 auto;
	}

	/* 카드 */
	.menu-card {
		width: 100%;
		height: 250px;
		margin-bottom: 30px;
		
		display: flex;
		flex-direction: row;
		text-decoration: none;
	}
	
	/* 마우스 가져다 대면 확대 */
	.menu-card:hover {
    	transform: scale(1.03);
	}
	
	.menu-img1 {
		width:15em;
		margin-bottom:20px;
	}
	
	.menu-img2 {
		width:13em;
		margin-top:20px;
		margin-left:20px;
		margin-bottom:20px;
	}
	
	.menu-img3 {
		width:13em;
		margin-top:55px;
		margin-left:20px;
		margin-bottom:40px;
	}
	
	.menu-img4 {
		width:13em;
		margin-top:85px;
		margin-left:20px;
		margin-bottom:85px;
	}
	
	.menu-info {
		margin-left:50px;
		margin-top:100px;
	}

</style>
</head>

<body>

	<h1 class="page-title">메뉴 선택</h1>

	<div class="menu-list">

		<!-- 카드 1 -->
		<div class="card menu-card">
			<img src="${pageContext.request.contextPath}/img/bhc.png" class="menu-img1">
			<div class="menu-info">
				<h2>BHC 치킨</h2>
			</div>
		</div>


		<!-- 카드 2 -->
		<div class="card menu-card">
			<img src="${pageContext.request.contextPath}/img/pizza.jpg" class="menu-img2">
			<div class="menu-info">
				<h2>노모어 피자</h2>
			</div>
		</div>


		<!-- 카드 3 -->
		<a href="dduck.jsp" class="card menu-card">
			<img src="${pageContext.request.contextPath}/img/dduck.png" class="menu-img3">
			<div class="menu-info">
				<h2>엽기 떡볶이</h2>
			</div>
		</a>


		<!-- 카드 4 -->
		<div class="card menu-card">
			<img src="${pageContext.request.contextPath}/img/guk.png" class="menu-img4">
			<div class="menu-info">
				<h2>열정 국밥</h2>
			</div>
		</div>

	</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>