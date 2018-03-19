package pay.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import pay.model.ProductBean;
import pay.model.ProductService;
import register.model.dao.MemberDAOJdbc;

@WebServlet("/result.do")
public class ResultServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private ProductService productService = null;

	private MemberDAOJdbc memberDAO = null;
	
	@Override
	public void init() throws ServletException {
		productService = new ProductService();
		memberDAO = new MemberDAOJdbc();
	}
	
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// Set response content type
	    response.setContentType("text/html");
	    PrintWriter out = response.getWriter();

	    List<String> enErrors = new ArrayList<String>();
	    
		try {
			String MerchantTradeNo = request.getParameter("MerchantTradeNo");
			String temp1 = request.getParameter("RtnCode"); // RtnCode
			String TradeNo = request.getParameter("TradeNo");
			String PaymentDate = request.getParameter("PaymentDate");
			
			int RtnCode = 0;
			if (temp1 != null && temp1.length() != 0) {
				try {
					RtnCode = Integer.parseInt(temp1);
				} catch (NumberFormatException e) {
					e.printStackTrace();
					enErrors.add("RtnCode Error");
				}
			}
			
			if (RtnCode == 1) {
				ProductBean bean = new ProductBean();
				bean.setMerchantTradeNo(MerchantTradeNo);
				bean.setRtnCode(RtnCode);
				bean.setTradeNo(TradeNo);
				bean.setPaymentDate(PaymentDate);
				productService.update(bean);
				ProductBean product = productService.selectByTradeNo(bean.getTradeNo());
				String item = product.getItemName();
				String pointString = item.substring(0, item.indexOf("點"));
				Integer point = Integer.parseInt(pointString);
				String memberId = product.getMemberId();
				memberDAO.updatePoint(point, memberId);
			} else {
				System.out.println("false");
			}
		} catch (Exception e) {
			enErrors.add(e.getMessage());
		} finally {
			if (enErrors.size() == 0) {
	            out.println("1|OK");
			} else {
				out.println("0|" + enErrors);
			}
	    }
	}

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		this.doPost(request, response);
	}
}
