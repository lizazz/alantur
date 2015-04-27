<!DOCTYPE HTML>
<html lang="en-US">
<head>
    <title>clear <?=$res['version']?></title>
    <meta charset="UTF-8">
    <link href="/assets/site/bootstrap3/css/bootstrap.min.css" rel="stylesheet">
    <link href="/assets/site/bootstrap3/css/bootstrap-theme.min.css" rel="stylesheet">
	<link href="/assets/modules/report/css/style.css" rel="stylesheet">
    <script src="/assets/site/jquery-2.1.1.min.js"></script>
    <script src="/assets/site/bootstrap3/js/bootstrap.min.js"></script>
    <script src="/assets/site/ajaxupload.js"></script>
    <script src="/assets/modules/sale/js/main.js"></script>
    <script type="text/javascript">
        $(document).ready(function(){
			       var baseUrl="index.php?a=112&id=4&get=";
             $("[data-active]").each(function(){
                _option = $(this).find("option[value='"+$(this).attr("data-active")+"']");
                _option.prop("selected", true);
             });

             /* Изменение статуса заказа             */
             $("[data-status]").on("change", function(){
              var _this = $(this);
              $.ajax({
                type: "POST",
                url: baseUrl+"sendtour",
                data: "tour="+_this.attr("data-status")+"&status="+_this.val(), 
                success: function(result){},
                error:function(){ 
                  alert("проблемы с отправкой аякс запроса для отсылки письма");
                }
              })
            })

           /*   $(".adm-tour").on("change", function(e){
                 //console.log(e);
                 alert("boom");
                  e.preventDefault();
                  $(this).parents("div").wrap("<form method='POST' action='"+baseUrl+"sendtour' enctype='multipart/form-data' />");//find("input, select")
                  $(this).parents("form").submit();
            });*/


			       $(".update").on("click", function(e){
			           //console.log(e);
                  e.preventDefault();
                  $(this).parents("div").wrap("<form method='POST' action='"+baseUrl+"update' enctype='multipart/form-data' />");//find("input, select")
                  $(this).parents("form").submit();
            });
			
			       $(".save").on("click", function(e){
			           /*console.log("Hello");*/
                  e.preventDefault();
                  $(this).parents("div").wrap("<form method='POST' action='"+baseUrl+"save' enctype='multipart/form-data'/>");//find("input, select")
                  $(this).parents("form").submit();
			       });

			  
			       $(".searchbutton").on("click", function(e){
			           //console.log("search");
                  e.preventDefault();
                  $(this).parents("div").wrap("<form method='POST' action='"+baseUrl+"search'/>");//find("Search")
                  $(this).parents("form").submit();
              });


             $(".del-foto-adm").on("click", function(e){
                 console.log("Delete image");
                  e.preventDefault();
                  $(this).parents("div").wrap("<form method='POST' action='"+baseUrl+"DeleteImage'/>");//find("DeleteImage")
                  $(this).parents("form").submit();
              });

             $('#myTab a').click(function (e) {
 				 e.preventDefault()
  					$(this).tab('show')
			});
        });
		
    </script>
</head>
<body>

  <div class="navbar navbar-inverse navbar-fixed-top" role="navigation">
      <div class="collapse navbar-collapse">
        <div class="clearfix"></div>
      </div>
  </div> 
  <div class="container">
    <? if (isset($res['alert'])): ?>
      <div class="alert alert-success fade in">
        <button type="button" class="close" data-dismiss="alert">×</button>
        <strong><?=$res['alert']?></strong>
      </div>
    <? endif ?>
    <?=$res['content']?>
  </div>
</body>
</html>