window.onload = function() {
	
	var oMain = document.getElementById('main');
	var oBa = document.getElementById('main2');
	var oBt = oBa.getElementsByTagName('li');

	function getElementsByClassName(n) {
		var classElements = [], allElements = document
				.getElementsByTagName('ul');
		for ( var i = 0; i < allElements.length; i++) {
			if (allElements[i].className == huan) {
				classElements[classElements.length] = allElements[i];
			}
		}
		return classElements;
	}
	var oDiv = oMain.getElementsByClassName('huan');
	for ( var i = 0; i < oBt.length; i++) {
		oBt[i].index = i;
		oBt[i].onclick = function() {
			for ( var i = 0; i < oBt.length; i++) {
				oBt[i].className = "normal1";
				oDiv[i].style.display = 'none';
			}
			this.className = "active1";
			oDiv[this.index].style.display = 'block';

		}
	}
	function notice() {
		alert("非常抱歉！该功能尚在研发当中！");
	}
}