var net=new Object();		//定义一个全局的变量
//编写构造函数
net.AjaxRequest=function(url,onload,onerror,method,params){
  this.req=null;
  this.onload=onload;
  this.onerror=(onerror) ? onerror : this.defaultError;
  this.loadDate(url,method,params);
  alert("上联：山石岩下古木枯");
}
//编写用于初始化XMLHttpRequest对象并指定处理函数，最后发送HTTP请求的方法
net.AjaxRequest.prototype.loadDate=function(url,method,params){
  if (!method){
    method="GET";	//设置默认的请求方式为GET
  }
  if (window.XMLHttpRequest){	//非IE浏览器
    this.req=new XMLHttpRequest();	//创建XMLHttpRequest对象
  } else if (window.ActiveXObject){//IE浏览器
    this.req=new ActiveXObject("Microsoft.XMLHTTP");	//创建XMLHttpRequest对象
  }
  if (this.req){
    try{
      var loader=this;
      this.req.onreadystatechange=function(){
        net.AjaxRequest.onReadyState.call(loader);
      }

      this.req.open(method,url,true);		// 建立对服务器的调用
	  if(method=="POST"){		// 如果提交方式为POST
		this.req.setRequestHeader("Content-Type","application/x-www-form-urlencoded"); 	// 设置请求的内容类型
		this.req.setRequestHeader("x-requested-with", "ajax");	//设置请求的发出者
	  }
      this.req.send(params);			// 发送请求
    }catch (err){
      this.onerror.call(this);			//调用错误处理函数
    }
  }
}

//重构回调函数
net.AjaxRequest.onReadyState=function(){
  var req=this.req;
  var ready=req.readyState;		//获取请求状态
  if (ready==4){							//请求完成
	    if (req.status==200 ){					//请求成功
	    	this.onload.call(this);
	    }else{
    		this.onerror.call(this);		//调用错误处理函数
	    }
  }
}
//重构默认的错误处理函籹
net.AjaxRequest.prototype.defaultError=function(){
	alert("错误数据\n\n回调状态:" + this.req.readyState + "\n状态: " + this.req.status);
}
