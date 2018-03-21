package pay.model;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.LinkedList;
import java.util.List;

import com.google.gson.Gson;

import pay.model.dao.ProductDAO;

public class ProductService {

	ProductDAO productDao = new ProductDAO();
	
	private String MerchantTradeNo = "MerchantTradeNo";
	private String MerchantTradeDate = "MerchantTradeDate";
	private String TotalAmount = "TotalAmount";
	private String TradeDesc = "TradeDesc";
	private String ItemName = "ItemName";
	private String memberId = "memberId";

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

	public ProductBean update(ProductBean bean) {
		ProductBean result = null;
		if (bean != null) {
			result = productDao.update(bean.getRtnCode(), bean.getTradeNo(), bean.getPaymentDate(),
					bean.getMerchantTradeNo());
		}
		return result;
	}

	public String select1() {
		List<ProductBean> temp = productDao.select();
		List<Integer> result = new ArrayList<Integer>();
		
		int jan = 0;
		int feb = 0;
		int mar = 0;
		int apr = 0;
		int may = 0;
		int jun = 0;
		int jul = 0;
		int aug = 0;
		int sep = 0;
		int oct = 0;
		int nov = 0;
		int dec = 0;
		
		for (int i = 0; i < temp.size(); i++) {
			String month = temp.get(i).getMerchantTradeDate().substring(5, 7);
			String temp1 = temp.get(i).getTotalAmount();
			int price = 0;
			if (temp1 != null && temp1.length() != 0) {
				try {
					price = Integer.parseInt(temp1);
				} catch (NumberFormatException e) {
					e.printStackTrace();
				}
			}
			switch (month) {
			case "01":
				jan = jan + price;
				break;
			case "02":
				feb = feb + price;
				break;
			case "03":
				mar = mar + price;
				break;
			case "04":
				apr = apr + price;
				break;
			case "05":
				may = may + price;
				break;
			case "06":
				jun = jun + price;
				break;
			case "07":
				jul = jul + price;
				break;
			case "08":
				aug = aug + price;
				break;
			case "09":
				sep = sep + price;
				break;
			case "10":
				oct = oct + price;
				break;
			case "11":
				nov = nov + price;
				break;
			case "12":
				dec = dec + price;
				break;
			}
		}
		result.add(jan);
		result.add(feb);
		result.add(mar);
		result.add(apr);
		result.add(may);
		result.add(jun);
		result.add(jul);
		result.add(aug);
		result.add(sep);
		result.add(oct);
		result.add(nov);
		result.add(dec);
		String data = new Gson().toJson(result);
		return data;
	}
	
	public String selectOne() {
		List<ProductBean> result = productDao.select();
		LinkedList<HashMap<String,String>> beans = new LinkedList<HashMap<String,String>>();
		Iterator iterators = result.iterator();
		while (iterators.hasNext()) {
			HashMap<String, String> bean = new HashMap<String, String>();
			ProductBean temp = (ProductBean)(iterators.next());
			bean.put(MerchantTradeNo, temp.getMerchantTradeNo());
			bean.put(MerchantTradeDate, temp.getMerchantTradeDate());
			bean.put(TotalAmount, temp.getTotalAmount());
			bean.put(TradeDesc, temp.getTradeDesc());
			bean.put(ItemName, temp.getItemName());
			bean.put(memberId, temp.getMemberId());
			beans.add(bean);
		}
		HashMap<String,LinkedList<HashMap<String,String>>> datas = new HashMap<String,LinkedList<HashMap<String,String>>>();
		datas.put("data", beans);
		String data = new Gson().toJson(datas);
		return data;
	}
	
	public ProductBean selectByTradeNo(String MerchantTradeNo) {
		return productDao.selectTradeNo(MerchantTradeNo);
	}
}
