function zipcode_lookup(str) {
	if (str.length < 5) { return; }

	xmlHttp=GetXmlHttpObject();
	if (xmlHttp==null) {
  		alert ("Your browser does not support AJAX!");
  		return;
	} 
	
	var url="%%[base_url]%%/services/zip-server-ajax.php";
	url=url+"?zip="+str;
	xmlHttp.onreadystatechange=zipStateChanged;
	xmlHttp.open("GET",url,true);
	xmlHttp.send(null);
}

function zipStateChanged() 
{ 
	if (xmlHttp.readyState==4 || xmlHttp.readyState=="complete") { 
		xmlDoc=xmlHttp.responseXML;
		var city = xmlDoc.getElementsByTagName("city")[0];
		if(city.firstChild != null) {
			document.getElementById("city").value = city.firstChild.nodeValue;
		}
		var state = xmlDoc.getElementsByTagName("state")[0];
		if(state.firstChild != null) {
			document.getElementById("state").value = state.firstChild.nodeValue;
		}
		var county = xmlDoc.getElementsByTagName("county")[0];
 		if(county.firstChild != null) {
			document.getElementById("county").value = county.firstChild.nodeValue;
 		}
	}
}
