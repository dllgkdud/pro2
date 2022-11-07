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

import kr.co.myshop.vo.Custom;


@WebServlet("/GetCustomListCtrl")
public class GetCustomListCtrl extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private final static String DRIVER = "com.mysql.cj.jdbc.Driver";
	private final static String URL = "jdbc:mysql://localhost:3306/myshop?serverTimezone=Asia/Seoul";
	private final static String USER = "root";
	private final static String PASS = "a1234";
	String sql = "";      

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			Class.forName(DRIVER);
			Connection con = DriverManager.getConnection(URL, USER, PASS);
			sql = "select * from custom order by regdate desc";
			PreparedStatement pstmt = con.prepareStatement(sql);
			ResultSet rs = pstmt.executeQuery();
			
			//데이터베이스에서 받은 결과를 리스트로 저장
			List<Custom> cusList = new ArrayList<Custom>();
			while(rs.next()){
				Custom vo = new Custom();
				vo.setCusId(rs.getString("cusid"));
				vo.setCusPw(rs.getString("cuspw"));
				vo.setCusName(rs.getString("cusname"));
				vo.setAddress(rs.getString("address"));
				vo.setTel(rs.getString("custel"));
				vo.setRegDate(rs.getString("regdate"));
				vo.setPoint(rs.getInt("point"));
				vo.setVisited(rs.getInt("visited"));
				cusList.add(vo);
			}
			request.setAttribute("cusList", cusList);
			
			//포워딩
			RequestDispatcher view = request.getRequestDispatcher("./admin/customList/jsp");
			view.forward(request, response);
			
			rs.close();
			pstmt.close();
			con.close();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
