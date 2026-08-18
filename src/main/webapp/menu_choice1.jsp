<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메뉴 선택</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">

<style>
	/* 원래 배경색 적용 */
	body {
		background-color: #00FFD0;
		font-family: 'Pretendard', '맑은 고딕', sans-serif;
		padding-bottom: 60px;
	}

	/* 메인 타이틀 바 */
	.header-box {
		text-align: center;
		padding: 50px 20px 30px;
	}

	.page-title {
		font-size: 2.2rem;
		font-weight: 800;
		color: #ffffff;
		font-family: "궁서체";
		text-shadow: 1px 1px 3px rgba(0, 0, 0, 0.2);
		margin-bottom: 8px;
	}

	.page-sub {
		color: #333333;
		font-size: 1rem;
		font-weight: 600;
	}

	/* 카드들이 들어갈 컨테이너 */
	.menu-container {
		max-width: 900px;
		margin: 0 auto;
	}

	/* 메뉴 카드 (2x2 그리드 안의 카드) */
	.menu-card {
		display: flex;
		flex-direction: column;
		align-items: center;
		text-align: center;
		
		padding: 35px 20px;
		background: #ffffff;
		border: none;
		border-radius: 24px;
		text-decoration: none;
		
		/* 기본 그림자 */
		box-shadow: 0 10px 25px rgba(0, 0, 0, 0.08);
		transition: all 0.3s ease;
	}

	/* 마우스 호버 시 살짝 떠오르며 강조 */
	.menu-card:hover {
		transform: translateY(-8px);
		box-shadow: 0 15px 35px rgba(0, 0, 0, 0.15);
	}

	/* 원형 이미지 배경 상자 */
	.img-box {
		width: 130px;
		height: 130px;
		border-radius: 50%;
		background-color: #f0fdfa;
		
		display: flex;
		align-items: center;
		justify-content: center;
		margin-bottom: 20px;
		
		transition: transform 0.3s ease;
	}

	.menu-card:hover .img-box {
		transform: scale(1.08);
	}

	.menu-img {
		width: 90px;
		height: 90px;
		object-fit: contain;
	}

	/* 메뉴 이름 */
	.menu-title {
		font-size: 1.4rem;
		font-weight: 700;
		color: #222222;
		margin-bottom: 8px;
	}

	/* 이동 버튼 태그 */
	.menu-btn {
		display: inline-block;
		margin-top: 10px;
		padding: 8px 18px;
		background-color: #00ffd0;
		color: #111111;
		border-radius: 20px;
		font-size: 0.85rem;
		font-weight: 700;
		transition: background-color 0.3s, color 0.3s;
	}

	.menu-card:hover .menu-btn {
		background-color: #00cbb0;
		color: #ffffff;
	}
</style>
</head>

<body>

	<!-- 헤더 영역 -->
	<div class="header-box">
		<h1 class="page-title">기환식 오마카세</h1>
		<p class="page-sub">메뉴 선택</p>
	</div>

	<!-- 카드 목록 영역 (2열 배치) -->
	<div class="container menu-container">
		<div class="row g-4">

			<!-- 카드 1 : BHC 치킨 -->
			<div class="col-md-6">
				<a href="chicken.jsp" class="menu-card">
					<div class="img-box">
						<img src="${pageContext.request.contextPath}/img/bhc.png" class="menu-img" alt="BHC 치킨">
					</div>
					<div class="menu-title">BHC 치킨</div>
					<span class="menu-btn">메뉴 선택하기</span>
				</a>
			</div>

			<!-- 카드 2 : 노모어 피자 -->
			<div class="col-md-6">
				<a href="menuPizza.jsp" class="menu-card">
					<div class="img-box">
						<img src="${pageContext.request.contextPath}/img/pizza.jpg" class="menu-img" alt="노모어 피자">
					</div>
					<div class="menu-title">노모어 피자</div>
					<span class="menu-btn">메뉴 선택하기</span>
				</a>
			</div>

			<!-- 카드 3 : 엽기 떡볶이 -->
			<div class="col-md-6">
				<a href="menuDduck.jsp" class="menu-card">
					<div class="img-box">
						<img src="${pageContext.request.contextPath}/img/dduck.png" class="menu-img" alt="엽기 떡볶이">
					</div>
					<div class="menu-title">엽기 떡볶이</div>
					<span class="menu-btn">메뉴 선택하기</span>
				</a>
			</div>

			<!-- 카드 4 : 열정 국밥 -->
			<div class="col-md-6">
				<a href="gukbap.jsp" class="menu-card">
					<div class="img-box">
						<img src="${pageContext.request.contextPath}/img/guk.png" class="menu-img" alt="열정 국밥">
					</div>
					<div class="menu-title">열정 국밥</div>
					<span class="menu-btn">메뉴 선택하기</span>
				</a>
			</div>

		</div>
	</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>