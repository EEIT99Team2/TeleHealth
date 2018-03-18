/*
作者：hsu po-wei
E-Mail：hpw925@hotmail.com
授權：GPL 3
*/

(function($){
		  
	$.fn.tablepage = function(oObj, dCountOfPage) {

		var dPageIndex = 1;
		var dNowIndex = 1;
		var sPageStr = "";
		var dCount = 0;
		var oSource = $(this);
		var sNoSelColor = "#AAAAAA";
		var sSelColor = "#EE7700";
		var sFontColor = "white";

 		change_page_content();

		function change_page_content()
		{
			//取得資料筆數
			dCount = oSource.children().children().length - 1;

			//顯示頁碼
			sPageStr = "<table><tr><td style='height:30px;'><p style='color:#FFAA33;font-size:20px'>第</p></td>";
			
			dPageIndex = 1;
			
			for (var i = 1; i <= dCount; i += dCountOfPage)
			{
				if (dNowIndex == dPageIndex)
				{
					sPageStr += "<td valign='top'><table id='page' style='font-size:20px;width:30px;height:30px;cursor:pointer;color:" + sFontColor + ";border-collapse:collapse;border-style:solid;border-width:1px;border-color:" + sSelColor + ";background-color:" + sSelColor + "'><tr><th>" + (dPageIndex++) + "</th></tr></table></td>";
				}
				else
				{
					sPageStr += "<td valign='top'><table id='page' style='font-size:20px;width:30px;height:30px;cursor:pointer;color:" + sFontColor + ";border-collapse:collapse;border-style:solid;border-width:1px;border-color:" + sNoSelColor + ";background-color:" + sNoSelColor + "'><tr><th>" + (dPageIndex++) + "</th></tr></table></td>";
				}
			}
			
			sPageStr += "<td><p style='font-size:20px;color:#FFAA33'>頁</p></td></tr></table>";
			
			oObj.html(sPageStr);
			
			dPageIndex = 1;
			
			//過濾表格內容
			oSource.children().children("tr").each( function () {
			
				if (dPageIndex <= (((dNowIndex - 1) * dCountOfPage) + 1) || dPageIndex > ((dNowIndex * dCountOfPage) + 1))
				{
					$(this).hide();
				}
				else
				{
					$(this).show();	
				}
				
				dPageIndex++;
			});
			
			oSource.children().children("tr").first().show(); //head一定要顯示
						
			//加入換頁事件
			oObj.children().children().children().children().each( function () {
		
				$(this).click( function () {
				
					dNowIndex = $(this).find("tr").text();
					$('html, body').scrollTop(0);
					if (dNowIndex > 0)
					{
						change_page_content();
						$('html, body').scrollTop(0);
					}
				});
			});
		}
	};
})(jQuery);


