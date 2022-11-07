package kr.co.myshop.ctrl;

import java.io.IOException;
import java.security.NoSuchAlgorithmException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.crypto.util.SHA256;


@WebServlet("/UpdateCustomCtrl")
public class UpdateCustomCtrl extends HttpServlet {
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
		response.setContentType("text/html; charset=UTF-8");
		
		String cusId = request.getParameter("cusId");
		String cus = request.getParameter("editCusPw");
		String cusPw = request.getParameter("cusPw");
		if(cus!=null || cus!=""){
			try {
				cusPw = SHA256.encrypt(cus);
			} catch (NoSuchAlgorithmException e) {
				e.printStackTrace();
			}
		}
		String cusName = request.getParameter("cusName");
		String address = request.getParameter("address");
		String address1 = request.getParameter("editAddress1");
		String address2 = request.getParameter("editAddress2");
		if(address!=null){
			address = address1 + " " + address2;
		}
		String tel = request.getParameter("custel");
		
		try {
			Class.forName(DRIVER);
			Connection con = DriverManager.getConnection(URL, USER, PASS);
			sql = "update custom set cuspw=?, cusName=?, address=?, custel=? where=cusid=?";
			PreparedStatement pstmt = con.prepareStatement(sql);
			pstmt.setString(1, cusPw);
			pstmt.setString(2, cusName);
			pstmt.setString(3, address);
			pstmt.setString(4, tel);
			pstmt.setString(5, cusId);
			cnt = pstmt.executeUpdate();
			
			if(cnt > 0) {
				response.sendRedirect(request.getContextPath()+"/index.jsp");
			} else {
				response.sendRedirect(request.getContextPath()+"/GetCustomInfoCtrl");
			}
			
			pstmt.close();
			con.close();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
