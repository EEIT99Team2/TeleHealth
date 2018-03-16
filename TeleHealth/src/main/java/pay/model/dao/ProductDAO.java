package pay.model.dao;

import java.sql.*;
import java.util.*;

import javax.naming.*;
import javax.sql.*;

import pay.model.*;

public class ProductDAO {
	
	private DataSource dataSource;
	
	public ProductDAO() {
		try {
			Context ctx = new InitialContext();
			dataSource = (DataSource) ctx.lookup("java:comp/env/jdbc/TeleHealthDB");
		} catch (NamingException e) {
			e.printStackTrace();
		}
	}

	private static final String SELECT_MAX = "SELECT MAX(MerchantTradeNo) FROM product";
	
	public String selectMax() {
		String result = null;
		try (Connection conn = dataSource.getConnection();
				PreparedStatement pstmt = conn.prepareStatement(SELECT_MAX);
				ResultSet rset = pstmt.executeQuery();) {
			while (rset.next()) {
				result = rset.getString(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
	}
	
	private static final String SELECT_BY_MerchantTradeNo = "SELECT * FROM product WHERE MerchantTradeNo=?";

	public ProductBean selectTradeNo(String MerchantTradeNo) {
		ProductBean result = null;
		ResultSet rset = null;
		try (Connection conn = dataSource.getConnection();
				PreparedStatement pstmt = conn.prepareStatement(SELECT_BY_MerchantTradeNo);) {
			pstmt.setString(1, MerchantTradeNo);
			rset = pstmt.executeQuery();
			if (rset.next()) {
				result = new ProductBean();
				result.setMerchantTradeNo(rset.getString(1));
				result.setMerchantTradeDate(rset.getString(2));
				result.setTotalAmount(rset.getString(3));
				result.setTradeDesc(rset.getString(4));
				result.setItemName(rset.getString(5));
				result.setRtnCode(rset.getInt(6));
				result.setTradeNo(rset.getString(7));
				result.setPaymentDate(rset.getString(8));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			if (rset != null) {
				try {
					rset.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
		}
		return result;
	}
	
	// !!!
	private static final String SELECT_BY_MEMBERID = "SELECT * FROM product WHERE memberId=? AND RtnCode=1";
	public ProductBean select(String memberId) {
		ProductBean result = null;
		ResultSet rset = null;
		try (Connection conn = dataSource.getConnection();
				PreparedStatement pstmt = conn.prepareStatement(SELECT_BY_MEMBERID);) {
			pstmt.setString(1, memberId);
			rset = pstmt.executeQuery();
			if (rset.next()) {
				result = new ProductBean();
				result.setMerchantTradeNo(rset.getString(1));
				result.setMerchantTradeDate(rset.getString(2));
				result.setTotalAmount(rset.getString(3));
				result.setTradeDesc(rset.getString(4));
				result.setItemName(rset.getString(5));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			if (rset != null) {
				try {
					rset.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
		}
		return result;
	}
	
	private static final String SELECT_ALL = "SELECT * FROM product";
	
	public List<ProductBean> select() {
		List<ProductBean> result = null;
		try (Connection conn = dataSource.getConnection();
				PreparedStatement pstmt = conn.prepareStatement(SELECT_ALL);
				ResultSet rset = pstmt.executeQuery();) {
			result = new ArrayList<ProductBean>();
			while (rset.next()) {
				ProductBean bean = new ProductBean();
				bean.setMerchantTradeNo(rset.getString(1));
				bean.setMerchantTradeDate(rset.getString(2));
				bean.setTotalAmount(rset.getString(3));
				bean.setTradeDesc(rset.getString(4));
				bean.setItemName(rset.getString(5));
				result.add(bean);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
	}
	
	private static final String INSERT = "INSERT INTO product VALUES(?, ?, ?, ?, ?, ?, ?, ?);";
	public ProductBean insert(ProductBean bean) {
		ProductBean result = null;
		if (bean != null) {
			try (Connection conn = dataSource.getConnection();
					PreparedStatement pstmt = conn.prepareStatement(INSERT);) {
				pstmt.setString(1, bean.getMerchantTradeNo());
				pstmt.setString(2, bean.getMerchantTradeDate());
				pstmt.setString(3, bean.getTotalAmount());
				pstmt.setString(4, bean.getTradeDesc());
				pstmt.setString(5, bean.getItemName());
				pstmt.setInt(6, bean.getRtnCode());
				pstmt.setString(7, bean.getTradeNo());
				pstmt.setString(8, bean.getPaymentDate());
				int i = pstmt.executeUpdate();
				if (i == 1) {
					result = bean;
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return result;
	}
	
	private static final String UPDATE = "UPDATE product SET RtnCode=?, Tradeno=?, PaymentDate=? WHERE MerchantTradeNo=?";
	
	public ProductBean update (int RtnCode, String TradeNo, String PaymentDate, String MerchantTradeNo) {
		ProductBean result = null;
		try (Connection conn = dataSource.getConnection();
				PreparedStatement pstmt = conn.prepareStatement(UPDATE);) {
			pstmt.setInt(1, RtnCode);
			pstmt.setString(2, PaymentDate);
			pstmt.setString(3, TradeNo);
			pstmt.setString(4, MerchantTradeNo);
			int i = pstmt.executeUpdate();
			if (i == 1) {
				result = this.selectTradeNo(MerchantTradeNo);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
	}
	
	private static final String DELETE = "DELETE FROM product WHERE MerchantTradeNo=?";
	
	public boolean delete (String MerchantTradeNo) {
		try (Connection conn = dataSource.getConnection();
				PreparedStatement pstmt = conn.prepareStatement(DELETE);) {
			pstmt.setString(1, MerchantTradeNo);
			int i = pstmt.executeUpdate();
			if (i == 1) {
				return true;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return false;
	}
}
