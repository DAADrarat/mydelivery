<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>엽기 떡볶이</title>

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
		flex-direction: row; /* 가로 방향으로 배치하겠다 */
	}
	
	.menu-img1 {
		width:15em;
		margin-left:20px;
	}
	
	.menu-img2 {
		width:15em;
		margin-left:20px;
	}
	
	.menu-img3 {
		width:15em;
		margin-left:20px;
	}
	
	.menu-img4 {
		width:15em;
		margin-left:20px;
	}
	
	.menu-info {
		margin-left:50px;
		margin-top:100px;
	}
	
	.spicy {
		display: flex;
		gap: 10px;
	}
	
	.cart-btn {
		margin-top: 70px;
		margin-left: 80px;
		height: 100px;
		width: 150px;
	}
	
	.cart-btn:hover {
    	transform: scale(1.03);
	}

</style>
</head>

<body>

	<h1 class="page-title">엽기 떡볶이</h1>

	<div class="menu-list">

		<!-- 카드 1 -->
		<div class="card menu-card">
			<img src="${pageContext.request.contextPath}/img/basic.png" class="menu-img1">
			<div class="menu-info">
				<h2>엽기 떡볶이</h2>
				
				<div class="spicy">
            		맵기 : <input type="checkbox" id="spicy1">
            		<label for="spicy1">1단계</label>

            		<input type="checkbox" id="spicy2">
            		<label for="spicy2">2단계</label>

            		<input type="checkbox" id="spicy3">
            		<label for="spicy3">3단계</label>

            		<input type="checkbox" id="spicy4">
            		<label for="spicy4">4단계</label>

            		<input type="checkbox" id="spicy5">
            		<label for="spicy5">5단계</label>
        		</div>
			</div>
			
			<button class="cart-btn btn btn-secondary">담기</button>
			
		</div>


		<!-- 카드 2 -->
		<div class="card menu-card">
			<img src="${pageContext.request.contextPath}/img/rose.jpg" class="menu-img1">
			<div class="menu-info">
				<h2>로제 떡볶이</h2>
				
				<div class="spicy">
            		맵기 : <input type="checkbox" id="spicy1">
            		<label for="spicy1">1단계</label>

            		<input type="checkbox" id="spicy2">
            		<label for="spicy2">2단계</label>

            		<input type="checkbox" id="spicy3">
            		<label for="spicy3">3단계</label>

            		<input type="checkbox" id="spicy4">
            		<label for="spicy4">4단계</label>

            		<input type="checkbox" id="spicy5">
            		<label for="spicy5">5단계</label>
        		</div>
			</div>
			
			<button class="cart-btn btn btn-secondary">담기</button>
			
		</div>


		<!-- 카드 3 -->
		<div class="card menu-card">
			<img src="${pageContext.request.contextPath}/img/mara.jpg" class="menu-img1">
			<div class="menu-info">
				<h2>마라 떡볶이</h2>
				
				<div class="spicy">
            		맵기 : <input type="checkbox" id="spicy1">
            		<label for="spicy1">1단계</label>

            		<input type="checkbox" id="spicy2">
            		<label for="spicy2">2단계</label>

            		<input type="checkbox" id="spicy3">
            		<label for="spicy3">3단계</label>

            		<input type="checkbox" id="spicy4">
            		<label for="spicy4">4단계</label>

            		<input type="checkbox" id="spicy5">
            		<label for="spicy5">5단계</label>
        		</div>
			</div>
			
			<button class="cart-btn btn btn-secondary">담기</button>
			
		</div>


		<!-- 카드 4 -->
		<div class="card menu-card">
			<img src="${pageContext.request.contextPath}/img/mararose.png" class="menu-img1">
			<div class="menu-info">
				<h2>마라로제 떡볶이</h2>
				
				<div class="spicy">
            		맵기 : <input type="checkbox" id="spicy1">
            		<label for="spicy1">1단계</label>

            		<input type="checkbox" id="spicy2">
            		<label for="spicy2">2단계</label>

            		<input type="checkbox" id="spicy3">
            		<label for="spicy3">3단계</label>

            		<input type="checkbox" id="spicy4">
            		<label for="spicy4">4단계</label>

            		<input type="checkbox" id="spicy5">
            		<label for="spicy5">5단계</label>
        		</div>
			</div>
			
			<button class="cart-btn btn btn-secondary">담기</button>
			
		</div>

	</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>