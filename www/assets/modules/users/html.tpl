<!DOCTYPE HTML>
<html lang="en-US">
<head>
  <title>clear <?=$res['version']?></title>
  <meta charset="UTF-8">
  <link href="/assets/site/bootstrap3/css/bootstrap.min.css" rel="stylesheet">
  <link href="/assets/site/bootstrap3/css/bootstrap-theme.min.css" rel="stylesheet">
	<link href="/assets/modules/report/css/style.css" rel="stylesheet">
  <link href="/assets/site/bootstrap3/css/variables.less" rel="stylesheet">
  <link href="/assets/site/bootstrap3/css/bootstrap-datetimepicker-build.less" rel="stylesheet">
    <!--<link href="/assets/site/bootstrap3/css/bootstrap-datetimepicker.min.css" rel="stylesheet" />-->
  <link href="//cdn.rawgit.com/Eonasdan/bootstrap-datetimepicker/d004434a5ff76e7b97c8b07c01f34ca69e635d97/build/css/bootstrap-datetimepicker.css" rel="stylesheet" />
    <!--<script src="/assets/site/jquery-2.1.1.min.js"></script>-->
  <script src="//code.jquery.com/jquery-2.1.1.min.js"></script>
   <!-- <script src="/assets/modules/users/js/moment-with-locales.js"></script>-->
  <script src="//cdnjs.cloudflare.com/ajax/libs/moment.js/2.9.0/moment-with-locales.js"></script>
  <script src="/assets/site/bootstrap3/js/transition.js"></script>
  <script src="/assets/site/bootstrap3/js/collapse.js"></script>
   <!-- <script src="/assets/site/bootstrap3/js/bootstrap.min.js"></script>-->
  <script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.1/js/bootstrap.min.js"></script>
  <script src="/assets/site/ajaxupload.js"></script>
  <script src="/assets/modules/users/js/script.js"></script>
   <!--  <script src="/assets/site/bootstrap3/dist/bootstrap-datepicker.js"></script>-->
  <script src="//cdn.rawgit.com/Eonasdan/bootstrap-datetimepicker/d004434a5ff76e7b97c8b07c01f34ca69e635d97/src/js/bootstrap-datetimepicker.js"></script>
  <script type="text/javascript">
        $(document).ready(function(){
			       var baseUrl="index.php?a=112&id=5&get=";
             $("[data-active]").each(function(){
                _option = $(this).find("option[value='"+$(this).attr("data-active")+"']");
                _option.prop("selected", true);
             });

             $(function () {
                  $('#datetimepicker6').datetimepicker({format: 'YYYY-MM-DD HH:mm:ss'});
                  $('#datetimepicker7').datetimepicker({format: 'YYYY-MM-DD HH:mm:ss'});
                  $("#datetimepicker6").on("dp.change", function (e) {
                      $('#datetimepicker7').data("DateTimePicker").minDate(e.date);
                  });
                  $("#datetimepicker7").on("dp.change", function (e) {
                      $('#datetimepicker6').data("DateTimePicker").maxDate(e.date);
                  });
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
      <div class="navbar-header pull-right">
        <a class="navbar-brand" href="<?=$url?>">Back to main page</a>
      </div>
      <div class="collapse navbar-collapse">
        <ul class="nav navbar-nav">
          <li<?=$get == "add" ? ' class="active"' : '' ?>>
            <a href="<?=$url?>&get=add">
              <span class="icon icon-map-marker"></span>
               Add new user
            </a>
          </li>
        </ul>
        <div class="clearfix"></div>
      </div>
  </div> 
  <div class="container">
    <?=$res['content']?>
  </div>
</body>
</html>