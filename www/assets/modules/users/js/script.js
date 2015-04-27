 $(document).ready(function() {
	var baseUrl="index.php?a=112&id=5&get=";

    //catch changing of field of balance and send to "changebalance case" in module "user" 
	$("[data-balance]").on("change", function() { 
	  	var _this = $(this);
	  	$.ajax({
                type: "POST",
                url: baseUrl+"changebalance",
                data: "user="+_this.attr("data-balance")+"&balance="+_this.val(), 
                success: function(result){
                    location.reload(); 
                },
                error:function(){ 
                  alert("проблемы с отправкой аякс запроса для изменения баланса");
                }
        })
	  //	alert(_this.val());
	})
 })