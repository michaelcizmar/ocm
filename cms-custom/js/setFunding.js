
function setFunding(id) {

	xmlHttp=GetXmlHttpObject();
	if (xmlHttp==null) {
  		alert ("Your browser does not support AJAX!");
  		return;
	}

	xmlHttp.onreadystatechange=function() {
        if (xmlHttp.readyState==4 || xmlHttp.readyState=="complete") {
            if (xmlHttp.status==200) {
            	if(xmlHttp.responseText != null) {
            		loadValues();
            	} else {
            		return false;
            	}

            }
        }
	}

	var url="%%[base_url]%%/services/cases-lookup-ajax.php";
	url=url+"?case_id="+id;
	xmlHttp.open("GET",url,true);
	xmlHttp.send(null);
}

function loadValues()
{

	xmlDoc=xmlHttp.responseXML;
	funding_form = document.getElementById("funding");
	funding1_form = document.getElementById("funding1");
	funding2_form = document.getElementById("funding2");
	funding3_form = document.getElementById("funding3");
	category_form = document.getElementById("category");
	status_form = document.getElementById("status");
	paitime_form = document.getElementById("paitime");
	

	var funding = xmlDoc.getElementsByTagName("funding")[0];
	var funding1 = xmlDoc.getElementsByTagName("funding1")[0];
	var funding2 = xmlDoc.getElementsByTagName("funding2")[0];
	var funding3 = xmlDoc.getElementsByTagName("funding3")[0];
	var status = xmlDoc.getElementsByTagName("status")[0];
	
	
	
	
	if(funding_form.value == '') {

	if(status.firstChild.nodeValue == 7 || status.firstChild.nodeValue == 5 ) {

		if(funding != null) {
			category_form.value = "CS";
			
			paitime_form.checked = "checked";
			funding_form.value = funding.firstChild.nodeValue;
			funding1_form.value = funding1.firstChild.nodeValue;
			funding2_form.value = funding2.firstChild.nodeValue;
			funding3_form.value = funding3.firstChild.nodeValue;
	}
}

 if(funding_form.value == '') {

		if(funding != null) {
			category_form.value = "CS";
			
			paitime_form.checked = "";
			funding_form.value = funding.firstChild.nodeValue;
			funding1_form.value = funding1.firstChild.nodeValue;
			funding2_form.value = funding2.firstChild.nodeValue;
			funding3_form.value = funding3.firstChild.nodeValue;
	}
}

}

	else
	if (funding_form.value != '' && funding != null)
	{
		if (confirm('Would you like to update the "Primary" code to match this new case?'))
		{
if(status.firstChild.nodeValue == 7 || status.firstChild.nodeValue == 5 ) {

		if(funding != null) {
			category_form.value = "CS";
			
			paitime_form.checked = "checked";
			funding_form.value = "";
			funding1_form.value = "";
			funding2_form.value = "";
			funding3_form.value = "";
			paitime_form.checked = "checked";
			funding_form.value = funding.firstChild.nodeValue;
			funding1_form.value = funding1.firstChild.nodeValue;
			funding2_form.value = funding2.firstChild.nodeValue;
			funding3_form.value = funding3.firstChild.nodeValue;

	}
}

 else

		if(funding != null) {
if(status.firstChild.nodeValue !== 7 || status.firstChild.nodeValue !== 5 ) {
			category_form.value = "CS";
			
			paitime_form.checked = "";
			funding_form.value = "";
			funding1_form.value = "";
			funding2_form.value = "";
			funding3_form.value = "";
			funding_form.value = funding.firstChild.nodeValue;
			funding1_form.value = funding1.firstChild.nodeValue;
			funding2_form.value = funding2.firstChild.nodeValue;
			funding3_form.value = funding3.firstChild.nodeValue;;


	}
}
			
		}	

		}
}



function set_fund(id)
{
	setFunding(id);
}
