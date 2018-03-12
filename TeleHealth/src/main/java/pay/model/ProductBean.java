package pay.model;

public class ProductBean {
	private String MerchantTradeNo;
	private String MerchantTradeDate;
	private String TotalAmount;
	private String TradeDesc;
	private String ItemName;
	private int RtnCode;
	private String TradeNo;
	private String PaymentDate;

	@Override
	public String toString() {
		return "ProductBean [MerchantTradeNo=" + MerchantTradeNo + ", MerchantTradeDate=" + MerchantTradeDate
				+ ", TotalAmount=" + TotalAmount + ", TradeDesc=" + TradeDesc + ", ItemName=" + ItemName + ", RtnCode="
				+ RtnCode + ", TradeNo=" + TradeNo + ", PaymentDate=" + PaymentDate + "]";
	}

	public String getMerchantTradeNo() {
		return MerchantTradeNo;
	}

	public void setMerchantTradeNo(String merchantTradeNo) {
		MerchantTradeNo = merchantTradeNo;
	}

	public String getMerchantTradeDate() {
		return MerchantTradeDate;
	}

	public void setMerchantTradeDate(String merchantTradeDate) {
		MerchantTradeDate = merchantTradeDate;
	}

	public String getTotalAmount() {
		return TotalAmount;
	}

	public void setTotalAmount(String totalAmount) {
		TotalAmount = totalAmount;
	}

	public String getTradeDesc() {
		return TradeDesc;
	}

	public void setTradeDesc(String tradeDesc) {
		TradeDesc = tradeDesc;
	}

	public String getItemName() {
		return ItemName;
	}

	public void setItemName(String itemName) {
		ItemName = itemName;
	}

	public int getRtnCode() {
		return RtnCode;
	}

	public void setRtnCode(int rtnCode) {
		RtnCode = rtnCode;
	}

	public String getTradeNo() {
		return TradeNo;
	}

	public void setTradeNo(String tradeNo) {
		TradeNo = tradeNo;
	}

	public String getPaymentDate() {
		return PaymentDate;
	}

	public void setPaymentDate(String paymentDate) {
		PaymentDate = paymentDate;
	}
	
}
