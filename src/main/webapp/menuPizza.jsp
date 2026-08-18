<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="java.util.*" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>

<%
	// ===== 화면 확인용 더미데이터 (컨트롤러 완성되면 이 블록 삭제) =====
	List<Map<String, Object>> dummy = new ArrayList<>();
	String[] names = { "페퍼로니 피자", "치즈 피자", "불고기 피자", "콤비네이션 피자", "콜라 1.25L" };
	int[] prices = { 21000, 19000, 23000, 24000, 3000 };
	boolean[] pizza = { true, true, true, true, false };

	for (int i = 0; i < names.length; i++) {
		Map<String, Object> m = new HashMap<>();
		m.put("menuId", i + 1);
		m.put("menuName", names[i]);
		m.put("price", prices[i]);
		m.put("pizza", pizza[i]);
		dummy.add(m);
	}
	request.setAttribute("list", dummy);
	request.setAttribute("storeName", "피자나라");
	// ===== 여기까지 삭제 =====
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메뉴</title>
<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
<style>
  table { border-collapse: collapse; width: 850px; }
  th, td { border: 1px solid #ccc; padding: 8px; text-align: center; }
  th { background: #f5f5f5; }
  input[type=number] { width: 50px; }
  .opt { text-align: left; font-size: 13px; line-height: 1.9; }
  .opt label { margin-right: 12px; cursor: pointer; }
  .final { font-weight: bold; color: #c33; }
</style>
</head>
<body>
<h2>${storeName}</h2>

<c:choose>
  <c:when test="${empty list}">
    <p>등록된 메뉴가 없습니다.</p>
    <a href="store.do">가게 목록</a>
  </c:when>

  <c:otherwise>
    <table>
      <tr>
        <th>메뉴</th><th>옵션</th><th>수량</th><th>합계</th><th>담기</th>
      </tr>
      <c:forEach var="to" items="${list}">
        <tr class="menu-row" data-price="${to.price}">
          <td>
            ${to.menuName}<br>
            <span style="font-size:12px; color:#888;">
              <fmt:formatNumber value="${to.price}"/>원
            </span>
          </td>

          <td class="opt">
            <c:choose>
              <c:when test="${to.pizza}">
                <div>
                  <label><input type="radio" name="size${to.menuId}" class="opt-input"
                                data-add="0" value="R" checked> 레귤러</label>
                  <label><input type="radio" name="size${to.menuId}" class="opt-input"
                                data-add="5000" value="L"> 라지 (+5,000)</label>
                </div>
                <div>
                  <label><input type="radio" name="edge${to.menuId}" class="opt-input"
                                data-add="0" value="NORMAL" checked> 일반도우</label>
                  <label><input type="radio" name="edge${to.menuId}" class="opt-input"
                                data-add="3000" value="CHEESE"> 치즈크러스트 (+3,000)</label>
                </div>
                <div>
                  <label><input type="checkbox" name="topping" class="opt-input"
                                data-add="2000" value="CHEESE"> 치즈추가 (+2,000)</label>
                  <label><input type="checkbox" name="topping" class="opt-input"
                                data-add="2000" value="PEPPERONI"> 페퍼로니 (+2,000)</label>
                  <label><input type="checkbox" name="topping" class="opt-input"
                                data-add="1500" value="POTATO"> 감자 (+1,500)</label>
                </div>
              </c:when>
              <c:otherwise>-</c:otherwise>
            </c:choose>
          </td>

          <td>
            <input type="number" class="qty" value="1" min="1" max="99">
          </td>

          <td class="final">
            <fmt:formatNumber value="${to.price}"/>원
          </td>

          <td>
            <form action="cart.do" method="post">
              <input type="hidden" name="cmd" value="add">
              <input type="hidden" name="menuId" value="${to.menuId}">
              <input type="hidden" name="qty" class="f-qty" value="1">
              <input type="hidden" name="size" class="f-size" value="R">
              <input type="hidden" name="edge" class="f-edge" value="NORMAL">
              <input type="hidden" name="topping" class="f-topping" value="">
              <button type="submit">담기</button>
            </form>
          </td>
        </tr>
      </c:forEach>
    </table>

    <br>
    <a href="store.do">가게 목록</a>
    <a href="cart.do">장바구니 보기</a>
  </c:otherwise>
</c:choose>

<script>
$(function() {

    function comma(n) {
        return n.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
    }

    // 한 행의 가격을 다시 계산
    function calc($row) {
        var base = parseInt($row.data("price"));
        var add  = 0;

        // 선택된 옵션의 data-add 합산
        $row.find(".opt-input:checked").each(function() {
            add += parseInt($(this).data("add"));
        });

        var qty  = parseInt($row.find(".qty").val()) || 1;
        var unit = base + add;

        $row.find(".final").text(comma(unit * qty) + "원");

        // 폼 hidden 값 동기화
        $row.find(".f-qty").val(qty);
        $row.find(".f-size").val($row.find("input[name^=size]:checked").val() || "R");
        $row.find(".f-edge").val($row.find("input[name^=edge]:checked").val() || "NORMAL");

        var tops = [];
        $row.find("input[name=topping]:checked").each(function() {
            tops.push($(this).val());
        });
        $row.find(".f-topping").val(tops.join(","));
    }

    // 옵션이나 수량이 바뀌면 그 행만 재계산
    $(".menu-row").on("change", ".opt-input, .qty", function() {
        calc($(this).closest(".menu-row"));
    });

    // 처음 로드될 때 한 번 계산
    $(".menu-row").each(function() {
        calc($(this));
    });

});
</script>

</body>
</html>