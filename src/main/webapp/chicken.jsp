<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>치킨 상세 주문</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

<style>
    body { background-color: #f8f9fa; }
    .menu-card { max-width: 650px; margin: 30px auto; border-radius: 15px; box-shadow: 0 4px 15px rgba(0,0,0,0.1); }
    
    .option-title { font-weight: bold; color: #495057; margin-top: 15px; border-bottom: 2px solid #e9ecef; padding-bottom: 5px; }
    
    .total-price-box { background-color: #fff3cd; border: 1px solid #ffeeba; border-radius: 10px; padding: 15px; }

    #chickenCarousel {
        border-radius: 12px;
        overflow: hidden;
    }
    #chickenCarousel .carousel-inner {
        height: 350px;
    }
    #chickenCarousel .carousel-item {
        height: 100%;
    }
    #chickenCarousel .carousel-item img {
        width: 100%;
        height: 100% !important;
    }
</style>
</head>
<body>

<nav class="navbar navbar-dark bg-warning mb-4">
    <div class="container-fluid">
        <span class="navbar-brand mb-0 h1 text-dark fw-bold">🍗 치킨</span>
        <a href="menu_choice1.jsp" class="btn btn-outline-dark btn-sm">메뉴 목록으로</a>
    </div>
</nav>

<div class="container">
    <div class="card menu-card p-4 bg-white">
        <div id="chickenCarousel" class="carousel slide mb-4" data-bs-ride="carousel">
            <div class="carousel-indicators">
                <button type="button" data-bs-target="#chickenCarousel" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
                <button type="button" data-bs-target="#chickenCarousel" data-bs-slide-to="1" aria-label="Slide 2"></button>
                <button type="button" data-bs-target="#chickenCarousel" data-bs-slide-to="2" aria-label="Slide 3"></button>
            </div>

            <div class="carousel-inner">
                <div class="carousel-item active">
                    <img src="https://cdn.imweb.me/upload/S20220826948cbdc34dca3/93e166b8cc657.jpg" class="d-block w-100" alt="후라이드치킨">
                    <div class="carousel-caption d-none d-md-block bg-dark bg-opacity-50 rounded">
                        <h5>후라이드치킨</h5>
                    </div>
                </div>
                <div class="carousel-item">
                    <img src="https://cdn.imweb.me/upload/S20220826948cbdc34dca3/d69c463386f5b.jpg" class="d-block w-100 heigh" alt="양념치킨">
                    <div class="carousel-caption d-none d-md-block bg-dark bg-opacity-50 rounded">
                        <h5>양념치킨</h5>
                    </div>
                </div>
                <div class="carousel-item">
                    <img src="https://cdn.imweb.me/upload/S20220826948cbdc34dca3/6664459b7e844.jpg" class="d-block w-100" alt="간장치킨">
                    <div class="carousel-caption d-none d-md-block bg-dark bg-opacity-50 rounded">
                        <h5>간장치킨</h5>
                    </div>
                </div>
            </div>

            <button class="carousel-control-prev" type="button" data-bs-target="#chickenCarousel" data-bs-slide="prev">
                <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                <span class="visually-hidden">Previous</span>
            </button>
            <button class="carousel-control-next" type="button" data-bs-target="#chickenCarousel" data-bs-slide="next">
                <span class="carousel-control-next-icon" aria-hidden="true"></span>
                <span class="visually-hidden">Next</span>
            </button>
        </div>
        <h2 class="fw-bold text-dark">${not empty menu.menuName ? menu.menuName : '바삭 바삭 치킨'}</h2>
        <p class="text-muted mb-2">겉은 바삭하고 속은 촉촉한 치킨입니다.</p>
        <h4 class="text-primary fw-bold mb-4">
            기본 가격: <span id="basePrice">${not empty menu.price ? menu.price : 20000}</span>원
        </h4>

        <form id="orderForm">
            <input type="hidden" name="menuId" value="${not empty menu.menuId ? menu.menuId : 2}">

            <div class="option-title mb-2">1. 뼈/순살 선택 (필수)</div>
            <div class="form-check mb-2">
                <input class="form-check-input option-check" type="radio" name="typeOption" id="type1" value="0" data-name="뼈 치킨" checked>
                <label class="form-check-label" for="type1">뼈 치킨 (+0원)</label>
            </div>
            <div class="form-check mb-3">
                <input class="form-check-input option-check" type="radio" name="typeOption" id="type2" value="2000" data-name="순살 변경">
                <label class="form-check-label" for="type2">순살 변경 (+2,000원)</label>
            </div>

            <div class="option-title mb-2">2. 맛 선택 (필수)</div>
            <div class="form-check mb-2">
                <input class="form-check-input option-check" type="radio" name="flavorOption" id="flavor1" value="0" data-name="후라이드" checked>
                <label class="form-check-label" for="flavor1">후라이드 (+0원)</label>
            </div>
            <div class="form-check mb-2">
                <input class="form-check-input option-check" type="radio" name="flavorOption" id="flavor2" value="1000" data-name="양념치킨">
                <label class="form-check-label" for="flavor2">양념치킨 (+1,000원)</label>
            </div>
            <div class="form-check mb-2">
                <input class="form-check-input option-check" type="radio" name="flavorOption" id="flavor3" value="1000" data-name="간장치킨">
                <label class="form-check-label" for="flavor3">간장치킨 (+1,000원)</label>
            </div>
            <div class="form-check mb-2">
                <input class="form-check-input option-check" type="radio" name="flavorOption" id="flavor4" value="1500" data-name="반반(후라이드+양념)">
                <label class="form-check-label" for="flavor4">반반 치킨 (후라이드+양념) (+1,500원)</label>
            </div>
            <div class="form-check mb-2">
                <input class="form-check-input option-check" type="radio" name="flavorOption" id="flavor5" value="1500" data-name="반반(후라이드+간장)">
                <label class="form-check-label" for="flavor4">반반 치킨 (후라이드+간장) (+1,500원)</label>
            </div>
            <div class="form-check mb-2">
                <input class="form-check-input option-check" type="radio" name="flavorOption" id="flavor6" value="2000" data-name="반반(양념+간장)">
                <label class="form-check-label" for="flavor4">반반 치킨 (양념+간장) (+2,000원)</label>
            </div>

            <div class="option-title mb-2">3. 사이드 & 소스 추가 (선택)</div>
            <div class="form-check mb-2">
                <input class="form-check-input option-check" type="checkbox" name="addOption" id="add1" value="500" data-name="치킨무 추가">
                <label class="form-check-label" for="add1">치킨무 추가 (+500원)</label>
            </div>
            <div class="form-check mb-2">
                <input class="form-check-input option-check" type="checkbox" name="addOption" id="add2" value="1000" data-name="수제 갈릭소스">
                <label class="form-check-label" for="add2">수제 갈릭소스 추가 (+1,000원)</label>
            </div>
            <div class="form-check mb-4">
                <input class="form-check-input option-check" type="checkbox" name="addOption" id="add3" value="2000" data-name="콜라 1.25L 업그레이드">
                <label class="form-check-label" for="add3">음료 콜라 1.25L로 변경 (+2,000원)</label>
            </div>

            <div class="d-flex align-items-center mb-4">
                <label for="quantity" class="fw-bold me-3">주문 수량:</label>
                <input type="number" id="quantity" name="quantity" class="form-control text-center" value="1" min="1" max="10" style="width: 80px;">
            </div>

            <div class="total-price-box text-center mb-4">
                <span class="fs-5 text-dark">총 주문 금액: </span>
                <span id="totalPriceDisplay" class="fs-3 fw-bold text-danger">20,000</span>
                <span class="fs-5 text-dark">원</span>
            </div>

            <div class="row g-2">
                <div class="col-12">
                    <button type="button" id="btnCart" class="btn btn-outline-warning btn-lg w-100 fw-bold text-dark">
                        🛒 장바구니 담기
                    </button>
                </div>

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
        let optionNames = [];

        $(".option-check:checked").each(function() {
            let optionName = $(this).data("name");
            if (optionName) {
                optionNames.push(optionName);
            }
        });

        let quantity = $("#quantity").val();
        return optionNames.join(" / ") + " (수량: " + quantity + "개)";
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

    $("#btnOrder").click(function() {
        let finalPrice = calculateTotalPrice();
        let selectedOptions = getSelectedOptionString();
        let menuId = $("input[name='menuId']").val();

        location.href = "order.jsp?menuId=" + menuId + 
                        "&options=" + encodeURIComponent(selectedOptions) + 
                        "&price=" + finalPrice;
    });

});
</script>

</body>
</html>