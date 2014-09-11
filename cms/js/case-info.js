document.ws.number.focus();

function set_auto()
{
	document.ws.number.value = "auto";
	return false;
}

function set_close()
{
	document.ws.close_date.value = "%%[current_date]%%";
	return false;
}

function set_problem(code)
{
	document.ws.problem.value = code;
}