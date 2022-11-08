package kr.co.myshop.ctrl;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.co.myshop.vo.Parsel;


@WebServlet("/UpdateParselCtrl")
public class UpdateParselCtrl extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private final static String DRIVER = "com.mysql.cj.jdbc.Driver";
	private final static String URL = "jdbc:mysql://localhost:3306/myshop?serverTimezone=Asia/Seoul";
	private final static String USER = "root";
	private final static String PASS = "a1234";
	String sql = "";

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int parselNo = Integer.parseInt(request.getParameter("parselNo"));
		try {
			Class.forName(DRIVER);
			sql = "select * from parsel where parselno=?";
			Connection con = DriverManager.getConnection(URL, USER, PASS);
			PreparedStatement pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, parselNo);
			ResultSet rs = pstmt.executeQuery();
			
			Parsel vo = new Parsel();
			if(rs.next()){
				vo.setParselNo(rs.getInt("parselno"));
				vo.setParselAddr(rs.getString("parseladdr"));
				vo.setCusTel(rs.getString("custel"));
				vo.setParselCom(rs.getString("parselcom"));
				vo.setParselTel(rs.getString("parseltel"));
				vo.setParselState(rs.getInt("parselstate"));
				vo.setBaleCode(rs.getString("balecode"));
			}
			request.setAttribute("parsel", vo);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}