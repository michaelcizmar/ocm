function update_checkbox_list(checkbox_value,field_name)
{
	var container = document.getElementById(field_name);
	if(container.value.length < 1)
	{
		container.value = checkbox_value;
	}
	
	else
	{
		var tmp_value_list = [];
		var value_was_found = false;
		var value_list = container.value.split(",");
		
		for(var i = 0; i < value_list.length; i++) 
		{
			if(value_list[i] == checkbox_value) 
			{
				value_was_found = true;
			}
			
			else
			{
				tmp_value_list.push(value_list[i]);
			}
		}
		
		if (false == value_was_found)
		{
			tmp_value_list.push(checkbox_value);
		}
		
		container.value = tmp_value_list.join(",");
	}
	
	return false;
}

function checkAll(container,field_name) {
	var checkbox_list = document.getElementById(container).getElementsByTagName('input');
	var tmp_value_list = [];
	for(var i=0;i<checkbox_list.length;i++) 
	{
		if(checkbox_list[i].type == 'checkbox')
		{
			checkbox_list[i].checked = true;
			tmp_value_list[i] = checkbox_list[i].name;
		}
	}
	document.getElementById(field_name).value = tmp_value_list.join(',');

}

function checkNone(container,field_name) {
	var checkbox_list = document.getElementById(container).getElementsByTagName('input');
	for(var i=0;i<checkbox_list.length;i++) 
	{
		if(checkbox_list[i].type == 'checkbox')
		{
			checkbox_list[i].checked = false;
		}
	}
	document.getElementById(field_name).value = '';
}

function checkInvert(container,field_name) {
	var checkbox_list = document.getElementById(container).getElementsByTagName('input');
	for(var i=0;i<checkbox_list.length;i++) 
	{
		if(checkbox_list[i].checked)
		{
			checkbox_list[i].checked = false;
		}
		else 
		{
			checkbox_list[i].checked = true;
		}
		update_checkbox_list(checkbox_list[i].name,field_name);
	}
}
