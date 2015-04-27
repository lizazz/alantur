var _get = {};
	location.search.substr(1).replace(/([^=&]+)=([^&]*)/g, function(o, k, v) {
	   _get[decodeURIComponent(k)] = v;
	});


$(document).ready(function() {

var map;
            function initialize() {
            var a  = $('#map_canvas').attr('value');
            mas = a.split(',');
      //  mas = a;
        var myLatlng = new google.maps.LatLng(parseFloat(mas[0]),parseFloat(mas[1]));
        var mapOptions = {
        zoom: 14,
        center: myLatlng
        }
        var map = new google.maps.Map(document.getElementById('map_canvas'), mapOptions);

        var marker = new google.maps.Marker({
          position: myLatlng,
          map: map,
          title: 'Hello World!'
        });
        }

google.maps.event.addDomListener(window, 'load', initialize);

$("[data-toggle='tab']").on("click", function (e) {
  e.preventDefault();
  document.location.hash = $(this).attr("href");
  $(".tab-pane").hide();
  $("[role='presentation']").removeClass("active");
  $(this).parent().addClass("active");
  $($(this).attr("href")).show();
})

    //fill filter for search tour
    $("[name='country'][value='"+_get.country+"']").prop("checked", true);


//work with tabs on private page
 
$("[data-toggle='tab'][href='"+document.location.hash+"']").trigger("click")
	$('.fancybox').fancybox();
	$(".js_fancy-video").click(function() {
                $.fancybox({
                    'padding'       : 0,
                    'autoScale'     : false,
                    'href'          : this.href.replace(new RegExp("watch\\?v=", "i"), 'v/'),
                    'type'          : 'swf',
                    'swf'           : {
                        'wmode'             : 'transparent',
                        'allowfullscreen'   : 'true'
                    }
                });
                return false;
    });
	
    /*rate*/
 	$('.js_score').raty({
	  score: function() {
        console.log($(this).attr('data-rating'));
	    return $(this).attr('data-rating');
	  }
	});
	$('.js_star').raty({
	  readOnly : true,
		score: function() {
	    return $(this).attr('data-rating');
	  }
	});
  

    /*validation*/

	$(".validate-form").each(function(){
        $(this).validate({
        focusInvalid: true,
        errorPlacement: function(error,element) {

        	error.appendTo( element.parent("td").next("td") );
			error.insertAfter(element);
            error.parent('p').addClass('error');
        },
        success: function(valid) {
		valid.parent('p').removeClass('error');
		},
		rules:{ 
        	name:{
                required: true
            },
            phone:{
                required: true
            },
            message:{
                required: true
            },
            email:{
                required: true,
                email: true
            },
            captcha:{
                required: true
            },
            password:{
                required: true
            },
            npass: {
                required: true
            }
            
       },
       messages:{
        	name:{
                required: "Поле Имя не заполнено"
            },
            phone:{
                required: "Поле Телефон не заполнено"
            },
            message:{
                required: "Поле Сообщение не заполнено"
            },
        	email:{
        		required: "Поле E-mail не заполнено",
                email: "Вы ввели неправильный формат email"
            },
            captcha:{
                required: "Поле c кодом не заполнено"
            },
            password:{
                required: "Поле Пароль не заполнено"
            },
            npass: {
                required: "Повторите пароль"
            }
        }
    });
	});
    $(".validate-form-order").each(function(){
        $(this).validate({
        ignore: ".ignore",    
        focusInvalid: true,
        errorPlacement: function(error,element) {
            var errlist = element.parents('.validate-form-order').find('.error-list');
            error.prependTo(errlist);
            var msbox = element.parents('.validate-form-order').find('.messageBox');
            msbox.show();
        },        
        success: function(valid) {
        valid.removeClass('error');
        },
        rules:{ 
            name:{
                required: true
            },
            phone:{
                required: true
            },
            message:{
                required: true
            },
            email:{
                required: true,
                email: true
            },
            password:{
                required: true
            },
            city:{
                required: true
            },
            street:{
                required: true
            },
            password: { required: true },
            delivery: {
                required: true
            },
            pay: {
                required: true
            }
       },
       messages:{
            name:{
                required: "Поле Имя не заполнено"
            },
            phone:{
                required: "Поле Телефон не заполнено"
            },
            message:{
                required: "Поле Сообщение не заполнено"
            },
            email:{
                required: "Поле E-mail не заполнено",
                email: "Вы ввели неправильный формат email"
            },
            password:{
                required: "Поле Пароль не заполнено"
            },
            city:{
                required: "Поле Город не заполнено"
            },
            street:{
                required: "Поле Улица не заполнено"
            },
            delivery: {
                required: "Поле Доставка не заполнено"
            },
            pay: {
                required: "Поле Оплата не заполнено"
            }
        }
    });
    });

	$('.contact-form.validate-form button').live("click", function() {
        console.log('enter');
        var valid = $(".validate-form").valid();
        if(valid)
        {  
        	   //мой код для отправки письма с формы обратной связи
               
                    e.preventDefault();
                    var m_data=$(this).serialize();
                    $.ajax({
                        data: m_data,
                        resetForm: 'true',
                        success: function(result){
                            $('#form-submit').fadeIn(500);
                            $("body").append("<div id='overlay'></div>");
                            $('#overlay').show().css({'filter' : 'alpha(opacity=60)'});
                            return false;
     					}
                    });
               
        };
    }); 
    $(".validate-form-order input.error").each(function(){
        $(this).parent('div').addClass('error');
    });
    $("a.js_close").click(function(){				
		$('.popup').fadeOut(100);
		$('#overlay').remove('#overlay');
		return false;
	});
  
    // button "add one more foto" on new-report page
    $(".add-foto").live("click", function(){
        $("<input type='file' name='order[foto][]'/><div><label>Description<textarea name='order[description][]' class='form-control'></textarea></label></div>").insertBefore("#sent");
        return false;
    });


    // удаление фотографии из фотоотчета

    $(".del-foto").on("click", function(){
           var _this = $(this);
        if (confirm("Вы уверены, что хотите удалить фотографию?")) {
           $.ajax({
                type: "POST",
                data: "ajax=del_foto&foto="+_this.attr('data-img')+"&order="+_this.attr('data-folder')+"&fotoname="+_this.attr('data-fotoname'),
                success: function(result){
                      location.href = "/new-report?report="+_this.attr('data-folder')
                        return false;
                 },
                error:function(){
                }
             })
        }
    });


    //Удаление отчета
    $(".del-report").on("click", function(){
           var _this = $(this);
        	if (confirm("Вы уверены, что хотите удалить весь фотоотчет?")) {
  				$.ajax({
               		type: "POST",
                	data: "ajax=del_report&order="+_this.attr('data-folder'),
	                success: function(result){
	                       // alert("Отчет был удален");
	                        location.href = "/userpage#profile";
	                        return false;
	                 	},
	                	error:function(){
                	}
       			 })

            }   
    });


     // hide feddback form after sending of letter
    $(".feedback").on("click", function(){
        var name = $("[name='feed[name]']").val();
        var phone = $("[name='feed[phone]']").val();
        var message = $("[name='feed[message]']").val();
        var captcha = $("[name='g-recaptcha-response']").val();
        if(name != "" && phone != "" && message != "" && captcha != ""){
            $.ajax({
                    type: "POST",
                    data: "ajax=feedback&name="+name+"&phone="+phone+"&message="+message+"&captcha="+captcha,
                    success: function(result){
                            $("[name='feedback']").html("<div>Сообщение отправлено. Наши менеджеры с вами свяжутся</div>");
                        },
                        error:function(){
                    }
            })
        }
        else{alert("Одно из полей не заполнено")
        }
        return false;
    });


    //catch rate star for voiting
    $(".js_star >img ").on("click", function(){
    	var _this = $(this);
    	$.ajax({
                type: "POST",
                data: "ajax=vote-report&rate="+_this.attr("alt")+"&report="+_this.parent('div').attr('data-order'),
                success: function(result){
                        alert("Вы проголосовали за понравившийся отчет");
                        location.reload();
                        return false;
                 },
                error:function(){
                }
        })
    })


    //check authentification

    $(".auth").on("click", function(){
        var a = $("[name='auth_email']").val();
        var b = $("[name='auth_pass']").val();
        if(a != "" && b != ""){
            $.ajax({
                    type: "POST",
                    data: "ajax=auth&email="+a+"&pass="+b,
                    success: function(result){
                    	var key = "";
                        switch (result){
                            case "0":
                                key = "Вы не ввели данные";
                            break;
                            case "11":
                                key = "Пользователь с такими данными не найден!";
                            break;
                            case "12":
                                key = "Ваш аккаунт был заблокирован! Обратитесь к Администрации сайта.";
                            break;
                            case "13":
                                key = "Вы ввели неверный пароль!";
                            break;
                            case "20":
                                location.href = "/userpage";
                            break;
                        }
                        if(key!=""){
	                        $(".check_auth").removeClass("hidden");
	                        $(".check_auth").addClass("show");
	                        $(".check_auth").text(key);
						}                      
                    },        
                    error:function(){ 
                        alert("проблема с отправкой данных формы для проверки авторизации");
                    }

            })
        }else{$(".check_auth").attr("style","visibility:visible");
        	$(".check_auth").removeClass("hidden");
	        $(".check_auth").addClass("show");
            $(".check_auth").text("Вы не полностью ввели форму");}
        return false;
    })



    $(".reg").on("click", function(){
        var a = $("[name='reg_email']").val();
        var b = $("[name='reg_pass']").val();
        if(a!= "" && b!= ""){
           $.ajax({
                    type: "POST",
                    data: "ajax=reg&reg[email]="+a+"&reg[pass]="+b,
                    success: function(result){
                    	var key = "";
                        switch (result){    
                            case "13":
                                key = "Нам очень жаль, но пользователь с такой электронной почтой уже зарегистрирован!"
                            break;
                            case "0":
                                key = "Пришла пустая форма.";
                            break;
                            case "20":
                                location.href = "/userpage";
                            break;
                        } 
                        if(key!=""){
	                        $(".check_reg").removeClass("hidden");
	                        $(".check_reg").addClass("show");
	                        $(".check_reg").text(key);
						}      
                    },        
                    error:function(){ 
                        alert("проблема с отправкой данных формы регистрации");
                    }

            })
        }else{
            $(".check_reg").removeClass("hidden");
	        $(".check_reg").addClass("show");
            $(".check_reg").text("Вы не полностью ввели форму");
        }
        return false;
    })


	//user logout
	$(".logout").on("click", function(){
		$.ajax({
                type: "POST",
                data: "ajax=logout",
                url: "/",
                success: function(result){   
                       	console.log(result);
                        location.href = "/registration";     
                    },        
                    error:function(){ 
                        location.href = "/registration";
                    }

            })
		return false;
	})


	$(".buy_tour").on("click", function(){
		var _this = $(this);
		$.ajax({
                    type: "POST",
                    data: "ajax=sale&buy[user]="+_this.attr("data-userid")+"&buy[tour]="+_this.attr("data-tourid")+"&buy[price]="+_this.attr("data-price"),
                    url: "/",
                    success: function(result){ 
                         var key = "";
                        switch(result){
                            case "1":
                                location.href = "/after-order"; 
                            break;
                            case "2":
                                key = "У Вас недостаточно средств для покупки этого тура";
                            break;    
                        }
                        if(key != ""){
                            $(".check_balance").removeClass("hidden");
                            $(".check_balance").addClass("show");
                            $(".check_balance").text(key);    
                        }    
                        return false;
                    },        
                    error:function(){ 
                        alert("Вы уже заказали этот тур");
                    }
        })
	})
});