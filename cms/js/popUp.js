function popUp(o) {
	day = new Date();
	id = day.getTime();
	o.url = (typeof o.url == 'undefined') ? '' : o.url;
	o.name = (typeof o.name == 'undefined') ? id : o.name;
	
	o.toolbar = 0;
	o.scrollbar = 1;
	o.location = 0;
	o.statusbar = 0;
	o.menubar = 0;
	o.resizable = 1;
	
	o.width = (typeof o.width == 'undefined') ? 410 : o.width;
	o.height = (typeof o.height == 'undefined') ? 313 : o.height;
	
	var newwindow = window.open(o.url, o.name, 
							'toolbar=' + o.toolbar +
							',scrollbars=' + o.scrollbar +
							',location=' + o.location +
							',statusbar=' + o.statusbar + 
							',menubar=' + o.menubar + 
							',resizable=' + o.resizable +
							',width=' + o.width +
							',height=' + o.height);
}