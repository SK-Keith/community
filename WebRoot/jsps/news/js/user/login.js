window.onload = function() {
    var oUl1 = document.getElementById("login-tab");
    var lA = oUl1.getElementsByTagName("a");
	var oMain=document.getElementById('l-login');
    var oDiv=oMain.getElementsByClassName('ha');
    for(var i = 0; i < lA.length; i++) {
        lA[i].index = i;
        lA[i].onclick = function() {
            for(var i = 0; i < lA.length; i++) {
                lA[i].className = "";
            }
            this.className = "active";
        }
    }
	for(var i=0;i<lA.length;i++){
	lA[i].index=i;
	lA[i].onclick=function(){
		for(var i=0;i<lA.length;i++){
			oDiv[i].style.display='none';
			}
	oDiv[this.index].style.display="block";	     
	} 
}
	
	
}

