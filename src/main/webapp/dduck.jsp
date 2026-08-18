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
		flex-direction: row;
	}

	/* 메뉴 이미지 */
	.menu-img1 {
		width: 15em;
		margin-left: 20px;
	}

	.menu-img2 {
		width: 15em;
		margin-left: 20px;
	}

	.menu-img3 {
		width: 15em;
		margin-left: 20px;
	}

	.menu-img4 {
		width: 15em;
		margin-left: 20px;
	}

	/* 메뉴 이름 + 옵션 영역 */
	.menu-info {
		margin-left: 50px;
		margin-top: 70px;
	}

	/* 맵기 */
	.spicy {
		display: flex;
		gap: 10px;
	}

	/* 추가 옵션 */
	.option {
		margin-top: 15px;

		/* 2개씩 배치 */
		display: grid;
		grid-template-columns: 180px 180px;

		/* 위아래 간격 */
		row-gap: 5px;
	}

	/* 담기 버튼 */
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

			<img src="${pageContext.request.contextPath}/img/basic.png"
			     class="menu-img1">

			<div class="menu-info">

				<h2>엽기 떡볶이</h2>

				<!-- 맵기 선택 -->
				<div class="spicy">

					맵기 :

					<input type="checkbox" id="spicy1">
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

				<!-- 추가 옵션 -->
				<div class="option">

					<div>
						<input type="checkbox" id="fishcake1">
						<label for="fishcake1">오뎅 추가 +2500원</label>
					</div>

					<div>
						<input type="checkbox" id="ricecake1">
						<label for="ricecake1">떡 추가 +3000원</label>
					</div>

					<div>
						<input type="checkbox" id="noodle1">
						<label for="noodle1">당면 추가 +2000원</label>
					</div>

					<div>
						<input type="checkbox" id="cheese1">
						<label for="cheese1">치즈 추가 +2000원</label>
					</div>

				</div>

			</div>

			<button class="cart-btn btn btn-secondary">담기</button>

		</div>


		<!-- 카드 2 -->
		<div class="card menu-card">

			<img src="${pageContext.request.contextPath}/img/rose.jpg"
			     class="menu-img1">

			<div class="menu-info">

				<h2>로제 떡볶이</h2>

				<!-- 맵기 선택 -->
				<div class="spicy">

					맵기 :

					<input type="checkbox" id="spicy6">
					<label for="spicy6">1단계</label>

					<input type="checkbox" id="spicy7">
					<label for="spicy7">2단계</label>

					<input type="checkbox" id="spicy8">
					<label for="spicy8">3단계</label>

					<input type="checkbox" id="spicy9">
					<label for="spicy9">4단계</label>

					<input type="checkbox" id="spicy10">
					<label for="spicy10">5단계</label>

				</div>

				<!-- 추가 옵션 -->
				<div class="option">

					<div>
						<input type="checkbox" id="fishcake2">
						<label for="fishcake2">오뎅 추가 +2500원</label>
					</div>

					<div>
						<input type="checkbox" id="ricecake2">
						<label for="ricecake2">떡 추가 +3000원</label>
					</div>

					<div>
						<input type="checkbox" id="noodle2">
						<label for="noodle2">당면 추가 +2000원</label>
					</div>

					<div>
						<input type="checkbox" id="cheese2">
						<label for="cheese2">치즈 추가 +2000원</label>
					</div>

				</div>

			</div>

			<button class="cart-btn btn btn-secondary">담기</button>

		</div>


		<!-- 카드 3 -->
		<div class="card menu-card">

			<img src="${pageContext.request.contextPath}/img/mara.jpg"
			     class="menu-img1">

			<div class="menu-info">

				<h2>마라 떡볶이</h2>

				<!-- 맵기 선택 -->
				<div class="spicy">

					맵기 :

					<input type="checkbox" id="spicy11">
					<label for="spicy11">1단계</label>

					<input type="checkbox" id="spicy12">
					<label for="spicy12">2단계</label>

					<input type="checkbox" id="spicy13">
					<label for="spicy13">3단계</label>

					<input type="checkbox" id="spicy14">
					<label for="spicy14">4단계</label>

					<input type="checkbox" id="spicy15">
					<label for="spicy15">5단계</label>

				</div>

				<!-- 추가 옵션 -->
				<div class="option">

					<div>
						<input type="checkbox" id="fishcake3">
						<label for="fishcake3">오뎅 추가 +2500원</label>
					</div>

					<div>
						<input type="checkbox" id="ricecake3">
						<label for="ricecake3">떡 추가 +3000원</label>
					</div>

					<div>
						<input type="checkbox" id="noodle3">
						<label for="noodle3">당면 추가 +2000원</label>
					</div>

					<div>
						<input type="checkbox" id="cheese3">
						<label for="cheese3">치즈 추가 +2000원</label>
					</div>

				</div>

			</div>

			<button class="cart-btn btn btn-secondary">담기</button>

		</div>


		<!-- 카드 4 -->
		<div class="card menu-card">

			<img src="${pageContext.request.contextPath}/img/mararose.png"
			     class="menu-img1">

			<div class="menu-info">

				<h2>마라로제 떡볶이</h2>

				<!-- 맵기 선택 -->
				<div class="spicy">

					맵기 :

					<input type="checkbox" id="spicy16">
					<label for="spicy16">1단계</label>

					<input type="checkbox" id="spicy17">
					<label for="spicy17">2단계</label>

					<input type="checkbox" id="spicy18">
					<label for="spicy18">3단계</label>

					<input type="checkbox" id="spicy19">
					<label for="spicy19">4단계</label>

					<input type="checkbox" id="spicy20">
					<label for="spicy20">5단계</label>

				</div>

				<!-- 추가 옵션 -->
				<div class="option">

					<div>
						<input type="checkbox" id="fishcake4">
						<label for="fishcake4">오뎅 추가 +2500원</label>
					</div>

					<div>
						<input type="checkbox" id="ricecake4">
						<label for="ricecake4">떡 추가 +3000원</label>
					</div>

					<div>
						<input type="checkbox" id="noodle4">
						<label for="noodle4">당면 추가 +2000원</label>
					</div>

					<div>
						<input type="checkbox" id="cheese4">
						<label for="cheese4">치즈 추가 +2000원</label>
					</div>

				</div>

			</div>

			<button class="cart-btn btn btn-secondary">담기</button>

		</div>

	</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>