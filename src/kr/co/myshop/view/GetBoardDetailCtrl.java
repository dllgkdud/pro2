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

import kr.co.myshop.vo.Notice;


@WebServlet("/GetBoardDetailCtrl")
public class GetBoardDetailCtrl extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static final String DRIVER = "com.mysql.cj.jdbc.Driver";
    private static final String URL = "jdbc:mysql://localhost:3306/myshop?serverTimezone=Asia/Seoul";
    private static final String USER = "root";
    private static final String PASS = "a1234";
    String sql = "";

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int notNo = Integer.parseInt(request.getParameter("notNo"));
		try {
			Class.forName(DRIVER);
			Connection con = DriverManager.getConnection(URL, USER, PASS);
			sql = "select * from notice where notno=?";
			//con.setAutoCommit(false);		//트랜잭션 처리 시 함께 처리할 수 있도록 오토커밋을 꺼야한다.
			PreparedStatement pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, notNo);
			ResultSet rs = pstmt.executeQuery();
			
			Notice vo = new Notice();
			if(rs.next()) {
				/*sql = "update notice set visited=visited+1 where notno=?";
				pstmt.setInt(1, notNo);
				pstmt.executeUpdate();
				con.commit();							//진행한 내용을 같이 성공수행하도록 수동으로 커밋 진행
				con.setAutoCommit(true);	//다음 sql을 실행하기 위해 오토커밋 설정*/
				
				vo.setNotNo(rs.getInt("notno"));
				vo.setTitle(rs.getString("title"));
				vo.setContent(rs.getString("content"));
				vo.setAuthor(rs.getString("author"));
				vo.setResDate(rs.getString("resdate"));
			}
			request.setAttribute("notice", vo);
			
			//notice/boardDetail.jsp에 포워딩
			RequestDispatcher view = request.getRequestDispatcher("./notice/boardDetail.jsp");
			view.forward(request, response);
			
			rs.close();
			pstmt.close();
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
