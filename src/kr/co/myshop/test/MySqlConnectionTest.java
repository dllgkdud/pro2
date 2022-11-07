package kr.co.myshop.test;

import static org.junit.Assert.*;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.logging.Logger;

import org.junit.Test;

//데이터베이스 연결 테스트(Connection con = DriverManager.getConnection(URL,USER,PASS);)
public class MySqlConnectionTest {
	private final static Logger log = Logger.getGlobal();
	private final static String DRIVER = "com.mysql.cj.jdbc.Driver";
	private final static String URL = "jdbc:mysql://localhost:3306/myshop";
	private final static String USER = "root";
	private final static String PASS = "a1234";
	String sql="";
	
	//자바 API도큐먼트에서 throws는 선언 시 발생되는 예외를 처리하지 않고 떠넘긴다.(try -catch구문)
	@Test
	public void mySqlConnectionTest() throws ClassNotFoundException{
		Class.forName(DRIVER);
		//연결 테스트 시 자주 사용되는 현재 날짜 명령어
		sql = "select now() as time";
		
		try (
			//데이터베이스 연결
			Connection con = DriverManager.getConnection(URL,USER,PASS);
			//mysql을 연결해서 파생된 연결명령문
			PreparedStatement pstmt = con.prepareStatement(sql);
			//연결된 데이터를 쿼리의 형태로 이동시킬 때 사용
			ResultSet rs = pstmt.executeQuery();
		){
			assertNotNull(con);
			log.info("con: "+con);
			log.info("pstmt: "+pstmt);
			
			rs.next();
			log.info(rs.getString("time"));
			//데이터베이스 종료 시 선언부와 반대 순서로 선언한다.
			rs.close();
			pstmt.close();
			con.close();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		//fail("Not yet implemented");
		
		/* 성공예시(JUnitTest)
		11월 07, 2022 8:06:23 오후 kr.co.myshop.test.MySqlConnectionTest mySqlConnectionTest
		정보: con: com.mysql.cj.jdbc.ConnectionImpl@402e37bc
		11월 07, 2022 8:06:23 오후 kr.co.myshop.test.MySqlConnectionTest mySqlConnectionTest
		정보: pstmt: com.mysql.cj.jdbc.ClientPreparedStatement: select now() as time
		11월 07, 2022 8:06:23 오후 kr.co.myshop.test.MySqlConnectionTest mySqlConnectionTest
		정보: 2022-11-07 20:06:23*/
	}
}
