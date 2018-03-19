package pay.model;

import ecpay.payment.integration.*;
import ecpay.payment.integration.domain.*;
import pay.model.dao.*;

public class ECPayService {
	private AllInOne all;
	private ProductDAO productDao = new ProductDAO();
	
	public void initial(){
		//此步驟為透過AllInOne建構子來實體化此類別，順便輸入log4j.properties的位置路徑
		//若不需要產生log檔，可直接在log4j.properties更改設定，或是將此步驟所輸入的字串改為""
		all = new AllInOne("");
	}
	
	public String AioALL(ProductBean bean){
		initial();
		//實體化出所需要的domain物件
		AioCheckOutOneTime aio = new AioCheckOutOneTime();
		if(bean != null && bean.getMerchantTradeNo() != null) {
	//		String teleHL = productDao.selectMax();
	//		ProductBean bean = productDao.selectTradeNo(teleHL);
			//合作特店後台自行產生不重複的流水號，或是UUID隨機產生不重複的廠商交易編號(記得把'-'濾掉，僅接受英文字與數字)
			aio.setMerchantTradeNo(bean.getMerchantTradeNo());
			//合作特店後台填入會員交易時間(不一定是當下，依據需求自行判斷填入)
			aio.setMerchantTradeDate(bean.getMerchantTradeDate());
	
			//建議從後端DB撈取資料填入，勿從前端輸入以免遭竄改
			aio.setTotalAmount(bean.getTotalAmount());
			aio.setTradeDesc(bean.getTradeDesc());
			aio.setItemName(bean.getItemName());
			aio.setClientBackURL("http://tzeing.asuscomm.com/TeleHealth/pay/paySuccess.jsp");
			aio.setReturnURL("https://tzeing.asuscomm.com/TeleHealth/result.do");
		}
		//呼叫AllInOne中相應的method，產生html form字串(含JavaScript Submit)之後再放入前端即可
		//此筆交易模擬不開發票，InvoiceObj請帶null
		String html = all.aioCheckOut(aio, null);
		return html;
	}
}
