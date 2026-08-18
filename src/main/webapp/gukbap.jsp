<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>국밥 주문하기</title>
<style>
    /* 화면을 조금 더 예쁘게 보여주기 위한 기본 CSS 입니다 */
    body { font-family: 'Malgun Gothic', sans-serif; padding: 30px; }
    .menu-box { border: 1px solid #ccc; padding: 20px; border-radius: 10px; width: 350px; background-color: #f9f9f9; }
    .price { font-weight: bold; color: #d9534f; font-size: 1.2em; }
    .option-group { margin-top: 20px; margin-bottom: 20px; }
    .btn-submit { background-color: #ff9800; color: white; padding: 12px 20px; border: none; border-radius: 5px; cursor: pointer; width: 100%; font-size: 1.1em; font-weight: bold; }
    .btn-submit:hover { background-color: #e68a00; }
</style>
</head>
<body>

<div class="menu-box">
    <!-- 1. 컨트롤러(gukbap.do 등)에서 넘겨준 menu 객체의 이름과 가격을 출력합니다. -->
    <h2>🍲 ${menu.menuName}</h2>
    <p>기본 가격: <span class="price">${menu.price}원</span></p>
    <hr>

    <!-- 2. 장바구니 담기(addcart.do)로 데이터를 보냅니다. -->
    <form action="addcart.do" method="post">
        
        <!-- ⭐️핵심: 컨트롤러가 "어떤 메뉴"인지 알아야 하므로 menuId를 몰래 숨겨서 보냅니다. -->
        <input type="hidden" name="menuId" value="${menu.menuId}">

        <div class="option-group">
            <h3>✔ 사이즈 선택 (필수)</h3>
            <!-- 라디오 버튼은 하나만 선택 가능합니다. name이 "size"로 같습니다. -->
            <label><input type="radio" name="size" value="보통" checked> 보통 (추가금 없음)</label><br>
            <label><input type="radio" name="size" value="특"> 특 (추가 2,000원)</label>
        </div>

        <div class="option-group">
            <h3>✔ 추가 토핑 (선택)</h3>
            <!-- 체크박스는 여러 개 선택 가능합니다. name이 "topping"으로 같습니다. -->
            <label><input type="checkbox" name="topping" value="고기많이"> 고기 많이 (추가 3,000원)</label><br>
            <label><input type="checkbox" name="topping" value="얼큰다대기"> 얼큰 다대기 추가 (추가 500원)</label><br>
            <label><input type="checkbox" name="topping" value="부추추가"> 부추 팍팍 (추가 0원)</label>
        </div>

        <!-- 제출 버튼을 누르면 action에 적힌 addcart.do 컨트롤러로 데이터가 슝 날아갑니다. -->
        <button type="submit" class="btn-submit">장바구니 담기</button>
    </form>
</div>

</body>
</html>