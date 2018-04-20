;(function () {

//  顶部动画
    var headWaypoint = function(){
        if($('.headerListener').length > 0){
             $('.headerListener').waypoint( function( direction ) {
                 if(direction == 'up'){
                     $('header').addClass('head-top');
                 }else if(direction == 'down'){
                    $('header').removeClass('head-top');
                 }
            } , { offset: '100%' } );
        }

    }
    

//  进场动画
    var bannerWayPoint = function(){
        if($('.banner-animate').length > 0){
            $('.banner-animate').waypoint( function( direction ) {
                if( direction === 'down' && !$(this).hasClass('animated') ) {

                    setTimeout(function(){
                        $('.banner-animate-1').addClass('fadeInUp animated');
                    }, 100);
                    setTimeout(function(){
                        $('.banner-animate-2').addClass('fadeInUp animated');
                    }, 400);
                    setTimeout(function(){
                        $('.banner-animate-3').addClass('fadeInUp animated');
                        $('.banner-animate-4').addClass('fadeInUp animated');
                    }, 700);

                    $(this.element).addClass('animated');

                }
            } , { offset: '75%' } );
        }
    };

    var itemWayPoint = function(){
        if($('.item-animate').length > 0){
            $('.item-animate').waypoint( function( direction ) {
                if( direction === 'down' && !$(this).hasClass('animated') ) {

                    setTimeout(function(){
                        $('.into-animate').addClass('fadeInUp animated');
                    }, 100);

                    $(this.element).addClass('animated');

                }
            } , { offset: '75%' } );
        }
    };


    var infoAnimate = function() {
		if ( $('.ajy-info').length > 0 ) {
			$('.ajy-info .info-animate').each(function( k ) {

				var el = $(this);

				setTimeout ( function () {
					el.addClass('fadeInUp animated');
				},  k * 200, 'easeInOutExpo' );

			});
		}
	};

    var infoWayPoint = function() {
		if ( $('.ajy-info').length > 0 ) {
			$('.ajy-info').waypoint( function( direction ) {

				if( direction === 'down' && !$(this).hasClass('animated') ) {


					setTimeout(infoAnimate, 100);


					$(this.element).addClass('animated');

				}
			} , { offset: '75%' } );
		}
	};


    var sceneAnimate = function() {
		if ( $('.ajy-scene').length > 0 ) {
			$('.ajy-scene .scene-animate').each(function( k ) {

				var el = $(this);

				setTimeout ( function () {
					el.addClass('fadeInUp animated');
				},  k * 200, 'easeInOutExpo' );

			});
		}
	};

    var sceneWayPoint = function() {
		if ( $('.ajy-scene').length > 0 ) {
			$('.ajy-scene').waypoint( function( direction ) {

				if( direction === 'down' && !$(this).hasClass('animated') ) {


					setTimeout(sceneAnimate, 100);


					$(this.element).addClass('animated');

				}
			} , { offset: '75%' } );
		}
	};

    var counter = function() {
		$('.js-counter').countTo({
			formatter: function (value, options) {
		      	return value.toFixed(options.decimals);
		    },
		});
	};

    var counterWayPoint = function() {
		if ( $('.ajy-counter').length > 0 ) {
			$('.ajy-counter').waypoint( function( direction ) {

				if( direction === 'down' && !$(this).hasClass('animated') ) {

					setTimeout(function(){
						$('.counter-animate').addClass('fadeInUp animated');
						counter();
					}, 100);


					$(this.element).addClass('animated');

				}
			} , { offset: '75%' } );
		}
	};

    var regAnimate = function() {
		if ( $('.ajy-register').length > 0 ) {
			$('.ajy-register .reg-animate').each(function( k ) {

				var el = $(this);

				setTimeout ( function () {
					el.addClass('fadeInUp animated');
				},  k * 200, 'easeInOutExpo' );

			});
		}
	};

	var regWayPoint = function() {
		if ( $('.ajy-register').length > 0 ) {
			$('.ajy-register').waypoint( function( direction ) {

				if( direction === 'down' && !$(this).hasClass('animated') ) {



					setTimeout(regAnimate, 100);


					$(this.element).addClass('animated');

				}
			} , { offset: '75%' } );
		}
	};


    var caseAnimate = function() {
		if ( $('.ajy-case').length > 0 ) {
			$('.ajy-case .col-sm-3').each(function( k ) {

				var el = $(this);

				setTimeout ( function () {
					el.addClass('fadeInRight animated');
				},  k * 200, 'easeInOutExpo' );

			});
		}
	};

    var caseWayPoint = function() {
		if ( $('.ajy-case').length > 0 ) {
			$('.ajy-case').waypoint( function( direction ) {

				if( direction === 'down' && !$(this).hasClass('animated') ) {



					setTimeout(caseAnimate, 100);


					$(this.element).addClass('animated');

				}
			} , { offset: '75%' } );
		}
	};


    var caseClick = function(){
        $('.scene-tab-nav').on('click','.scene-item li',function(){
            var thisId = $(this).attr('data-id');

            $('.scene-item li').removeClass('active');
            $(this).addClass('active');


            $(".scene-item ul").prepend($(this).clone());
            $(this).eq(0).remove();

            $('.tab-pane').removeClass('on');
            $('#'+thisId).addClass('on');
        })
    }

    var productAnimate = function(i){
        if ( $('.ajy-product'+i).length > 0 ) {
			$('.ajy-case').find().each(function( k ) {

				var el = $(this);

				setTimeout ( function () {
					el.addClass('fadeInRight animated');
				},  k * 200, 'easeInOutExpo' );

			});
		}
    }

    var m_menu = function(){
        $('.m-menu-toggle').click(function(){
            $('body').css('overflow','hidden');
            $('.ajy-masker').show();
            $('.ajy-menu').css('right',0);
        });

        $('.close-menu,.ajy-masker').click(function(){
            $('body').css('overflow','auto');
            $('.ajy-masker').hide();
            $('.ajy-menu').css('right',"-230px");
        })
    }
    var listenerSubNav = function (x) {
        var arr = [];
        var i = $('.ajy-solution').length;
        for(var j=0;j<i;j++){
            arr.push($('.ajy-solution').eq(j).offset().top-1)
        }
        return arr;
    }
    var subnav = function(){
        if($('.s-navigation')[0]){
            $(window).scroll(function(){
                var scroolTop = $(this).scrollTop();
                var offsetTop = listenerSubNav();
               
                
                if(scroolTop>400){
                    $('.s-navigation').addClass('fixedNav');
                    $('header').addClass('hide');
                }else{
                    $('.s-navigation').removeClass('fixedNav');
                    $('header').removeClass('hide');
                }
                
                switch(offsetTop.length){
                    case 2:
                        if(offsetTop[0]+1 < scroolTop){
                            $('.s-navigation a').removeClass('active').eq(1).addClass('active');
                        }else{
                            $('.s-navigation a').removeClass('active').eq(0).addClass('active');
                        }  
                    break;
                        
                    case 3:
                        if(offsetTop[0] < scroolTop && scroolTop < offsetTop[1] ){
                            $('.s-navigation a').removeClass('active').eq(0).addClass('active');
                        }else if (offsetTop[1] < scroolTop && scroolTop  < offsetTop[2]) {
                            $('.s-navigation a').removeClass('active').eq(1).addClass('active');
                        }else if (scroolTop >= offsetTop[2]) {
                            $('.s-navigation a').removeClass('active').eq(2).addClass('active');
                        }
                    break;
                        
                    case 4:
                        if(offsetTop[0] < scroolTop && scroolTop < offsetTop[1] ){
                            $('.s-navigation a').removeClass('active').eq(0).addClass('active');
                        }else if (offsetTop[1] < scroolTop && scroolTop  < offsetTop[2]) {
                            $('.s-navigation a').removeClass('active').eq(1).addClass('active');
                        }else if (offsetTop[2] < scroolTop && scroolTop  < offsetTop[3]) {
                            $('.s-navigation a').removeClass('active').eq(2).addClass('active');
                        }else if (scroolTop >= offsetTop[2]) {
                            $('.s-navigation a').removeClass('active').eq(3).addClass('active');
                        }    
                    break;
                        
                    
                }

                
            })

            $('.s-navigation a').click(function(e){
                e.preventDefault();
                $('body,html').animate({
                    scrollTop:$('.ajy-solution').eq($(this).index()).offset().top,
                },800);
            })
        }
    }

    var article_content = function(){
        if($('.ajy-container').hasClass('blog-content')){
            $('header').removeClass('head-top');
            $('.headerListener').removeClass();
        }
        if($('.ajy-container').hasClass('faqs-content')){
            $('header').removeClass('head-top');
            $('.headerListener').removeClass();
        }
    }

    var article_side = function(){
        var aMenuOneLi = $(".menu-one > li");
		var aMenuTwo = $(".menu-two");
		$(".menu-one > li > p").each(function (i) {
			$(this).click(function () {
				if ($(aMenuTwo[i]).css("display") == "block") {
					$(aMenuTwo[i]).slideUp(300);
				} else {
					for (var j = 0; j < aMenuTwo.length; j++) {
						$(aMenuTwo[j]).slideUp(300);
					}
					$(aMenuTwo[i]).slideDown(300);
				}
			});
		});

    }

    var backTop = function(){
        var obtn = $(".ajy-rside").children('.backtop');
	    var clientHeight =document.documentElement.clientHeight;
	    var timer = null;
	    var isTop = true;
	    window.onscroll = function()
        {
            var osTop = document.documentElement.scrollTop || document.body.scrollTop;
            if(osTop>=clientHeight)
            {
                obtn.fadeIn(500);
            }
            else
            {
                obtn.fadeOut(500);
            }
            if(!isTop)
            {
                clearInterval(timer);
            }
            isTop = false;
        };

        obtn.on("click",function(){
            timer = setInterval(function(){
                var osTop = document.documentElement.scrollTop || document.body.scrollTop;
                var ispeed = Math.floor(-osTop/6);
                document.documentElement.scrollTop = document.body.scrollTop = osTop+ispeed;
                isTop =true;
                if (osTop == 0)
                {
                    clearInterval(timer);
                }
            },30)
        });

    }


    var blogNoimg = function(){
        $('.blog-item').each(function(){
            if($(this).find("img").attr('src') == ""){
                 $(this).find('.blog-img').hide();
            }
        })
    }

    var m_tel = function(){
         $('#phone_tel').on('click',function(){
        	var html='';
        		html += '<div class="pop-masker"><div class="pop-body"><a href="tel:028-67873870">';
        		html += '<label>客服电话：</label><br/>028-67873870</a>';
        		html +=	'<div class="pop-foot" onclick="$(\'.pop-masker\').remove()">取消</div></div>'
        	$('body').append(html);
        	$("html").css("overflow",'hidden');
        });
    }


    var lightbox = function(){
        var $bar =  $('.ajy-article a[href$="jpg"]');

        $(document).on('click','.ajy-article a[href$="jpg"],.ajy-article a[href$="png"],.ajy-article a[href$="gif"]',function(e){
            e.preventDefault();
            var $html = '<div class="lightbox"><a class="close-lightbox"></a><div class="gallery"><img src="'+$(this).attr("href")+'"/></div></div>'
            if($('.lightbox').size()==0){
                $("body").append($html);
                $('.lightbox').show();
            }else{
                $('.lightbox').show().find('img').attr('src',$(this).attr("href"));
            }

        });

        $(document).on('click','.close-lightbox,.gallery',function(e){
            $('.lightbox').hide();
        })
    }
    
    
    var signup = function(){
        if($('.signup-panel')[0]){
            $('#signup').click(function(){
                $('.signup-panel').addClass('fadein');
                $('body,html').css('overflow','hidden');
            });
            
            $('.signup-panel').on('click','.close-box',function(){
                $('.signup-panel').removeClass('fadein');
                $('body,html').css('overflow','auto');
            })
            
            $('.tj_sign').click(function(){
                $(this).attr('disabled',true);
                var data1 = $('.facilitator').serialize();
                $.getJSON("https://vip.weixiaoqu.com/index/jxs_apply?"+data1+"&jsoncallback=?",
                       "",
                       function(res){
                            if(res.status == 1){
                                $('.signup-panel').hide();  
                                $('.signup-toast').show().html(res.msg+'<br/>感谢您的申请，我们的客服人员将在24小之内与您联系，敬请留意！');
                                setTimeout(function(){
                                    window.location.reload();
                                },2000);
                            }else{
                                
                                $('.facilitator>.row').removeClass('error_s');
                                for(var err in res.err_list){
                                    $('[name="'+res.err_list[err].text_name+'"]').parents('.row').addClass('error_s');    
                                    $('.facilitator>.error').show().html(res.err_list[0].msg)
                                }
                                LUOCAPTCHA.reset();
                            }
                       },
                       'json'
                );
                
                setTimeout(function(){
                    $('.tj_sign').attr('disabled',false);    
                },2000)
            })
            
            $('.facilitator').on('keyup','input',function(){
                if($(this).val() != ''){
                     $(this).parents('.error_s').removeClass('error_s');
                    if($('.error_s').length == 0 ){
                        $('.facilitator>.error').hide();
                    }
                }               
            })
           
        }        
        
    }     
    
    var mSign = function(){
        if($('.m-facilitator-from')[0]){
            $('.tj-sign').click(function(){
                $(this).attr('disabled',true);
                var _data = $('.m-facilitator-from').serialize();
                $.getJSON("https://vip.weixiaoqu.com/index/jxs_apply?"+_data+"&jsoncallback=?",
                       "",
                       function(res){
                            if(res.status == 1){
                                $('.signup-toast').show().html(res.msg+'<br/>感谢您的申请，我们的客服人员将在24小之内与您联系，敬请留意！');
                                setTimeout(function(){
                                    window.location.reload();
                                },2000);
                            }else{
                                $('.m-fws-apply input+span').hide();
                                for(var err in res.err_list){                                    
                                    $('[name="'+res.err_list[err].text_name+'"]').next('span').show().html(res.err_list[err].msg);  
                                }
                                LUOCAPTCHA.reset();
                            }
                       },
                       'json'
                );
                
                setTimeout(function(){
                    $('.tj-sign').attr('disabled',false);    
                },2000)
                
                $('.m-fws-apply').on('keyup','input',function(){
                    if($(this).val() != ''){
                         $(this).next('span').hide();                        
                    }               
                })
            })
        }
    }
//  Document on load.


    $(function(){

        
        if($(window).width()>1200){
            $('.headerListener').css("top",$(window).height()+100);
            setTimeout( headWaypoint,100);
        }else{
            $('header').removeClass('head-top');
        }


//        bannerWayPoint();
//        itemWayPoint();
//        infoWayPoint();
//        sceneWayPoint();
        counterWayPoint();
//        regWayPoint();

//        caseWayPoint();

        caseClick();
        m_menu();
        signup();
        article_content();
        article_side();

        backTop();

        blogNoimg();

        m_tel();

        lightbox();

        if($(window).width()>1000){
            subnav();
        }


    });
}());
