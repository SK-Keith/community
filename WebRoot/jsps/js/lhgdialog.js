/*
 *@lhgdialog - Dialog Window v2.1.0 - Date : 2009-9-22
 *@Copyright lhgcore.js (c) 2009 By LiHuiGang Reserved
 */

J.exend({

dialog : (function()
{
    var twin = window.parent, cover;
	while( twin.parent && twin.parent != twin )
	{
	    try{ if( twin.parent.document.domain != document.domain ) break; }
		catch(e){break;}
		twin = twin.parent;
	}
	var tdoc = twin.document;
	
	var restyle = function(el)
	{
	    el.style.cssText = 'margin:0;padding:0;background-image:none;background-color:transparent;border:0;';
	};
	
	var getzi = function()
	{
	    if(!J.dialog.cfg.bzi) J.dialog.cfg.bzi = 1999; return ++J.dialog.cfg.bzi;
	};
	
	var resizehdl = function()
	{
		if(!cover) return; var rel = J.idtd(tdoc) ? tdoc.documentElement : tdoc.body;
		J(cover).stcs({
		    width: Math.max( rel.scrollWidth, rel.clientWidth, tdoc.scrollWidth || 0 ) - 1 + 'px',
			height: Math.max( rel.scrollHeight, rel.clientHeight, tdoc.scrollHeight || 0 ) - 1 + 'px'
		});
	};
	
	return {
	    cfg : { bzi: null, opac: 0.50, bgcolor: '#fff' }, indoc : {}, infrm : {}, inwin : {},
		get : function(d)
		{
		    if( !d || 'object' != typeof d || !d.id || J('#lhg_'+d.id,tdoc) ) return;
			if(d.cover) this.dcover(); else{ if(cover) cover = null; }
			
			var w = d.width || 400, h = d.height || 300, t = d.title || 'lhgdialog弹出窗口';
			var dp = J.path('lhgdialog.js'), sp = dp + 'skins/' + (d.skin||'default') + '/';
			
			var dinfo =
			{
			    tit: t, page: d.page, link: d.link, html: d.html, win: window, top: twin, 
				rng: d.rang, cus: d.custom, drg: d.nodrag, rez: d.noresize, sph: sp, fot: d.nofoot
			}, cize = J.vsiz(twin), pos = J.spos(twin);
			
			var itop = d.top ? pos.y + d.top : Math.max( pos.y + ( cize.h - h - 20 ) / 2, 0 );
			var ileft = d.left ? pos.x + d.left : Math.max( pos.x + ( cize.w - w - 20 ) / 2, 0 );
			
			var dfrm = J(tdoc).crte('iframe'); restyle(dfrm);
			J(dfrm).attr({
			    id: 'lhg_' + d.id, frameBorder: 0, scrolling: 'no',
				src: dp + 'lhgdialog.html', allowTransparency: 'true'
			}).stcs({
			    top: itop + 'px', left: ileft + 'px', position: 'absolute',
				width: w + 'px', height: h + 'px', zIndex: getzi()
			});
			dfrm._dlgargs = dinfo; J( tdoc.body ).apch( dfrm );
		},
		
		close : function(d,c)
		{
		    var dlg = ( 'object' == typeof(d) ) ? d.frameElement : J('#lhg_'+d);
			if( dlg && dlg.parentNode ){ J.rech(dlg); dlg = null; } if( c && c.parentNode ) this.hcover(c);
		},
		
		dcover : function()
		{
		    cover = J(tdoc).crte('div'); restyle(cover);
			J(cover).stcs({
				position: 'absolute', zIndex: getzi(), top: '0px',
				left: '0px', backgroundColor: this.cfg.bgcolor
			}).stopac(this.cfg.opac);
			
			if( J.ie && !J.i7 )
			{
			    var ifrm = J(tdoc).crte('iframe'); restyle(ifrm);
				J(ifrm).attr({
				    hideFocus: true, frameBorder: 0, src: J.gtvod()
				}).stcs({
				    width: '100%', height: '100%', position: 'absolute', left: '0px',
					top: '0px', filter: 'progid:DXImageTransform.Microsoft.Alpha(opacity=0)'
				});
				J(cover).apch(ifrm);
			}
			
			J(twin).aevt( 'resize', resizehdl ); resizehdl(); J(tdoc.body).apch(cover);
		},
		
		gcover : function(){ return cover; },
		hcover : function(o){ J.rech(o); cover = null; o = null; }
	};
})()

});