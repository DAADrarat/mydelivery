<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>엽기 떡볶이</title>

<!-- jQuery 추가 -->
<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>

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
		align-items: center;
	}

	/* 메뉴 이미지 */
	.menu-img1 {
		width: 15em;
		margin-left: 20px;
	}

	/* 메뉴 이름 + 옵션 영역 */
	.menu-info {
		margin-left: 50px;
		width: 480px;
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
		grid-template-columns: 200px 200px;

		/* 위아래 간격 */
		row-gap: 5px;
	}

	/* 가격 + 버튼 상자 */
	.btn-box {
		margin-left: 20px;
		text-align: center;
	}

	/* 실시간 최종 가격 */
	.final {
		font-size: 22px;
		font-weight: bold;
		color: #dc3545;
		margin-bottom: 10px;
	}

	/* 담기 버튼 */
	.cart-btn {
		height: 80px;
		width: 140px;
	}

	.cart-btn:hover {
		transform: scale(1.03);
	}

</style>
</head>

<body>

	<h1 class="page-title">엽기 떡볶이</h1>

	<div class="menu-list">

		<!-- 카드 1 : 엽기 떡볶이 (14000원) -->
		<div class="card menu-card" data-price="14000">

			<img src="${pageContext.request.contextPath}/img/basic.png"
			     class="menu-img1">

			<div class="menu-info">

				<h2>엽기 떡볶이</h2>

				<!-- 맵기 선택 -->
				<div class="spicy">

					맵기 :

					<input type="checkbox" id="spicy1" class="opt-input" data-add="0" value="1">
					<label for="spicy1">1단계</label>

					<input type="checkbox" id="spicy2" class="opt-input" data-add="0" value="2">
					<label for="spicy2">2단계</label>

					<input type="checkbox" id="spicy3" class="opt-input" data-add="0" value="3">
					<label for="spicy3">3단계</label>

					<input type="checkbox" id="spicy4" class="opt-input" data-add="0" value="4">
					<label for="spicy4">4단계</label>

					<input type="checkbox" id="spicy5" class="opt-input" data-add="0" value="5">
					<label for="spicy5">5단계</label>

				</div>

				<!-- 추가 옵션 -->
				<div class="option">

					<div>
						<input type="checkbox" id="fishcake1" class="opt-input" data-add="2500" value="오뎅 추가">
						<label for="fishcake1">오뎅 추가 +2,500원</label>
					</div>

					<div>
						<input type="checkbox" id="ricecake1" class="opt-input" data-add="3000" value="떡 추가">
						<label for="ricecake1">떡 추가 +3,000원</label>
					</div>

					<div>
						<input type="checkbox" id="noodle1" class="opt-input" data-add="2000" value="당면 추가">
						<label for="noodle1">당면 추가 +2,000원</label>
					</div>

					<div>
						<input type="checkbox" id="cheese1" class="opt-input" data-add="2000" value="치즈 추가">
						<label for="cheese1">치즈 추가 +2,000원</label>
					</div>

				</div>

			</div>

			<!-- 가격 및 담기 버튼 영역 -->
			<div class="btn-box">
				<div class="final">14,000원</div>
				<button class="cart-btn btn btn-secondary">담기</button>
			</div>

		</div>


		<!-- 카드 2 : 로제 떡볶이 (15000원) -->
		<div class="card menu-card" data-price="15000">

			<img src="${pageContext.request.contextPath}/img/rose.jpg"
			     class="menu-img1">

			<div class="menu-info">

				<h2>로제 떡볶이</h2>

				<!-- 맵기 선택 -->
				<div class="spicy">

					맵기 :

					<input type="checkbox" id="spicy6" class="opt-input" data-add="0" value="1">
					<label for="spicy6">1단계</label>

					<input type="checkbox" id="spicy7" class="opt-input" data-add="0" value="2">
					<label for="spicy7">2단계</label>

					<input type="checkbox" id="spicy8" class="opt-input" data-add="0" value="3">
					<label for="spicy8">3단계</label>

					<input type="checkbox" id="spicy9" class="opt-input" data-add="0" value="4">
					<label for="spicy9">4단계</label>

					<input type="checkbox" id="spicy10" class="opt-input" data-add="0" value="5">
					<label for="spicy10">5단계</label>

				</div>

				<!-- 추가 옵션 -->
				<div class="option">

					<div>
						<input type="checkbox" id="fishcake2" class="opt-input" data-add="2500" value="오뎅 추가">
						<label for="fishcake2">오뎅 추가 +2,500원</label>
					</div>

					<div>
						<input type="checkbox" id="ricecake2" class="opt-input" data-add="3000" value="떡 추가">
						<label for="ricecake2">떡 추가 +3,000원</label>
					</div>

					<div>
						<input type="checkbox" id="noodle2" class="opt-input" data-add="2000" value="당면 추가">
						<label for="noodle2">당면 추가 +2,000원</label>
					</div>

					<div>
						<input type="checkbox" id="cheese2" class="opt-input" data-add="2000" value="치즈 추가">
						<label for="cheese2">치즈 추가 +2,000원</label>
					</div>

				</div>

			</div>

			<!-- 가격 및 담기 버튼 영역 -->
			<div class="btn-box">
				<div class="final">15,000원</div>
				<button class="cart-btn btn btn-secondary">담기</button>
			</div>

		</div>


		<!-- 카드 3 : 마라 떡볶이 (16000원) -->
		<div class="card menu-card" data-price="16000">

			<img src="${pageContext.request.contextPath}/img/mara.jpg"
			     class="menu-img1">

			<div class="menu-info">

				<h2>마라 떡볶이</h2>

				<!-- 맵기 선택 -->
				<div class="spicy">

					맵기 :

					<input type="checkbox" id="spicy11" class="opt-input" data-add="0" value="1">
					<label for="spicy11">1단계</label>

					<input type="checkbox" id="spicy12" class="opt-input" data-add="0" value="2">
					<label for="spicy12">2단계</label>

					<input type="checkbox" id="spicy13" class="opt-input" data-add="0" value="3">
					<label for="spicy13">3단계</label>

					<input type="checkbox" id="spicy14" class="opt-input" data-add="0" value="4">
					<label for="spicy14">4단계</label>

					<input type="checkbox" id="spicy15" class="opt-input" data-add="0" value="5">
					<label for="spicy15">5단계</label>

				</div>

				<!-- 추가 옵션 -->
				<div class="option">

					<div>
						<input type="checkbox" id="fishcake3" class="opt-input" data-add="2500" value="오뎅 추가">
						<label for="fishcake3">오뎅 추가 +2,500원</label>
					</div>

					<div>
						<input type="checkbox" id="ricecake3" class="opt-input" data-add="3000" value="떡 추가">
						<label for="ricecake3">떡 추가 +3,000원</label>
					</div>

					<div>
						<input type="checkbox" id="noodle3" class="opt-input" data-add="2000" value="당면 추가">
						<label for="noodle3">당면 추가 +2,000원</label>
					</div>

					<div>
						<input type="checkbox" id="cheese3" class="opt-input" data-add="2000" value="치즈 추가">
						<label for="cheese3">치즈 추가 +2,000원</label>
					</div>

				</div>

			</div>

			<!-- 가격 및 담기 버튼 영역 -->
			<div class="btn-box">
				<div class="final">16,000원</div>
				<button class="cart-btn btn btn-secondary">담기</button>
			</div>

		</div>


		<!-- 카드 4 : 마라로제 떡볶이 (17000원) -->
		<div class="card menu-card" data-price="17000">

			<img src="${pageContext.request.contextPath}/img/mararose.png"
			     class="menu-img1">

			<div class="menu-info">

				<h2>마라로제 떡볶이</h2>

				<!-- 맵기 선택 -->
				<div class="spicy">

					맵기 :

					<input type="checkbox" id="spicy16" class="opt-input" data-add="0" value="1">
					<label for="spicy16">1단계</label>

					<input type="checkbox" id="spicy17" class="opt-input" data-add="0" value="2">
					<label for="spicy17">2단계</label>

					<input type="checkbox" id="spicy18" class="opt-input" data-add="0" value="3">
					<label for="spicy18">3단계</label>

					<input type="checkbox" id="spicy19" class="opt-input" data-add="0" value="4">
					<label for="spicy19">4단계</label>

					<input type="checkbox" id="spicy20" class="opt-input" data-add="0" value="5">
					<label for="spicy20">5단계</label>

				</div>

				<!-- 추가 옵션 -->
				<div class="option">

					<div>
						<input type="checkbox" id="fishcake4" class="opt-input" data-add="2500" value="오뎅 추가">
						<label for="fishcake4">오뎅 추가 +2,500원</label>
					</div>

					<div>
						<input type="checkbox" id="ricecake4" class="opt-input" data-add="3000" value="떡 추가">
						<label for="ricecake4">떡 추가 +3,000원</label>
					</div>

					<div>
						<input type="checkbox" id="noodle4" class="opt-input" data-add="2000" value="당면 추가">
						<label for="noodle4">당면 추가 +2,000원</label>
					</div>

					<div>
						<input type="checkbox" id="cheese4" class="opt-input" data-add="2000" value="치즈 추가">
						<label for="cheese4">치즈 추가 +2,000원</label>
					</div>

				</div>

			</div>

			<!-- 가격 및 담기 버튼 영역 -->
			<div class="btn-box">
				<div class="final">17,000원</div>
				<button class="cart-btn btn btn-secondary">담기</button>
			</div>

		</div>

	</div>
	
	<script>
	$(function() {
	
	    // 천 단위 콤마 포맷팅 함수
	    function comma(n) {
	        return n.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
	    }
	
	    // 카드 한 개(메뉴 하나)의 가격 재계산
	    function calc($card) {
	        // 기본 가격 (data-price)
	        var base = parseInt($card.data("price")) || 0;
	        var add  = 0;
	
	        // 선택된 옵션의 data-add 합산
	        $card.find(".opt-input:checked").each(function() {
	            add += parseInt($(this).data("add")) || 0;
	        });
	
	        var total = base + add;
	
	        // 화면 최종 가격 표시
	        $card.find(".final").text(comma(total) + "원");
	    }
	
	    // 맵기 체크박스는 하나만 선택되도록 설정 (라디오 버튼처럼 동작)
	    $(".spicy .opt-input").on("change", function() {
	        if ($(this).is(":checked")) {
	            $(this).closest(".spicy").find(".opt-input").not(this).prop("checked", false);
	        }
	    });

	    // 옵션이 변경되면 해당 카드만 재계산
	    $(".menu-card").on("change", ".opt-input", function() {
	        calc($(this).closest(".menu-card"));
	    });
	
	    // 페이지 로드 시 모든 메뉴 카드 초기 계산
	    $(".menu-card").each(function() {
	        calc($(this));
	    });
	
	});
</script>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>