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

import kr.co.myshop.vo.Product;


@WebServlet("/CartToSaleCtrl")
public class CartToSaleCtrl extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private final static String DRIVER = "com.mysql.cj.jdbc.Driver";
	private final static String URL = "jdbc:mysql://localhost:3306/myshop?serverTimezone=Asia/Seoul";
	private final static String USER = "root";
	private final static String PASS = "a1234";
	String sql = "";

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int proNo = Integer.parseInt(request.getParameter("proNo"));
		int cartNo = Integer.parseInt(request.getParameter("cartNo"));
		
		try {
			Class.forName(DRIVER);
			Connection con = DriverManager.getConnection(URL, USER, PASS);
			sql = "select a.prono, a.cateno, a.proname, a.prospec, a.oriprice, a.discountrate, a.propic, a.propic2, b.amount";
			sql = sql + "from product a right join wearing b on a.prono=b.prono ";
			sql = sql + "where a.prono in (select b.prono from wearing) and a.prono=?";
			PreparedStatement pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, proNo);
			ResultSet rs = pstmt.executeQuery();
			
			Product vo = new Product();
			if(rs.next()){
				vo.setProNo(rs.getInt("prono"));
				vo.setCateNo(rs.getInt("cateno"));
				vo.setProName(rs.getString("proname"));
				vo.setProSpec(rs.getString("prospec"));
				vo.setCost(rs.getInt("cost"));
				vo.setDiscountRate(rs.getDouble("discountrate"));
				vo.setProPic(rs.getString("propic"));
				vo.setProPic2(rs.getString("propic2"));
				vo.setAmount(rs.getInt("amount"));
			}
			request.setAttribute("pro", vo);
			request.setAttribute("cartNo", cartNo);
			
			RequestDispatcher view = request.getRequestDispatcher("./cart/cartToSale.jsp");
			view.forward(request, response);
			
			rs.close();
			pstmt.close();
			con.close();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
