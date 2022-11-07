package kr.co.myshop.ctrl;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/DeleteBoardCtrl")
public class DeleteBoardCtrl extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static final String DRIVER = "com.mysql.cj.jdbc.Driver";
    private static final String URL = "jdbc:mysql://localhost:3306/myshop?serverTimezone=Asia/Seoul";
    private static final String USER = "root";
    private static final String PASS = "a1234";
    String sql = "";
    int cnt = 0;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text.html; charset=UTF-8");
		
		int notNo = Integer.parseInt(request.getParameter("notNo"));
		try {
			Class.forName(DRIVER);
			Connection con = DriverManager.getConnection(URL, USER, PASS);
			sql = "delete from notice where notno=?";
			PreparedStatement pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, notNo);
			cnt = pstmt.executeUpdate();
			
			if(cnt>0){
				response.sendRedirect("GetBoardListCtrl");
			} else {
				response.sendRedirect("GetBoardlDetailCtrl?notNo="+notNo);
			}
			
			pstmt.close();
			con.close();
			
		} catch (Exception e) {		
			e.printStackTrace();
		}
	}

}
