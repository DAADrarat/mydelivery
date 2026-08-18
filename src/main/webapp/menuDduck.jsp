<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>엽기 떡볶이 상세 주문</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

<style>
    body { background-color: #f8f9fa; }
    .menu-card { max-width: 650px; margin: 30px auto; border-radius: 15px; box-shadow: 0 4px 15px rgba(0,0,0,0.1); }
    .option-title { font-weight: bold; color: #495057; margin-top: 15px; border-bottom: 2px solid #e9ecef; padding-bottom: 5px; }
    .total-price-box { background-color: #fff3cd; border: 1px solid #ffeeba; border-radius: 10px; padding: 15px; }

    #dduckCarousel { border-radius: 12px; overflow: hidden; }
    #dduckCarousel .carousel-inner { height: 350px; }
    #dduckCarousel .carousel-item { height: 100%; }
    #dduckCarousel .carousel-item img { width: 100%; height: 100% !important; background-color: #e9ecef; object-fit: cover; }
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

            <div class="carousel-inner">
                <div class="carousel-item active">
                    <img src="https://nyumbucket.s3.ap-northeast-2.amazonaws.com/restaurant/79bcad02-5890-4306-80b1-b92092817cdc" class="d-block w-100" alt="엽기 떡볶이">
                    <div class="carousel-caption d-none d-md-block bg-dark bg-opacity-50 rounded">
                        <h5>엽기 떡볶이</h5>
                    </div>
                </div>
                <div class="carousel-item">
                    <img src="https://www.yupdduk.com/bod/config/menu/%EB%A1%9C%EC%A0%9C%EB%A9%94%EB%89%B4_5_1_1_1_1_1_1_2_1_1_1_1_1_1_1_1_1_1_1.png" class="d-block w-100" alt="로제 떡볶이">
                    <div class="carousel-caption d-none d-md-block bg-dark bg-opacity-50 rounded">
                        <h5>로제 떡볶이</h5>
                    </div>
                </div>
                <div class="carousel-item">
                    <img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSsOse4777KGPX5JW3g5vUoex1WFwYHDZ7G2Y2XXD0REg&s=10" class="d-block w-100" alt="마라 떡볶이">
                    <div class="carousel-caption d-none d-md-block bg-dark bg-opacity-50 rounded">
                        <h5>마라 떡볶이</h5>
                    </div>
                </div>
                <div class="carousel-item">
                    <img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcROOMJcnCmlCCUH2uiYhVZGbH8J9yEw8lHTSINATEaC8Q&s=10" class="d-block w-100" alt="마라로제 떡볶이">
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
        <p class="text-muted mb-2">중독성 강한 매운맛! 취향에 맞는 메뉴와 맵기를 선택하세요.</p>
        
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

        $(".option-check:checked").each(function() {
            optionSum += parseInt($(this).val());
        });

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

        return selectedMenu + " / 맵기: " + selectedSpicy + " (수량: " + quantity + "개)";
    }

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
                if (confirm("장바구니에 메뉴가 성공적으로 담겼습니다!\n장바구니(주문 화면)로 이동하시겠습니까?")) {
                    location.href = "cart.do";
                }
            },
            error: function() {
                alert("장바구니 담기 중 오류가 발생했습니다.");
            }
        });
    });

});
</script>
</body>
</html>