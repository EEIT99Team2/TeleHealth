package register.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import pay.model.ProductBean;

public class MemberDAOJdbc {
	private DataSource dataSource;
	
	public MemberDAOJdbc() {
		try {
			Context ctx = new InitialContext();
			dataSource = (DataSource) ctx.lookup("java:comp/env/jdbc/TeleHealthDB");
		} catch (NamingException e) {
			e.printStackTrace();
		}
	}
	private static final String updateSql = "update members set point = ? where memberId = ?";
	public int updatePoint(Integer point, String memberId) {
		int result = 0;
		try (Connection conn = dataSource.getConnection();
				PreparedStatement pstmt = conn.prepareStatement(updateSql);) {
			Integer oldPoint = this.selectMemberPoint(memberId);
			pstmt.setInt(1, (point + oldPoint));
			pstmt.setString(2, memberId);
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
	}
	
	private static final String selectSql = "select point from members where memberId = ?";
	public Integer selectMemberPoint(String memberId) {
		Integer point = 0;
		try (Connection conn = dataSource.getConnection();
				PreparedStatement pstmt = conn.prepareStatement(selectSql);) {
			pstmt.setString(1, memberId);
			ResultSet result = pstmt.executeQuery();
			while(result.next()) {
				point = result.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return point;
	}
	
	
}
