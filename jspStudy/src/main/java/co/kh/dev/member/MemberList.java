package co.kh.dev.member;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "memberList", urlPatterns = { "/memberList" })
public class MemberList extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public MemberList() {
        super();
    }

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Connection con = null;
		String JOIN_SELECT = "SELECT * FROM JOIN ORDER BY NO DESC";
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "webuser", "123456");
			pstmt = con.prepareStatement(JOIN_SELECT);
			rs = pstmt.executeQuery();
			response.setContentType("text/html;charset=UTF-8");
			PrintWriter out = response.getWriter();
			
			out.println("<html>");
			out.println("<head><title>회원가입 리스트</title></head>");
			out.println("<body>");
			out.println("<table align=center width=500 border=1>");
			while (rs.next()) {
				int no = rs.getInt("no");
				String name = rs.getString("name");
				String id = rs.getString("id");
				String pass = rs.getString("pw");
				out.println("<tr>");
				out.println("<th width=50>번호</th>");
				out.println("<td width=50 align=center>" + no + "</td>");
				out.println("<th width=70>이름</th>");
				out.println("<td width=180 align=center>" + name + "</td>");
				out.println("<th width=70>아이디</th>");
				out.println("<td width=180 align=center>" + id + "</td>");
				out.println("<th width=70>비밀번호</th>");
				out.println("<td width=180 align=center>" + pass + "</td>");
				out.println("</tr>");
			}
			out.println("</table>");
			out.println("<p>");
			out.println("<p align=center><a href=/jspStudy/member/join.html>회원가입</a></p>");
			out.println("</body>");
			out.println("</html>");
		} catch (ClassNotFoundException e) {
			System.out.println(e.toString());
		} catch (SQLException e) {
			System.out.println(e.toString());
		} finally {
			if (con != null) {
				try {
					con.close();
				} catch (SQLException e) {
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
			if (rs != null) {
				try {
					rs.close();
				} catch (SQLException e) {
					System.out.println(e.toString());
				}
			}
		}
	}
}
