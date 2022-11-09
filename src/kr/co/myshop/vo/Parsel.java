package kr.co.myshop.vo;
//배송 클래스
public class Parsel {
	private int parselNo;		//배송코드
	private String parselAddr;	//배송지
	private String cusTel;		//고객연락처
	private String parselCom; //배송회사
	private String parselTel;	//배송기사연락처
	private int parselState;	//배송상태(0:배송전,1:배송중,2:도착,3:구매결정)
	private String baleCode;	//화물코드
	
	public int getParselNo() {
		return parselNo;
	}
	public void setParselNo(int parselNo) {
		this.parselNo = parselNo;
	}
	public String getParselAddr() {
		return parselAddr;
	}
	public void setParselAddr(String parselAddr) {
		this.parselAddr = parselAddr;
	}
	public String getCusTel() {
		return cusTel;
	}
	public void setCusTel(String cusTel) {
		this.cusTel = cusTel;
	}
	public String getParselCom() {
		return parselCom;
	}
	public void setParselCom(String parselCom) {
		this.parselCom = parselCom;
	}
	public String getParselTel() {
		return parselTel;
	}
	public void setParselTel(String parselTel) {
		this.parselTel = parselTel;
	}
	public int getParselState() {
		return parselState;
	}
	public void setParselState(int parselState) {
		this.parselState = parselState;
	}
	public String getBaleCode() {
		return baleCode;
	}
	public void setBaleCode(String baleCode) {
		this.baleCode = baleCode;
	}
	public String getParselUrl(String parselCom) {
		String parselUrl = "";
		if(parselCom.equals("CJ대한통운")) {
			parselUrl = "https://www.doortodoor.co.kr/parcel/doortodoor.do?fsp_action=PARC_ACT_002&fsp_cmd=retrieveInvNoACT&invc_no=";
		} else if(parselCom.equals("롯데택배")){
			parselUrl = "https://www.lotteglogis.com/mobile/reservation/tracking/linkView?InvNo=";
		} else if(parselCom.equals("우체국택배")){
			parselUrl = "https://service.epost.go.kr/trace.RetrieveDomRigiTraceList.comm?displayHeader=N&sid1=";
		} else if(parselCom.equals("로젠택배")){
			parselUrl = "https://www.ilogen.com/m/personal/trace/";
		} else if(parselCom.equals("한진택배")){
			parselUrl = "https://www.hanjin.co.kr/kor/CMS/DeliveryMgr/WaybillResult.do?mCode=MN038&schLang=KR&wblnumText2=";
		} else {
			parselUrl = "http://www.naver.com";
		}
		return parselUrl;
	}
}
