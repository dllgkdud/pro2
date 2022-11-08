package kr.co.myshop.vo;
//고객 클래스(mvc 규칙1. 모델(데이터)은 컨트롤러와 뷰에 의존하지 않고 단독으로 존재해야한다.)
public class Custom {
	private String cusId;	//고객아이디
	private String cusPw;	//고객비밀번호
	private String cusName;	//고객명
	private String address;	//고객주소
	private String tel;		//고객연락처
	private String regDate;	//가입일
	private int point;		//구매포인트
	private int visited;	//방문횟수
	
	
	public String getCusId() {
		return cusId;
	}
	public void setCusId(String cusId) {
		this.cusId = cusId;
	}
	public String getCusPw() {
		return cusPw;
	}
	public void setCusPw(String cusPw) {
		this.cusPw = cusPw;
	}
	public String getCusName() {
		return cusName;
	}
	public void setCusName(String cusName) {
		this.cusName = cusName;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public String getRegDate() {
		return regDate;
	}
	public void setRegDate(String regDate) {
		this.regDate = regDate;
	}
	public int getPoint() {
		return point;
	}
	public void setPoint(int point) {
		this.point = point;
	}
	public int getVisited() {
		return visited;
	}
	public void setVisited(int visited) {
		this.visited = visited;
	}
}
