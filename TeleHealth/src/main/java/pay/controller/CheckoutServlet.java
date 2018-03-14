package pay.controller;

import java.io.*;
import java.text.*;
import java.util.*;

import javax.servlet.*;
import javax.servlet.annotation.*;
import javax.servlet.http.*;

import pay.model.*;

@WebServlet("/checkout.do")
public class CheckoutServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private ProductService productService = null;
	private SimpleDateFormat sdfNo = null;
	private SimpleDateFormat sdfDate = null;

	@Override
	public void init() throws ServletException {
		productService = new ProductService();
		sdfNo = new SimpleDateFormat("yyyyMMddHHmmss");
		sdfDate = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 接收資料
		String temp1 = request.getParameter("quantity");
		String checkout = request.getParameter("Checkout");
		
		// 轉換資料
		Map<String, String> errors = new HashMap<>();
		request.setAttribute("errors", errors);

		int qty = 0;
		if (temp1 != null && temp1.length() != 0) {
			try {
				qty = Integer.parseInt(temp1);
				if (qty == 0) {
					errors.put("custom1", "數量不可為零");
				}
			} catch (NumberFormatException e) {
				e.printStackTrace();
				errors.put("custom2", "此欄必須是整數");
			}
		}
		
		// 驗證資料
		if ("Checkout".equals(checkout)) {
			if (temp1 == null || temp1.length() == 0) {
				errors.put("custom3", "請輸入數量以便結帳");
			}
		}
		
		if (errors != null && !errors.isEmpty()) {
			request.getRequestDispatcher("/pay/pay.jsp").forward(request, response);
			return;
		}
		
		// 呼叫model
		ProductBean bean = new ProductBean();
		bean.setMerchantTradeNo("TH" + sdfNo.format(new java.util.Date()));
		bean.setMerchantTradeDate(sdfDate.format(new java.util.Date()));
		bean.setItemName(temp1);
		
		// 根據model執行結果呼叫view元件
		ProductBean result = productService.insert(bean);
		ECPayService ecPay = new ECPayService();
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		out.print(ecPay.AioALL());
		return;
	}
	
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}
}
