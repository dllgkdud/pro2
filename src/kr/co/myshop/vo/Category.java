package kr.co.myshop.vo;
//상품 카테고리 클래스
public class Category {
	private int cateNo;		//제품카테고리번호
	private String cateName;//제품카테고리이름
	
	
	public int getCateNo() {
		return cateNo;
	}
	public void setCateNo(int cateNo) {
		this.cateNo = cateNo;
	}
	public String getCateName() {
		return cateName;
	}
	public void setCateName(String cateName) {
		this.cateName = cateName;
	}
}
