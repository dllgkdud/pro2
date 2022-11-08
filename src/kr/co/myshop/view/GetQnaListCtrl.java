package kr.co.myshop.view;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.co.myshop.vo.QnA;


@WebServlet("/GetQnaListCtrl")
public class GetQnaListCtrl extends HttpServlet {
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
		
		try {
			Class.forName(DRIVER);
			Connection con = DriverManager.getConnection(URL, USER, PASS);
			sql = "select * from qna order by parno asc, lev asc,no asc";
			PreparedStatement pstmt = con.prepareStatement(sql);
			ResultSet rs = pstmt.executeQuery();
			
			List<QnA> qnaList = new ArrayList<QnA>();
			while(rs.next()){
				QnA vo = new QnA();
				vo.setNo(rs.getInt("no"));
				vo.setTitle(rs.getString("title"));
				vo.setContent(rs.getString("content"));
				vo.setAuthor(rs.getString("author"));
				vo.setResDate(rs.getDate("resdate"));
				vo.setLev(rs.getInt("lev"));
				vo.setParno(rs.getInt("parno"));
				vo.setSecret(rs.getString("secret"));
				vo.setVisited(rs.getInt("visited"));
				qnaList.add(vo);
			}
			request.setAttribute("qnaList", qnaList);
			
			RequestDispatcher view = request.getRequestDispatcher("./qna/qnaList.jsp");
			view.forward(request, response);
			
			rs.close();
			pstmt.close();
			con.close();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
