	$(function(){
		/*
		 * 1.得到所有的错误信息，循环遍历之，调用一个方法来确定是否显示错误信息
		 */
		$(".labelError").each(function(){
			showError($(this));//遍历每个元素，使用每个元素来调用showError方法
		});
		
		/*
		 * 2.切换图片，使得鼠标移上去和移出来变化
		 */
		$("#submitBtn").hover(
			function() {//鼠标进入元素
				$("#submitBtn").attr("src","/community/images/regist2.jpg");
			},
			function() {//鼠标出来元素
				$("#submitBtn").attr("src","/community/images/regist1.jpg");
			}
		);
		
		/*
		 *3.输入框得到焦点隐藏错误信息 
		 */
		$(".input").focus(function(){
			var labelId = $(this).attr("id") + "Error";//通过输入框找到对应的label的id
			$("#" +labelId).text("");//把label的内容清空
			showError($("#" + labelId));//隐藏没有错误信息的label
		});
		
		/*
		 * 4.输入框失去焦点
		 */
		$(".input").blur(function(){
			var id = $(this).attr("id");
			var funName = "validate" + id.substring(0,1).toUpperCase() + id.substring(1) + "()";//得到相应的检验函数名
			eval(funName);// 执行函数调用(把字符串当成javascript的代码)
	//		eval("alert(1+2);");
		});
		
		/*
		 * 5.表单提交时进行校验
		 */
		$("#registForm").submit(function(){
			var bool= true;//表示校验通过
			if(!validateLoginname()){
				bool = false;
			}
			if(!validateLoginpass()){
				bool = false;
			}
			if(!validateReloginpass()){
				bool = false;
			}
			if(!validateEmail()){
				bool = false;
			}
			if(!validateVerifyCode()){
				bool = false;
			}
			return bool;
		});
	});
	
	
	/**
	 * 登录名校验方法
	 */
	function validateLoginname(){
		var id="loginname";
		var value = $("#" + id).val();//获取输入框内容 
		/**
		 * 1.非空校验
		 */
		if(!value){
			/*
			 * 获取对应的label
			 * 添加错误信息
			 * 显示label
			 */
			
			$("#" + id + "Error").text("用户名不能为空！");
			showError($("#" + id +"Error")); 
			return false;
		}
		/**
		 * 2.长度校验
		 */
		if(value.length < 2 || value.length >20){
			/*
			 * 获取对应的label
			 * 添加错误信息
			 * 显示label
			 */
			$("#" + id + "Error").text("用户名长度必须在2-20之间！");
			showError($("#" + id +"Error")); 
			return false;
		}
		/**
		 * 3.是否注册校验
		 */
		$.ajax({
			url:"/community/UserServlet",//要请求的servlet
			data:{method:"ajaxValidateLoginname",loginname:value},
			type:"POST",
			dataType:"json",
			async:false,//是否异步请求，如果是异步，那么不会等服务器返回，我们这个函数就向下运行，即跳转到true。
			cache:false,
			success:function(result) {
				if(!result){
					$("#" + id + "Error").text("用户名已被注册！");
					showError($("#" + id + "Error"));
					return false;
				}
			}
		});
		return true;
	}
	
	/**
	 * 登录密码校验方法
	 */
	function validateLoginpass(){
		var id="loginpass";
		var value = $("#" + id).val();//获取输入框内容 
		/**
		 * 1.非空校验
		 */
		if(!value){
			/*
			 * 获取对应的label
			 * 添加错误信息
			 * 显示label
			 */
			
			$("#" + id + "Error").text("密码不能为空！");
			showError($("#" + id +"Error")); 
			return false;
		}
		/**
		 * 2.长度校验
		 */
		if(value.length < 3 || value.length >20){
			/*
			 * 获取对应的label
			 * 添加错误信息
			 * 显示label
			 */
			$("#" + id + "Error").text("密码长度必须在3-20之间！");
			showError($("#" + id +"Error")); 
			return false;
		}
		
		return true;
	}
	
	/**
	 * 确认密码校验方法
	 */
	function validateReloginpass(){
		var id="reloginpass";
		var value = $("#" + id).val();//获取输入框内容 
		/**
		 * 1.非空校验
		 */
		if(!value){
			/*
			 * 获取对应的label
			 * 添加错误信息
			 * 显示label
			 */
			
			$("#" + id + "Error").text("确认密码不能为空！");
			showError($("#" + id +"Error")); 
			return false;
		}
		/**
		 * 2.两次输入是否一致校验
		 */
		if(value != $("#loginpass").val()){
			/*
			 * 获取对应的label
			 * 添加错误信息
			 * 显示label
			 */
			$("#" + id + "Error").text("两次输入不一致！");
			showError($("#" + id +"Error")); 
			return false;
		}
		return true;
	}
	
	/**
	 * 邮箱校验方法
	 */
	function validateEmail(){
		var id="email";
		var value = $("#" + id).val();//获取输入框内容 
		/**
		 * 1.非空校验
		 */
		if(!value){
			/*
			 * 获取对应的label
			 * 添加错误信息
			 * 显示label
			 */
			
			$("#" + id + "Error").text("Email不能为空！");
			showError($("#" + id +"Error")); 
			return false;
		}
		/**
		 * 2.验证码校验
		 */
		if(!/^([a-zA-Z0-9_-])+@([a-zA-Z0-9_-])+((\.[a-zA-Z0-9_-]{2,3}){1,2})$/.test(value)){
			/*
			 * 获取对应的label
			 * 添加错误信息
			 * 显示label
			 */
			$("#" + id + "Error").text("错误的Email格式！");
			showError($("#" + id +"Error")); 
			return false;
		}
		/**
		 * 3.是否注册校验
		 */
		$.ajax({
			url:"/community/UserServlet",//要请求的servlet
			data:{method:"ajaxValidateEmail",email:value},
			type:"POST",
			dataType:"json",
			async:false,//是否异步请求，如果是异步，那么不会等服务器返回，我们这个函数就向下运行，即跳转到true。
			cache:false,
			success:function(result) {
				if(!result){
					$("#" + id + "Error").text("Email已被注册！");
					showError($("#" + id + "Error"));
					return false;
				}
			}
		});
		return true;
	}
	
	/**
	 * 验证码校验方法
	 */
	function validateVerifyCode(){
		var id="verifyCode";
		var value = $("#" + id).val();//获取输入框内容 
		/**
		 * 1.非空校验
		 */
		if(!value){
			/*
			 * 获取对应的label
			 * 添加错误信息
			 * 显示label
			 */
			
			$("#" + id + "Error").text("验证码不能为空！");
			showError($("#" + id +"Error")); 
			return false;
		}
		/**
		 * 2.长度校验
		 */
		if(value.length != 4){
			/*
			 * 获取对应的label
			 * 添加错误信息
			 * 显示label
			 */
			$("#" + id + "Error").text("错误的验证码 ！");
			showError($("#" + id +"Error")); 
			return false;
		}
		/**
		 * 3.是否注册校验
		 */
		$.ajax({
			url:"/community/UserServlet",//要请求的servlet
			data:{method:"ajaxValidateVerifyCode",verifyCode:value},
			type:"POST",
			dataType:"json",
			async:false,//是否异步请求，如果是异步，那么不会等服务器返回，我们这个函数就向下运行，即跳转到true。
			cache:false,
			success:function(result) {
				if(!result){
					$("#" + id + "Error").text("验证码错误！");
					showError($("#" + id + "Error"));
					return false;
				}
			}
		});
		return true;
	}
	
	/**
	 * 判断当前元素是否存在内容，如果存在显示，则页面不显示
	 */
	function showError(ele){
		var text = ele.text();//获取元素的内容
		if(!text){
			ele.css("display","none");//没有内容则隐藏
		}else{
			ele.css("display","");//有内容显示
		}
	}
	
	/**
	 * 实现换一张效果，不刷新页面，即不去掉原来填写的数据
	 */
	function change(){
		/**
		 * 1.获取<img>元素
		 * 2.重新设置它的src
		 * 3.使用毫秒来添加参数
		 */
		$("#vCode").attr("src","/community/VerifyCodeServlet?a="+ new Date().getTime());
	}
