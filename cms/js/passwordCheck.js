function passStrength(password) 
{
	var pass_strength = 0;
	var re = /[a-z]/.test(password);
	if(re == true)
	{
		pass_strength++;
	}
	var re = /[A-Z]/.test(password);
	if(re == true)
	{
		pass_strength++;
	}
	var re = /[0-9]/.test(password);
	if(re == true)
	{
		pass_strength++;
	}
	var spec_chars = /[^a-z0-9]/i;
	var re = spec_chars.test(password);
	if(re == true)
	{
		pass_strength++;
	}
	
	return pass_strength;
}

function updateStrengthDisplay(password)
{
	
	
	var str_text = document.getElementById('strength_text');
	if(password.length == 0) {
		str_text.innerHTML = '';	
		return;
	}
	
	var pass_str = passStrength(password);
	
	if(pass_str <= 2) 
	{
		str_text.innerHTML = 'Light';
		str_text.style.color = 'red';
		str_text.style.fontWeight = 'bold';
		
	}
	if(pass_str == 3) 
	{
		str_text.innerHTML = 'Moderate';
		str_text.style.color = 'orange';
	}
	if(pass_str == 4)
	{
		str_text.innerHTML = 'Strong';
		str_text.style.color = 'green';
	}
}