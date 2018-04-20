/*
 *@lhgdialog - Dialog Window v2.1.0 - Date : 2009-9-22
 *@Copyright lhgcore.js (c) 2009 By LiHuiGang Reserved
 */

// 此文件用于修正IE6下窗口尺寸
(function()
{
    var fixsize = window.doretsize = function()
	{
	    var lhgdlg = window.document.body;
		
		for( var i = 0, l = lhgdlg.childNodes.length; i < l; i++ )
		{
		    var child = lhgdlg.childNodes[i];
			switch( child.className )
			{
			    case 'contain':
					child.style.width = Math.max( 0, lhgdlg.offsetWidth - 2 - 2 );
					child.style.height = Math.max( 0, lhgdlg.clientHeight - 2 - 26 );
					break;
				case 'tr':
				    child.style.left = Math.max( 0, lhgdlg.clientWidth - 2 );
					break;
				case 'tc':
				    child.style.width = Math.max( 0, lhgdlg.clientWidth - 2 - 2 );
					break;
				case 'ml':
				    child.style.height = Math.max( 0, lhgdlg.clientHeight - 26 - 2 );
					break;
				case 'mr':
				    child.style.left = Math.max( 0, lhgdlg.clientWidth - 2 );
					child.style.height = Math.max( 0, lhgdlg.clientHeight - 26 - 2 );
					break;
				case 'bl':
				    child.style.top = Math.max( 0, lhgdlg.clientHeight - 2 );
					break;
				case 'br':
				    child.style.left = Math.max( 0, lhgdlg.clientWidth - 2 );
					child.style.top = Math.max( 0, lhgdlg.clientHeight - 2 );
					break;
				case 'bc':
				    child.style.width = Math.max( 0, lhgdlg.clientWidth - 2 - 2 );
					child.style.top = Math.max( 0, lhgdlg.clientHeight - 2 );
					break;
			}
		}
	};
	
	var load = function()
	{
		window.attachEvent( 'onresize', fixsize );
		fixsize(); window.detachEvent( 'onload', load );
	};
	
	window.attachEvent( 'onload', load );
})();