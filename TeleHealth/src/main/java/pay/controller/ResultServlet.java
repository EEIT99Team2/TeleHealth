package pay.controller;

import java.io.*;
import java.util.*;

import javax.servlet.*;
import javax.servlet.annotation.*;
import javax.servlet.http.*;

import ecpay.payment.integration.*;
import pay.model.ProductBean;
import pay.model.ProductService;

@WebServlet("/result.do")
public class ResultServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private ProductService productService = null;

	@Override
	public void init() throws ServletException {
		productService = new ProductService();
	}
	
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		List<String> errors = new ArrayList<String>();
		Map<String, String> msg = new HashMap<>();
		request.setAttribute("msg", msg);

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
					errors.add("RtnCode Error");
				}
			}
			
			if (RtnCode == 1) {
				ProductBean bean = new ProductBean();
				bean.setMerchantTradeNo(MerchantTradeNo);
				bean.setRtnCode(RtnCode);
				bean.setTradeNo(TradeNo);
				bean.setPaymentDate(PaymentDate);
				ProductBean result = productService.update(bean);
			} else {
			}
		} catch (Exception e) {
			errors.add(e.getMessage());
		}
	}

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		this.doPost(request, response);
	}
}
