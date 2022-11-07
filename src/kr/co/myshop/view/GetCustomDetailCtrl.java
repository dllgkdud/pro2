package kr.co.myshop.view;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.co.myshop.vo.Custom;


@WebServlet("/GetCustomDetailCtrl")
public class GetCustomDetailCtrl extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private final static String DRIVER = "com.mysql.cj.jdbc.Driver";
	private final static String URL = "jdbc:mysql://localhost:3306/myshop?serverTimezone=Asia/Seoul";
	private final static String USER = "root";
	private final static String PASS = "a1234";
	String sql = "";

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		String cusId = request.getParameter("cusId");
		try {
			Class.forName(DRIVER);
			Connection con = DriverManager.getConnection(URL, USER, PASS);
			sql = "select * from custom where cusid=?";
			PreparedStatement pstmt = con.prepareStatement(sql);
			pstmt.setString(1, cusId);
			ResultSet rs = pstmt.executeQuery();
			rs = pstmt.executeQuery();
			String cusPw = "";
			String key = "%15x";
			String comPw = "";	
			Custom vo = new Custom();
			
			if(rs.next()){
				vo.setCusId(rs.getString("cusid"));
				cusPw = rs.getString("cuspw");
				//comPw = AES256.decryptAES256(cusPw, key);
				vo.setCusPw(cusPw);
				vo.setCusName(rs.getString("cusname"));			
				vo.setAddress(rs.getString("address"));
				vo.setTel(rs.getString("custel"));
				vo.setRegDate(rs.getString("regdate"));
				vo.setPoint(rs.getInt("point"));
				vo.setVisited(rs.getInt("visited"));
			} else {
				response.sendRedirect("./custom/login.jsp");
			}
			request.setAttribute("custom", vo);
			
			//포워딩
			RequestDispatcher view = request.getRequestDispatcher("./admin/customDetail.jsp");
			view.forward(request, response);
			
			pstmt.close();
			con.close();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
