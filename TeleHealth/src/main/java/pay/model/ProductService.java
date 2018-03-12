package pay.model;

import pay.model.dao.*;

public class ProductService {
	
	ProductDAO productDao = new ProductDAO();
	
	public ProductBean insert(ProductBean bean) {
		ProductBean result = null;
		if (bean != null) {
			
			String temp1 = bean.getItemName();
			int qty = 0;
			if (temp1 != null && temp1.length() != 0) {
				try {
					qty = Integer.parseInt(temp1);
				} catch (NumberFormatException e) {
					e.printStackTrace();
				}
			}
			int total = 0;
			int price = 0;
			if (qty >= 20) {
				total = qty + qty / 20 * 2;
				price = total * 50;
			} else {
				price = qty * 50;
			}
			bean.setTotalAmount(String.valueOf(price));
			if (qty >= 20) {
				bean.setTradeDesc("bouns");
			} else {
				bean.setTradeDesc("deal");
			}
			if (qty >= 20) {
				bean.setItemName(total + "點");
			} else {
				bean.setItemName(qty + "點");
			}
			bean.setRtnCode(0);
			result = productDao.insert(bean);
		}
		return result;
	}
	
	
	public ProductBean update (ProductBean bean) {
		ProductBean result = null;
		if (bean != null) {
			result = productDao.update(bean.getRtnCode(), bean.getTradeNo(), bean.getPaymentDate(), bean.getMerchantTradeNo());
		}
		return result;
	}
}
