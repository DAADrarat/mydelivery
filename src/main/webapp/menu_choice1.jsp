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

	/* 전체 배경 */
	body {
		background-color: #00FFD0;
		margin: 0;
		padding: 0;
	}

	/* 제목 */
	.page-title {
		text-align: center;
		margin-top: 50px;
		margin-bottom: 45px;
		color: white;
		font-weight: bold;
		font-family: "궁서체";
		font-size: 45px;
	}

	/* 메뉴 카드들을 담는 영역 */
	.menu-list {
		width: 1000px;
		margin: 0 auto;

		display: grid;
		grid-template-columns: 1fr 1fr;
		gap: 30px;
	}

	/* 카드 */
	.menu-card {
		width: 100%;
		height: 280px;

		display: flex;
		flex-direction: column;
		align-items: center;
		justify-content: center;

		text-decoration: none;
		color: black;

		background-color: white;

		border: none;
		border-radius: 20px;

		box-shadow: 0 8px 20px rgba(0, 0, 0, 0.15);

		transition: 0.25s;
	}

	/* 마우스를 올렸을 때 */
	.menu-card:hover {
		transform: translateY(-8px) scale(1.02);

		box-shadow: 0 15px 30px rgba(0, 0, 0, 0.25);

		color: black;
	}

	/* 이미지 */
	.menu-img1 {
		width: 210px;
		height: 170px;
		object-fit: contain;
	}

	.menu-img2 {
		width: 210px;
		height: 170px;
		object-fit: contain;
	}

	.menu-img3 {
		width: 210px;
		height: 170px;
		object-fit: contain;
	}

	.menu-img4 {
		width: 210px;
		height: 170px;
		object-fit: contain;
	}

	/* 메뉴 이름 영역 */
	.menu-info {
		margin-top: 10px;
		text-align: center;
	}

	.menu-info h2 {
		font-size: 25px;
		font-weight: bold;
		margin: 0;
	}

</style>

</head>

<body>

	<h1 class="page-title">메뉴 선택</h1>

	<div class="menu-list">

		<!-- 카드 1 -->
		<a href="chicken.jsp" class="card menu-card">

			<img src="${pageContext.request.contextPath}/img/bhc.png"
			     class="menu-img1">

			<div class="menu-info">
				<h2>BHC 치킨</h2>
			</div>

		</a>


		<!-- 카드 2 -->
		<a href="menuPizza.jsp" class="card menu-card">

			<img src="${pageContext.request.contextPath}/img/pizza.jpg"
			     class="menu-img2">

			<div class="menu-info">
				<h2>노모어 피자</h2>
			</div>

		</a>


		<!-- 카드 3 -->
		<a href="dduck.jsp" class="card menu-card">

			<img src="${pageContext.request.contextPath}/img/dduck.png"
			     class="menu-img3">

			<div class="menu-info">
				<h2>엽기 떡볶이</h2>
			</div>

		</a>


		<!-- 카드 4 -->
		<a href="gukbap.jsp" class="card menu-card">

			<img src="${pageContext.request.contextPath}/img/guk.png"
			     class="menu-img4">

			<div class="menu-info">
				<h2>열정 국밥</h2>
			</div>

		</a>

	</div>


<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>