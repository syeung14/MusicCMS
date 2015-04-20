window.request = {
	req_init : function(){
		$("#requesttime").datepicker({
			dateFormat: 'yy-mm-dd',
			numberOfMonths: 1,
			showButtonPanel: true,
			clickInput:true
        });
		$('#requestdatetime').ptTimeSelect();
		var req_d = new Date();
		var gmtHours = req_d.getTimezoneOffset()/60;
		$("#gap").val(gmtHours);
	},
	req_initOwner : function(){
		$('#request_selectPro').html('');
		$("#request_selectPro").append("<option value='-1'>Please select To</option>");
		var url = "ListUserServlet";
		$.ajax({
			type: "POST",
			url: url,
			data: "operation=getAllOwners",
			dataType:'json',
			success: function(rtnData) {
				$.each(rtnData,function(index,item){
					$("#request_selectPro").append("<option value='" + item.userEmail + "'>"+ item.userEmail +"</option>");
				});
			}
		});
	},
};
//this js should be put at the last in order to load jquery and other data first
request.req_init();
request.req_initOwner();