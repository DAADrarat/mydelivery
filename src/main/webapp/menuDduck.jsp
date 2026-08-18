<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>엽기 떡볶이 상세 주문</title>

<<<<<<< HEAD
<!-- jQuery 추가 -->
<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
      rel="stylesheet">
=======
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
>>>>>>> 40d33e7 (수정)

<style>
    body { background-color: #f8f9fa; }
    .menu-card { max-width: 650px; margin: 30px auto; border-radius: 15px; box-shadow: 0 4px 15px rgba(0,0,0,0.1); }
    .option-title { font-weight: bold; color: #495057; margin-top: 15px; border-bottom: 2px solid #e9ecef; padding-bottom: 5px; }
    .total-price-box { background-color: #fff3cd; border: 1px solid #ffeeba; border-radius: 10px; padding: 15px; }

<<<<<<< HEAD
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

=======
    #dduckCarousel { border-radius: 12px; overflow: hidden; }
    #dduckCarousel .carousel-inner { height: 350px; }
    #dduckCarousel .carousel-item { height: 100%; }
    #dduckCarousel .carousel-item img { width: 100%; height: 100% !important; background-color: #e9ecef; object-fit: cover; }
>>>>>>> 40d33e7 (수정)
</style>
</head>
<body>

<nav class="navbar navbar-dark bg-warning mb-4">
    <div class="container-fluid">
        <span class="navbar-brand mb-0 h1 text-dark fw-bold">🔥 엽기 떡볶이</span>
        <a href="store.jsp" class="btn btn-outline-dark btn-sm">메뉴 목록으로</a>
    </div>
</nav>

<div class="container mb-5">
    <div class="card menu-card p-4 bg-white">
        <div id="dduckCarousel" class="carousel slide mb-4" data-bs-ride="carousel">
            <div class="carousel-indicators">
                <button type="button" data-bs-target="#dduckCarousel" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
                <button type="button" data-bs-target="#dduckCarousel" data-bs-slide-to="1" aria-label="Slide 2"></button>
                <button type="button" data-bs-target="#dduckCarousel" data-bs-slide-to="2" aria-label="Slide 3"></button>
                <button type="button" data-bs-target="#dduckCarousel" data-bs-slide-to="3" aria-label="Slide 4"></button>
            </div>

<<<<<<< HEAD
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
=======
            <div class="carousel-inner">
                <div class="carousel-item active">
                    <img src="" class="d-block w-100" alt="엽기 떡볶이">
                    <div class="carousel-caption d-none d-md-block bg-dark bg-opacity-50 rounded">
                        <h5>엽기 떡볶이</h5>
                    </div>
                </div>
                <div class="carousel-item">
                    <img src="" class="d-block w-100" alt="로제 떡볶이">
                    <div class="carousel-caption d-none d-md-block bg-dark bg-opacity-50 rounded">
                        <h5>로제 떡볶이</h5>
                    </div>
                </div>
                <div class="carousel-item">
                    <img src="" class="d-block w-100" alt="마라 떡볶이">
                    <div class="carousel-caption d-none d-md-block bg-dark bg-opacity-50 rounded">
                        <h5>마라 떡볶이</h5>
                    </div>
                </div>
                <div class="carousel-item">
                    <img src="" class="d-block w-100" alt="마라로제 떡볶이">
                    <div class="carousel-caption d-none d-md-block bg-dark bg-opacity-50 rounded">
                        <h5>마라로제 떡볶이</h5>
                    </div>
                </div>
            </div>

            <button class="carousel-control-prev" type="button" data-bs-target="#dduckCarousel" data-bs-slide="prev">
                <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                <span class="visually-hidden">Previous</span>
            </button>
            <button class="carousel-control-next" type="button" data-bs-target="#dduckCarousel" data-bs-slide="next">
                <span class="carousel-control-next-icon" aria-hidden="true"></span>
                <span class="visually-hidden">Next</span>
            </button>
        </div>

        <h2 class="fw-bold text-dark">엽기 떡볶이 메뉴 선택</h2>
        <p class="text-muted mb-2">중독성 강한 매운맛!</p>
        
        <h4 class="text-primary fw-bold mb-4">
            기본 가격: <span id="basePrice">14000</span>원
        </h4>

        <form id="orderForm">
            <input type="hidden" name="menuId" value="${not empty menu.menuId ? menu.menuId : 101}">

            <div class="option-title mb-2">1. 메뉴 선택 (필수)</div>
            <div class="form-check mb-2">
                <input class="form-check-input option-check" type="radio" name="menuOption" id="menu1" value="0" data-name="엽기 떡볶이" checked>
                <label class="form-check-label" for="menu1">엽기 떡볶이 (+0원)</label>
            </div>
            <div class="form-check mb-2">
                <input class="form-check-input option-check" type="radio" name="menuOption" id="menu2" value="2000" data-name="로제 떡볶이">
                <label class="form-check-label" for="menu2">로제 떡볶이 (+2,000원)</label>
            </div>
            <div class="form-check mb-2">
                <input class="form-check-input option-check" type="radio" name="menuOption" id="menu3" value="2000" data-name="마라 떡볶이">
                <label class="form-check-label" for="menu3">마라 떡볶이 (+2,000원)</label>
            </div>
            <div class="form-check mb-3">
                <input class="form-check-input option-check" type="radio" name="menuOption" id="menu4" value="4000" data-name="마라로제 떡볶이">
                <label class="form-check-label" for="menu4">마라로제 떡볶이 (+4,000원)</label>
            </div>
>>>>>>> 40d33e7 (수정)

            <div class="option-title mb-2">2. 맵기 선택 (필수)</div>
            <div class="form-check mb-2">
                <input class="form-check-input option-check" type="radio" name="spicyOption" id="spicy1" value="0" data-name="1단계(착한맛)" checked>
                <label class="form-check-label" for="spicy1">1단계 (착한맛)</label>
            </div>
            <div class="form-check mb-2">
                <input class="form-check-input option-check" type="radio" name="spicyOption" id="spicy2" value="0" data-name="2단계(초보맛)">
                <label class="form-check-label" for="spicy2">2단계 (초보맛)</label>
            </div>
            <div class="form-check mb-2">
                <input class="form-check-input option-check" type="radio" name="spicyOption" id="spicy3" value="0" data-name="3단계(덜매운맛)">
                <label class="form-check-label" for="spicy3">3단계 (덜매운맛)</label>
            </div>
            <div class="form-check mb-2">
                <input class="form-check-input option-check" type="radio" name="spicyOption" id="spicy4" value="0" data-name="4단계(오리지널)">
                <label class="form-check-label" for="spicy4">4단계 (오리지널)</label>
            </div>
            <div class="form-check mb-4">
                <input class="form-check-input option-check" type="radio" name="spicyOption" id="spicy5" value="0" data-name="5단계(매운맛)">
                <label class="form-check-label" for="spicy5">5단계 (매운맛)</label>
            </div>

<<<<<<< HEAD
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
=======
            <div class="d-flex align-items-center mb-4">
                <label for="quantity" class="fw-bold me-3">주문 수량:</label>
                <input type="number" id="quantity" name="quantity" class="form-control text-center" value="1" min="1" max="10" style="width: 80px;">
            </div>

            <div class="total-price-box text-center mb-4">
                <span class="fs-5 text-dark">총 주문 금액: </span>
                <span id="totalPriceDisplay" class="fs-3 fw-bold text-danger">14,000</span>
                <span class="fs-5 text-dark">원</span>
            </div>

            <div>
                <button type="button" id="btnCart" class="btn btn-warning btn-lg w-100 fw-bold text-dark">
                    🛒 장바구니 담기
                </button>
            </div>
        </form>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
<script>
$(document).ready(function() {

    function calculateTotalPrice() {
        let basePrice = parseInt($("#basePrice").text());
        let optionSum = 0;
>>>>>>> 40d33e7 (수정)

        $(".option-check:checked").each(function() {
            optionSum += parseInt($(this).val());
        });

<<<<<<< HEAD
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
=======
        let quantity = parseInt($("#quantity").val());
        if (isNaN(quantity) || quantity < 1) {
            quantity = 1;
        }

        let totalPrice = (basePrice + optionSum) * quantity;
        $("#totalPriceDisplay").text(totalPrice.toLocaleString());

        return totalPrice;
    }

    $(document).on("change", ".option-check, #quantity", function() {
        calculateTotalPrice();
    });

    function getSelectedOptionString() {
        let selectedMenu = $("input[name='menuOption']:checked").data("name");
        let selectedSpicy = $("input[name='spicyOption']:checked").data("name");
        let quantity = $("#quantity").val();
>>>>>>> 40d33e7 (수정)

        return selectedMenu + " / 맵기: " + selectedSpicy + " (수량: " + quantity + "개)";
    }

<<<<<<< HEAD
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
=======
    $("#btnCart").click(function() {
        let finalPrice = calculateTotalPrice();
        let selectedOptions = getSelectedOptionString();
        let menuId = $("input[name='menuId']").val();

        $.ajax({
            url: "addcart.do",
            type: "POST",
            data: {
                menuId: menuId,
                selectedOptions: selectedOptions,
                finalPrice: finalPrice
            },
            success: function(response) {
                location.href = "cart.jsp";
            },
            error: function() {
                location.href = "cart.jsp";
            }
        });
    });
>>>>>>> 40d33e7 (수정)

});
</script>
</body>
</html>