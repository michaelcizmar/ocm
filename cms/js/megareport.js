
function move_up(menu_name)
{
	
	if(!menu_name) {
		menu_name = 'fo';
	}
	var container = document.getElementById(menu_name);
	
	for (i = 1; i < container.length; i++)
	{
		if (container.options[i].selected)
		{
			var tmp_text = container.options[i].text;
			var tmp_value = container.options[i].value;
			
			container.options[i].text = container.options[i-1].text;
			container.options[i].value = container.options[i-1].value;
			
			container.options[i-1].text = tmp_text;
			container.options[i-1].value = tmp_value;
			
			container.options[i].selected = false;
			container.options[i-1].selected = true;	
			
			break;
		}
	}
}


function move_down(menu_name)
{
	if(!menu_name) {
		menu_name = 'fo';
	}
	var container = document.getElementById(menu_name);
	for (i = 0; i < container.length - 1; i++)
	{
		if (container.options[i].selected)
		{
			var tmp_text =  container.options[i].text;
			var tmp_value = container.options[i].value;
			
			container.options[i].text = container.options[i+1].text;
			container.options[i].value = container.options[i+1].value;
			
			container.options[i+1].text = tmp_text;
			container.options[i+1].value = tmp_value;
			
			container.options[i].selected = false;
			container.options[i+1].selected = true;	
			
			break;
		}
	}
}

function highlight_all_fo()
{
	var fo = document.getElementById('fo');
	var i = 0;
	
	for (i = 0; i < fo.length; i++)
	{
		fo.options[i].selected = true;
	}
}

function update(field_name, field_text)
{
	var fields = new Array("fo","ffield0","ffield1","ffield2","ffield3","ffield4","ffield5",
							"order_by","order_by2","sum","count","group_by","group_by2");
	var k = 0;
	var i = 0;
	
	if(fields.length) {
		for (i = 0; i < fields.length; i++)
		{
			add_option(fields[i],field_name,field_text);
		}
	}
	return false;
}

function add_option(menu_name, field_name, field_text)
{
	var container = document.getElementById(menu_name);
	var is_found = false;
	if(container.length) {
		for (var i = 0; i < container.length; i++){
			if (container.options[i].value == field_name){
				container.options[i] = null;
				is_found = true;
				break;
			}
		}
	}
	if (is_found == false){
		var addIndex = container.length;
		container.options[addIndex] = new Option(field_text,field_name);
	}
}