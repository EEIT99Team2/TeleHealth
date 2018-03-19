<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<style>
	#myTable thead {
		font-size: 18px;
	}
	#myTable tbody {
		font-size: 16px;
	}
</style>
      <!-- Records -->
          <div class="card mb-3">
            <div class="card-header">
              <i class="fa fa-table"></i> 交易紀錄</div>
            <div class="card-body">
              <div id="container" style="min-width: 310px; margin: 0 auto">
                <table id="myTable" class="table">
                	<thead>
                		<tr>
                			<th>消費編號</th>
                			<th>購買時間</th>
                			<th>金額</th>
                			<th>折扣</th>
                			<th>名稱</th>
                			<th>會員編號</th>
                		</tr>
                	</thead>
                	<tbody id="myBody"></tbody>
                </table>
              </div>
            </div>
          </div>
    </div>
    
<script type="text/javascript" src="https://cdn.datatables.net/v/bs4/dt-1.10.16/datatables.min.js"></script>
<script>
	$(document).ready( function (){
	    $('#myTable').DataTable({
			"ajax": "/TeleHealth/table.do",
			"columns": [
				{"data": "MerchantTradeNo"},
				{"data": "MerchantTradeDate"},
				{"data": "TotalAmount"},
				{"data": "TradeDesc"},
				{"data": "ItemName"},
				{"data": "memberId"}
	    	],
	    	"bProcessing": true,//顯示處理中的圖樣
	        "oLanguage": {
	            "sLengthMenu": " _MENU_ 筆/頁",
	            "sZeroRecords": "找不到符合的資料。",
	            "sInfo": "共 _MAX_ 筆",
	            "sSearch": "搜尋",
	            "sInfoFiltered": " - 找到 _TOTAL_ 筆 資料",
	            "sInfoEmpty": "共 0 頁",
	            "oPaginate": {
	                "sPrevious": "«",
	                "sNext": "»"
	            }
	        }
		});

	    $("#emptyForm").empty();
	    $.getJSON('/TeleHealth/table.do', function(data) {
	    	var container = $('<div class="container col-12"></div>')
	    	var cell1 = $('<div class="form-group row"><label class="control-label" for="MerchantTradeNo">MerchantTradeNo:</lable><input id="MTNo" type="text" readonly="readonly" value="' + data.MerchantTradeNo + '" /></div>');
			var cell2 = $('<div class="form-group has-success has-feedback row"><label class="control-label" for="MerchantTradeDate">MerchantTradeDate:</lable><input id="MTDate" type="text" readonly="readonly" value="' + data.MerchantTradeDate + '" /></div>');
			var cell3 = $('<div class="form-group has-success has-feedback row"><label class="control-label" for="TotalAmount">TotalAmount:</lable><input id="TA" type="text" readonly="readonly" value="' + data.TotalAmount + '" /></div>');
			var cell4 = $('<div class="form-group has-success has-feedback row"><label class="control-label" for="TradeDesc">TradeDesc:</lable><input id="TD" type="text" readonly="readonly" value="' + data.TradeDesc + '" /></div>');
			var cell5 = $('<div class="form-group has-success has-feedback row"><label class="control-label" for="ItemName">ItemName:</lable><input id="IN" type="text" readonly="readonly" value="' + data.ItemName + '" /></div>');
			var cell6 = $('<div class="form-group has-success has-feedback row"><label class="control-label" for="memberId">memberId:</lable><input id="mId" type="text" readonly="readonly" value="' + data.memberId + '" /></div>');
			$(container).append(cell1);
			$(container).append(cell2);
			$(container).append(cell3);
			$(container).append(cell4);
			$(container).append(cell5);
			$(container).append(cell6);
			$("#emptyForm").append(container);
	    })
	});
</script>    
