<!DOCTYPE HTML>
<html lang="en-US">
<head>
    <title>clear <?=$res['version']?></title>
    <meta charset="UTF-8">
    <link href="/assets/site/bootstrap3/css/bootstrap.min.css" rel="stylesheet">
    <link href="/assets/site/bootstrap3/css/bootstrap-theme.min.css" rel="stylesheet">
    <link href="/assets/modules/goods/css/style.css" rel="stylesheet">
    <script src="/assets/site/jquery-2.1.1.min.js"></script>
    <script src="/assets/site/bootstrap3/js/bootstrap.min.js"></script>
    <script src="/assets/site/ajaxupload.js"></script>
    <script type="text/javascript">
        $(document).ready(function(){
			       var baseUrl="index.php?a=112&id=2&get=";
             $("[data-active]").each(function(){
                _option = $(this).find("option[value='"+$(this).attr("data-active")+"']");
                _option.prop("selected", true);
			   
             });
  
			     /*  $(".searchbutton").on("click", function(e){
			           //console.log("search");
                  e.preventDefault();
                  $(this).parents("div").wrap("<form method='POST' action='"+baseUrl+"search'/>");//find("Search")
                  $(this).parents("form").submit();
              });

*/
             $(".deleteimage").on("click", function(e){
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
               Add new item
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