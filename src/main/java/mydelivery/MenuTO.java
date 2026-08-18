package mydelivery;

public class MenuTO {

	private int menuId;
	private int storeId;
	private String menuName;
	private int price;
	private int qty; // 장바구니용

	public int getMenuId() {
		return menuId;
	}

	public void setMenuId(int menuId) {
		this.menuId = menuId;
	}

	public int getStoreId() {
		return storeId;
	}

	public void setStoreId(int storeId) {
		this.storeId = storeId;
	}

	public String getMenuName() {
		return menuName;
	}

	public void setMenuName(String menuName) {
		this.menuName = menuName;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public int getQty() {
		return qty;
	}

	public void setQty(int qty) {
		this.qty = qty;
	}

	// 계산값
	public int getItemTotal() {
		return price * qty;
	}
	
	private String optionText;

	public String getOptionText() {
	    return optionText;
	}

	public void setOptionText(String optionText) {
	    this.optionText = optionText;
	}
}