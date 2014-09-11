<script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript">

var unsaved_changes = false;
function setConfirmUnload(on) {
	window.onbeforeunload = (on) ? unloadMessage : null;
}

function unloadMessage() {
	return 'You have entered new data on this page.  If you navigate away from this page without first saving your data, the changes will be lost.';
}

// 2013-07-11 AMW - Changed selector syntax to work with jQuery 2.
$(document).ready(function() {
	$('form[name="ws"] :input').change(function () {
		setConfirmUnload(true); }); // Prevent accidental navigation away
	$('form[name="ws"] :submit').click(function () {
		setConfirmUnload(false); }); // They've clicked sav - navigate away
});
</script>