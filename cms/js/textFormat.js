function no_op()
{
	return;
}

function AddTag(tag) 
{
	// 2013-07-11 AMW - Changed form name to "ws" so unsaved form warning can be used.
	document.ws.notes.value=document.ws.notes.value+tag;
	document.ws.notes.focus();
	return;
}

function toggleBox(szDivID, iState) // 1 visible, 0 hidden
{
   var obj = document.layers ? document.layers[szDivID] :
   document.getElementById ?  document.getElementById(szDivID).style :
   document.all[szDivID].style;
   obj.visibility = document.layers ? (iState ? "show" : "hide") :
   (iState ? "visible" : "hidden");
}