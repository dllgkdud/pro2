package kr.co.myshop.ctrl;

import java.io.IOException;
import java.security.NoSuchAlgorithmException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.crypto.util.SHA256;


@WebServlet("/CustomLoginCtrl")
public class CustomLoginCtrl extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static final String DRIVER = "com.mysql.cj.jdbc.Driver";
    private static final String URL ="jdbc:mysql://localhost:3306/myshop?serverTimezone=Asia/Seoul";
    private static final String USER = "root";
    private static final String PASS = "a1234";
    String sql = "";

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		String cusId = request.getParameter("cusId");
		String cus = request.getParameter("cusPw");
		String cusPw ="";
		
		try {
			cusPw = SHA256.encrypt(cus);
		} catch (NoSuchAlgorithmException e) {
			e.printStackTrace();
		}
		try {
			Class.forName(DRIVER);
			Connection con = DriverManager.getConnection(URL, USER, PASS);
			sql = "select * from custom where cusId=? and cusPw=?";
			//con.setAutoCommit(false);
			PreparedStatement pstmt = con.prepareStatement(sql);
			ResultSet rs = null;
			pstmt.setString(1, cusId);
			pstmt.setString(2, cusPw);
			rs = pstmt.executeQuery();
			
			HttpSession session = request.getSession();
			if(rs.next()){
/*				//로그인 성공 시, 방문횟수를 증가하고, 로그인 포인트를 3점씩 지급
				sql = "update custom set visited=visited+1, point=point+3 where cusId=?";
				pstmt.setString(1, cusId);
				pstmt.executeLargeUpdate();
				con.commit();
				con.setAutoCommit(true);
				*/
				session.setAttribute("sid", cusId);
				session.setAttribute("sname",rs.getString("cusName"));
				response.sendRedirect("index.jsp");
			} else {
				response.sendRedirect("./custom/login.jsp");
			}
			
			rs.close();
			pstmt.close();
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
