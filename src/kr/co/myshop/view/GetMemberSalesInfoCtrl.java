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
import javax.servlet.http.HttpSession;

import kr.co.myshop.vo.Sales;


@WebServlet("/GetMemberSalesInfoCtrl")
public class GetMemberSalesInfoCtrl extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private final static String DRIVER = "com.mysql.cj.jdbc.Driver";
	private final static String URL = "jdbc:mysql://localhost:3306/myshop?serverTimezone=Asia/Seoul";
	private final static String USER = "root";
	private final static String PASS = "a1234";
	String sql = "";


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		try {
			String sid = (String) session.getAttribute("sid");
			Class.forName(DRIVER);
			Connection con = DriverManager.getConnection(URL, USER, PASS);
			sql = "select * from sales where cusid=? order by saleno desc";
			PreparedStatement pstmt = con.prepareStatement(sql);
			pstmt.setString(1, sid);
			ResultSet rs = pstmt.executeQuery();
			
			List<Sales> salesList = new ArrayList<Sales>();
			while(rs.next()){
				Sales vo = new Sales();
				vo.setSaleNo(rs.getInt("saleno"));
				vo.setCusId(rs.getString("cusId"));
				vo.setProNo(rs.getString("prono"));
				vo.setAmount(rs.getInt("amount"));
				vo.setSaleDate(rs.getString("saledate"));
				vo.setParselNo(rs.getInt("parselno"));
				vo.setSalePayNo(rs.getInt("salepayno"));
				salesList.add(vo);
			}
			request.setAttribute("salesList", salesList);
			
			RequestDispatcher view = request.getRequestDispatcher("./sales/saleList.jsp");
			view.forward(request, response);
			
			rs.close();
			pstmt.close();
			con.close();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
