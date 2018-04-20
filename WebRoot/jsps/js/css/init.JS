//打开窗口的函数

 function switchSysBar(){
  if (parseInt(navigator.appVersion)>=4) {
	if (switchPoint.innerText==3){
		switchPoint.innerText=4
		document.all("query").style.display="none"

	}
	else{
		switchPoint.innerText=3
		document.all("query").style.display=""
	}
  }
}

 function viewPage(ipage){
        document.frmList.Page.value=ipage
        document.frmList.submit()        
     }

 function openScript(url, width, height) {
        var Win = window.open(url,"_blank",'width=' + width + ',height=' + height + ',resizable=0,scrollbars=no,menubar=no,status=no' );
    }

function openScript1(url, width, height) {
        var Win = window.open(url,"_blank",'width=' + width + ',height=' + height + ',resizable=1,scrollbars=yes,menubar=no,status=no,left=5,top=10' );
    }

 function Detail(i,ss){
      var u
      u='newsdetail.asp?news_id='+i+'&wstr="'+ss+'"'
      window.open(u,'_blank','dependent,width=500,height=300')
    }
    
 function MM_openBrWindow(theURL,winName,features) { //v2.0
  window.open(theURL,winName,'width =503,height=316,resizable=1,scrollbars=yes,menubar=no,status=no,left=5,top=10');

    }




 function tt(s){
      alert(s)
    }

function OpenWindow(htmurl,widths,heights)
{
   var paramet = 'toolbar=no,resizable=yes,scrollbars=yes,width='+ widths + ',height=' + heights;
   newWindow = window.open(htmurl,"viewfilm",paramet);
   newWindow.focus();
}

function MM_openBrWindow1(theURL,winName,features) { //v2.0
  window.open(theURL,winName,features);
}

function MM_reloadPage(init) {  //reloads the window if Nav4 resized
  if (init==true) with (navigator) {if ((appName=="Netscape")&&(parseInt(appVersion)==4)) {
    document.MM_pgW=innerWidth; document.MM_pgH=innerHeight; onresize=MM_reloadPage; }}
  else if (innerWidth!=document.MM_pgW || innerHeight!=document.MM_pgH) location.reload();
}