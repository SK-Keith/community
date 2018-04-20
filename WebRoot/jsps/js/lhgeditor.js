/*
 *@lhgdialog - Small HTML Editor v1.0.0 - Date : 2009-9-5
 *@Copyright lhgcore.js (c) 2009 By LiHuiGang Reserved
 */

J.exend({
	editor : {
		burl : window.location.href.replace( /[\?#].*$/, '' ).replace( /[\/\\][^\/]*$/, '' ) + '/',
		tool : [
		    { txt: 'bold', pos: '0 0', tit: '加粗' },
			{ txt: 'italic', pos: '-16px 0', tit: '倾斜' },
			{ txt: 'underline', pos: '-32px 0', tit: '下划线' },
			{ txt: '-' },
			{ txt: 'font', pos: '-48px 0', tit: '字体' },
			{ txt: 'fsize', pos: '-64px 0', tit: '字号' },
			{ txt: 'serial', pos: '-80px 0', tit: '编号' },
			{ txt: 'align', pos: '-96px 0', tit: '对齐方式' },
			{ txt: 'indent', pos: '-112px 0', tit: '缩进' },
			{ txt: '-' },
			{ txt: 'fcolor', pos: '-128px 0', tit: '字体颜色' },
			{ txt: 'bcolor', pos: '-144px 0', tit: '背景颜色' },
			{ txt: 'image', pos: '-160px 0', tit: '插入图片' },
			{ txt: 'link', pos: '-176px 0', tit: '增加链接' },
			{ txt: '-' },
			{ txt: 'code', pos: '-208px 0', tit: '查看源码' }
		], ed : {}, win : [], oid : [],
		i8 : (navigator.userAgent.toLowerCase().match(/msie (\d+)/)||[])[1] == 8 && !/opera/.test(navigator.userAgent.toLowerCase()),
		font : ['宋体','黑体','楷体','微软雅黑','Arial','Arial Narrow','Arial Black','Comic Sans MS','Courier','System','Times New Roman','Verdana'],
		fsize : ['smaller','larger','xx-small','x-small','small','medium','large'],
		serial : [{ cmd: 'insertorderedlist', txt: '数字编号' }, { cmd: 'insertunorderedlist', txt: '项目编号' }],
		align : [{ cmd: 'justifyleft', txt: '左对齐' }, { cmd: 'justifycenter', txt: '居中对齐' }, { cmd: 'justifyright', txt: '右对齐' }],
		indent : [{ cmd: 'indent', txt: '向右缩进' }, { cmd: 'outdent', txt: '向左缩进' }],
		fcolor : '800000,8b4513,006400,2f4f4f,000080,4b0082,800080,000000,ff0000,daa520,6b8e23,708090,0000cd,483d8b,c71585,696969,ff4500,ffa500,808000,4682b4,1e90ff,9400d3,ff1493,a9a9a9,ff6347,ffd700,32cd32,87ceeb,00bfff,9370db,ff69b4,dcdcdc,ffdab9,ffffe0,98fb98,e0ffff,87cefa,e6e6fa,dda0dd,ffffff'
	}
});

J.exend( J.editor, {
    add : function(id,w,h)
	{
	    w = w || 600; h = h || 200; var cont = this.cont = J('doc').crte('div'), bookmark;
		
		J(cont).acls('ed_c').attr('id',id+'_cont').stcs({ width: w + 'px', height: h + 'px' }).html(
		    '<div id="' + id + '_bar" class="t_bar"></div><iframe id="' + id + '_ifrm" frameborder="0" style="width:100%;height:' + ( J.ie ? h - 30 : h - 28 ) + 'px;"></iframe>' +
			'<textarea id="' + id + '_area" style="overflow:auto;border:0px;width:100%;height:' + ( J.ie ? h - 32 : h - 30 ) + 'px;font:13px Courier New;display:none;"></textarea>'
		);
		J(id).apch(cont,'be'); this.ed[id] = {};
		
		this.ed[id].ewin = J('#'+id+'_ifrm').contentWindow; var doc = this.ed[id].edoc = this.ed[id].ewin.document;
		
		doc.open();
		doc.writeln([
		    '<html>',
			    '<head><meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>',
				'<base href="' + this.burl + '"/><style>',
				    'body{margin:0;padding:5px;font:12px Verdana;background-color:#fff}',
					'p,font,div,li{line-height:160%;}',
					'pre{white-space:pre-wrap;white-space:-moz-pre-wrap;white-space:-pre-wrap;white-space:-o-pre-wrap;word-wrap:break-word;}',
				'</style></head><body dir="ltr" spellcheck="false"></body>',
			'</html>'
		].join(''));
		doc.close();
		
		if( doc.designMode && doc.designMode.toString().toLowerCase() == 'off' )
		    doc.designMode = 'on';
		else
		    doc.body.contentEditable = true;
		
		if( J.ie && !this.i8 )
		{
		    document.execCommand('BackgroundImageCache',false,true); if(!g) var g = new Image();
			g.onload = g.onerror = function(){ J.editor.toolbar(id); }; g.src = 'images/ed_ico.gif';
		}
		else this.toolbar(id); this.win.push(this.ed[id].ewin); this.oid.push(id);
		
		this.ofrm = J('#'+id).form; this.sfocu(id); this.shtml( id, J(id).val() ); J(id).stcs('display','none'); return this;
	},
	
	init : function()
	{
	    var p = this.panel = new J.panel(false,this.win); p.applnk('lhgeditor.css');
		this.pbox = J(p._main).apch( p._doc.createElement('div') );
		
		if( this.ofrm ) J(this.ofrm).aevt( 'submit', function(){
		    for( var i = 0; i < J.editor.oid.length; i++ )
			{
			    var html = J(J.editor.win[i].document.body).html(); J(J.editor.oid[i]).val(html);
			}
		});
		
		J(this.pbox).acls('sc_panel').html( '<table cellpadding="0" cellspacing="0" width="100%" ' +
		'style="table-layout:fixed"><tr><td id="item" nowrap></td></tr></table>' ); this.td = J('#item',p._doc);
	},
	
	shtml : function(id,v)
	{
	    J(this.ed[id].edoc.body).html(v);
	},
	
	gtrng : function(id)
	{
	    var sel = this.ed[id].ewin.getSelection ? this.ed[id].ewin.getSelection() : this.ed[id].edoc.selection, rang;
		
		try{
		    if( sel.rangeCount > 0 )
			    rang = sel.getRangeAt(0);
			else
			    rang = sel.createRange ? sel.createRange() : this.ed[id].edoc.createRange();
		}
		catch(e){}
		
		if(!rang)
		    rang = J.ie ? this.ed[id].edoc.body.createTextRange() : this.ed[id].edoc.createRange();
		
		this.ed[id].select = sel; this.ed[id].rang = rang;
	},
	
	exec : function(id,cmd)
	{
		cmd = cmd.toLowerCase();
		switch(cmd)
		{
		    case 'bold': case 'italic': case 'underline': this._exec( id, cmd ); break;
			case 'font': 
			case 'fsize': 
			case 'serial': 
			case 'align': 
			case 'indent': 
			case 'fcolor': 
			case 'bcolor': 
			case 'image': 
			case 'link': this.showp(cmd,id); break;
			case 'code': this.scode(id); break;
		}
	},
	
	_exec : function(id,c,p)
	{
		this.sfocu(id); if(J.ie) this.ed[id].rang.select(); this.panel.hide(this,this.panel);
		
		if( p != undefined ) return this.ed[id].edoc.execCommand( c, false, p );
		else return this.ed[id].edoc.execCommand( c, false, null );
	},
	
	sfocu : function(id)
	{
	    if(J.ie){ this.ed[id].edoc.body.setActive(); this.ed[id].ewin.focus(); } else this.ed[id].ewin.focus();
	},
	
	scode : function(id)
	{
		var ifrm = J('#'+id+'_ifrm'), area = J('#'+id+'_area');
		if(!this.ed[id].bcode)
		{
		    J(ifrm).stcs('display','none'); J(area).stcs('display','block');
			this.ed[id].cover = J('doc').crte('div'); var val = J(this.ed[id].edoc.body).html(); J(area).val(val);
			
			J(this.ed[id].cover).stcs({
				height: '26px', width: '320px', position: 'absolute', backgroundColor: '#efefef', zIndex: '2'
			}).stopac(0.7); J(id+'_bar').apch(this.ed[id].cover,'be');
		}
		else
		{
		    J(ifrm).stcs('display','block'); J(area).stcs('display','none');
			this.shtml( id, J(area).val() ); if(this.ed[id].cover){ J.rech(this.ed[id].cover); this.ed[id].cover = null; }
		}
		
		this.ed[id].bcode = !this.ed[id].bcode;
	},
	
	toolbar : function(id)
	{
	    for( var i = 0; i < this.tool.length; i++ )
		{
		    var btn = J('doc').crte('div'), r = this.tool[i];
			
			if( r.txt == '-' )
				J(btn).acls('ed_line').html('<div unselectable="on" class="line"></div>');
			else
			    J(btn).acls('ed_btn').attr({ title: r.tit, unselectable: 'on', id: r.txt }).hover(function(){
				    J(this).stcs({ border: '1px solid #0a246a', backgroundColor: '#c2cbe0' });
				}, function(){
				    J(this).stcs({ border: '1px solid #efefef', backgroundColor: '' });
				}).click(function(){
					J.editor.sfocu(id); J.editor.gtrng(id); J.editor.exec( id, J(this).attr('id') );
				}).msdown(J.canc).html( '<div unselectable="on" class="ed_ico" style="background-position:' + r.pos + '"></div>' );
			J(id+'_bar').apch(btn);
		}
	},
	
	showp : function(t,id)
	{
	    var ev = J.gtev(), el = ev.srcElement || ev.target; if(!el.id) el = el.parentNode;
		while( this.td.hasChildNodes() ) J.rech( this.td.firstChild );
		
		switch(t)
		{
		    case 'font':
				for( var i = 0; i < this.font.length; i++ )
				{
				    var item = J(this.td).apch( this.panel._doc.createElement('div') );
					J(item).acls('sc_item').stcs('fontFamily',this.font[i]).hover(
					this.iover, this.iout ).html(this.font[i]).click(function(){
						J.editor._exec( id, 'fontname', J(this).html() );
					}).msdown(J.canc);
				}
				J(this.pbox).stcs({ height: '150px', width: '130px' }); break;
			case 'fsize':
			    for( var i = 0; i < this.fsize.length; i++ )
				{
				    var item = J(this.td).apch( this.panel._doc.createElement('div') );
					J(item).acls('sc_item').attr('id',i+1).stcs('fontSize',this.fsize[i]).hover(
					this.iover, this.iout ).html(this.fsize[i]).click(function(){
						J.editor._exec( id, 'fontsize', this.id );
					}).msdown(J.canc);
					if(J.ie) J(item).stcs('width','107px');
				}
				J(this.pbox).stcs({ height: '150px', width: '130px' }); break;
			case 'serial':
				for( var i = 0; i < this.serial.length; i++ )
				{
				    var item = J(this.td).apch( this.panel._doc.createElement('div') );
					J(item).acls('sc_item').hover( this.iover, this.iout ).html(
					    '&raquo;&nbsp;' + this.serial[i].txt
					).attr('id',this.serial[i].cmd).click(function(){
						J.editor._exec( id, this.id );
					}).msdown(J.canc);
				}
				J(this.pbox).stcs({ height: '', width: '90px' }); break;
			case 'align':
			    for( var i = 0; i < this.align.length; i++ )
				{
				    var item = J(this.td).apch( this.panel._doc.createElement('div') );
					J(item).acls('sc_item').hover( this.iover, this.iout ).html(
					    '&raquo;&nbsp;' + this.align[i].txt
					).attr('id',this.align[i].cmd).click(function(){
						J.editor._exec( id, this.id );
					}).msdown(J.canc);
				}
				J(this.pbox).stcs({ height: '', width: '90px' }); break;
			case 'indent':
				for( var i = 0; i < this.indent.length; i++ )
				{
				    var item = J(this.td).apch( this.panel._doc.createElement('div') );
					J(item).acls('sc_item').hover( this.iover, this.iout ).html(
					    '&raquo;&nbsp;' + this.indent[i].txt
					).attr('id',this.indent[i].cmd).click(function(){
						J.editor._exec( id, this.id );
					}).msdown(J.canc);
				}
				J(this.pbox).stcs({ height: '', width: '90px' }); break;
			case 'bcolor':
			case 'fcolor':
			    var acolor = this.fcolor.toString().split(','), n = 0;
				var cmd = t == 'fcolor' ? 'forecolor' : 'backcolor';
				for( var i = 0; i < acolor.length; i++ )
				{
				    var item = J(this.td).apch( this.panel._doc.createElement('div') );
					J(item).acls('sc_color').hover(function(){
					    this.className += ' sc_color_over';
					},function(){
					    J(this).acls('sc_color');
					}).stcs({ backgroundColor: '#' + acolor[i] }).html(
					    '<img src="images/spacer.gif"/>'
					).click(function(){
					    if( !J.ie && cmd == 'backcolor' )
						{
						    J.editor.setcss(id,true);
							J.editor._exec( id, 'hilitecolor', this.style.backgroundColor );
							J.editor.setcss(id,false);
						}
						else
					        J.editor._exec( id, cmd, this.style.backgroundColor );
					}).msdown(J.canc);
					
					if(J.ie) J(item).stcs('styleFloat','left'); else J(item).stcs('cssFloat','left');
					if( i==7 || i==15 || i==23 || i==31 || i==39 ) J(item).stcs('marginRight','0px');
				}
				J(this.pbox).stcs({ height: '', width: (J.ie ? '116px' : '110px') }); break;
			case 'image':
			    var w = J.ie ? '174px' : '180px', dw = J.ie ? '136px' : '132px';
				J(this.td).html( '<div class="sc_item"><span>图片地址：</span><input id="url" type="text" value="http://" style="font:12px Arial;width:' + w + ';"/></div>' +
				                 '<div class="sc_item"><span>说明文字：</span><input id="alt" type="text" style="font:12px Arial;width:' + dw + ';"/>&nbsp;' +
								 '<input id="okbtn" type="button" style="font:12px Tahoma;border:1px solid #808080;" value="确定"/></div>' );
				J('okbtn',this.panel._doc).click(function(){
				    var url = J('url',J.editor.panel._doc).val(), alt = J('alt',J.editor.panel._doc).val();
				    if( url != '' && url != 'http://' )
						J.editor.inhtml( '<img src="' + url + '" alt="' + alt + '"/>', id );
				});
				J(this.pbox).stcs({ height: '', width: '250px' }); break;
			case 'link':
			    var w = J.ie ? '136px' : '132px';
				J(this.td).html( '<div class="sc_item"><span>链接地址：</span><input id="href" type="text" value="http://" style="font:12px Arial;width:' + w + ';"/>' +
				                 '&nbsp;<input id="lnbtn" type="button" style="font:12px Tahoma;border:1px solid #808080;" value="确定"/></div>' );
				J('lnbtn',this.panel._doc).click(function(){
				    var href = J('href',J.editor.panel._doc).val();
					if( href == '' || href == 'http://' )
					    J.editor._exec( id, 'unlink' );
					else J.editor._exec( id, 'createlink', href );
				}).msdown(J.canc);
				J(this.pbox).stcs({ height: '', width: '250px' }); break;
		}
		
		var x = 0, y = el.offsetHeight; if(J.ie){ x = 1; y += 1 };
		this.panel.show( x, y, el ); ev.stopPropagation ? ev.stopPropagation() : (ev.cancelBubble = true);
	},
	
	inhtml : function(t,id)
	{
	    this.sfocu(id); var rng = this.ed[id].rang;
		if(rng.insertNode)
		{
		    rng.deleteContents();
			rng.insertNode( rng.createContextualFragment(t) );
		}
		else
		{
		    if(rng.item){ this._exec(id,'delete'); rng = this.ed[id].rang; }
			rng.pasteHTML(t);
		}
		this.panel.hide(this,this.panel);
	},
	
	setcss : function(id,b)
	{
	    try{ this._exec( id, 'styleWithCSS', b ); }
		catch(e){ try{this._exec(id,'useCss',!b);}catch(e){} }
	},
	
	iout : function(){ this.className = 'sc_item'; },
	iover: function(){ this.className += ' sc_item_over'; }
});