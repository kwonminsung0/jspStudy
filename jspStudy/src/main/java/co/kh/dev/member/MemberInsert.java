package co.kh.dev.member;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "memberInsert", urlPatterns = { "/memberInsert" })
public class MemberInsert extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public MemberInsert() {
        super();
        System.out.println("생성자 작동");
    }

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("서비스 작동");
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("포스트 작동");
		request.setCharacterEncoding("UTF-8");
		String name = request.getParameter("name");
		String id = request.getParameter("id");
		String pass = request.getParameter("pw");
		
		Connection con = null;
		PreparedStatement pstmt = null;
		boolean successFlag = false;
		String url = "jdbc:oracle:thin:@127.0.0.1:1521/xe";
		String JOIN_INSERT = "INSERT INTO join VALUES(join_seq.NEXTVAL, ?, ?, ?)";
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			con = DriverManager.getConnection(url, "webuser", "123456");
			pstmt = con.prepareStatement(JOIN_INSERT);
			pstmt.setString(1, name);
			pstmt.setString(2, id);
			pstmt.setString(3, pass);
			int count = pstmt.executeUpdate();
			successFlag = (count != 0) ? (true) : (false);
		} catch (ClassNotFoundException e) {
			System.out.println(e.toString());
		} catch (SQLException e) {
			System.out.println(e.toString());
		} finally {
			if (con != null) {
				try {
					con.close();
				} catch(SQLException e) {
					System.out.println(e.toString());
				}
			}
			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException e) {
					System.out.println(e.toString());
				}
			}
		}
		if (successFlag == true) {
			System.out.println("입력성공");
			response.sendRedirect("/jspStudy/memberList");
		} else {
			System.out.println("입력실패");
		}
	}

}
