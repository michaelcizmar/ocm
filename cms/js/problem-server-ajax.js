function problem_code_lookup(str) {
	if (str.length < 2) { return; }

	xmlHttp=GetXmlHttpObject();
	if (xmlHttp==null) {
  		alert ("Your browser does not support AJAX!");
  		return;
	} 
	
	var url="%%[base_url]%%/services/problem-server-ajax.php";
	url=url+"?problem="+str;
	xmlHttp.onreadystatechange=problemStateChanged;
	xmlHttp.open("GET",url,true);
	xmlHttp.send(null);
}

function problemStateChanged() 
{	
	if (xmlHttp.readyState==4 || xmlHttp.readyState=="complete") { 
		xmlDoc=xmlHttp.responseXML;
		var problems = xmlDoc.getElementsByTagName("problem");
		
		var problem_menu = document.getElementById("sp_problem");
		problem_menu.length = 0;
		problem_menu.options[0] = new Option('','');
		for(var i = 0; i < problems.length; i++) {
			var problem = problems[i];
			var problem_value = problem.getElementsByTagName("value")[0].firstChild.nodeValue;
			var problem_label = problem.getElementsByTagName("label")[0].firstChild.nodeValue;
			
			if(problem_value != null && problem_label != null) {
				var next_index = problem_menu.length;
				problem_menu.options[next_index] = new Option(problem_label,problem_value);
			}	
		}
	}
	return;
}
