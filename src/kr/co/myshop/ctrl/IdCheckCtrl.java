package kr.co.myshop.ctrl;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/IdCheckCtrl")
public class IdCheckCtrl extends HttpServlet {
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
		
		try {
			Class.forName(DRIVER);
			sql = "select * from custom where cusId=?";
			Connection con = DriverManager.getConnection(URL, USER, PASS);
			PreparedStatement pstmt = con.prepareStatement(sql);
			pstmt.setString(1, cusId);
			ResultSet rs = pstmt.executeQuery();
			
			//아이디 중복체크창
			PrintWriter out = response.getWriter();
			String script = "<script>";
			script = script + "function apply(sid) {";
			script = script + "opener.document.frm.cusId.value = sid;";
			script = script + "opener.document.frm.idCk.value = 'yes';";
			script = script + "window.close()";
			script = script + "}</script>";
			out.println(script);
			
			if(rs.next()){
				out.println("<h3>해당 아이디는 이미 존재합니다.</h3>");
				out.println("<button onclick='javascript:window.close()'>닫기</button>");
			} else {
				out.println("<h3>사용 가능한 아이디입니다.</h3>");
				out.println("<a href='javascript:apply(\""+cusId+"\")'>"+cusId+"[저장]</a>");
				out.println("<p>입력하신 아이디를 적용합니다.</p>");
			}
			
			rs.close();
			pstmt.close();
			con.close();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
