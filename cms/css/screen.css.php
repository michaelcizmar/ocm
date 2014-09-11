<?php
chdir('..');
define('PL_DISABLE_SECURITY',true);
define('PL_DISABLE_MYSQL',true);
require_once('pika-danio.php');
pika_init();
$url = pl_settings_get('base_url');
header("Content-Type: text/css");
?>

a:hover {
	color: #000000;
}

a:link {
	color: #000000;
}

a:visited {
	color: #000000;
}

a:active {
	color: #000000;
}

body {
	padding-right: 0em;
	padding-left: 0em;
	padding-bottom: 0em;
	padding-top: 0em;
	background-color: #e0e0e0;
	margin: 0em;
	font-family: helvetica, arial, sans-serif;
	color: black;
	font-size: 0.8em;
}

div {
	text-align: left;
	overflow: visible;
}

h1 {
    color: black;
	font-size: 1.2em;
	border-bottom: gray;
	margin-top: .4em;
	margin-bottom: 0em;
}

h2 {
	text-transform: uppercase;
	color: #0d1532;
	margin-top: .5em;
	font-size: 1.1em;
}

h3 {
	font-size: 0.7em;
	color: #666666;
	margin: .25em;
	margin-left:0em;
	padding: 0.2em;
	padding-left: 0em;
}

input, select {
	font-size: 0.9em;
}

iframe {
	border: 1px #999999 solid;
}

img {
	border: black 0em solid;
}

label {
 cursor: pointer;
} 

table
{
	margin-left: 0.5em;
	margin-right: 0.5em;
}

table.nopad
{
	margin-left: 0em;
	margin-right: 0em;
}

tr {
	font-family: Geneva, Arial, Helvetica, san-serif; 
}

th {
	text-align: left;
	font-size: 0.95em; 	
	padding: 0.3em;
	color: white; 
	background: url(<?php echo $url; ?>/images/th-gradient.jpg) 0 0 repeat-x #3737ca;
}

th a, th a:visited, th a:link { color: #fff; }

ul {
	list-style: none;
	margin-left: 0.6em;
	margin-right: 0.6em;
	padding: 0em;
}

#auth_label, #auth_label a {
	font-size: 1.0em;
	font-weight: normal;
	padding: 0em;
	margin: 0em;
	padding-top: 0.6em;
	margin-left: 0.1em;
	margin-bottom: 0em;
	font-size: 1.0em;
	text-align: right;
	color: #222222;
}

#bottom_searchbox {
padding-top: 2em;
padding-bottom: 1em;
}

#cal_tabs {
float:left;
padding-right: 1em;
background:url(<?php echo $url; ?>/images/tab_gradient.jpg) repeat-x bottom;
font-size:80%;
line-height:normal;
}

#cal_tabs ul {
margin:0;
list-style:none;
}

#cal_tabs li {
float:left;
margin:0;
padding:0 0 0 9px;
}

#cal_tabs a {
display:block;
background-color: #cccccc;
padding:5px 10px 4px 6px;
border-top-color: #aaaaaa;
border-left-color: #aaaaaa;
border-right-color: #aaaaaa;
border-right-width: 1px;
border-right-style: solid;
border-left-style: solid;
border-top-style: solid;
border-left-width: 1px;
border-top-width: 1px;
text-decoration:none;
}

#cal_tabs #current a {
border-top-color: #aaaaaa;
border-left-color: #aaaaaa;
border-right-color: #aaaaaa;
border-right-width: 1px;
border-right-style: solid;
border-left-style: solid;
border-top-style: solid;
border-left-width: 1px;
border-top-width: 1px;
background-color: #dddddd;
padding-bottom:5px;
}

#case_screen {
padding-left: 0.7em;
}

#case_summary {
border: 1px yellow solid; background-color: #ffffaa; padding: .3em; margin-top: 1em;
} 

#case_tabs {
font-size:80%;
margin-bottom: 1em;
}

#case_tabs ul {
margin:0;
list-style:none;
background:url(<?php echo $url; ?>/images/tab_gradient.jpg) repeat-x bottom;
padding: 0.4em;
margin-top: 0.6em;
}

#case_tabs li {
margin:0;
padding:0 0 0 9px;
display: inline;
}

#case_tabs a {
background-color: #cccccc;
padding:5px 10px 4px 6px;
border-top-color: #aaaaaa;
border-left-color: #aaaaaa;
border-right-color: #aaaaaa;
border-right-width: 1px;
border-right-style: solid;
border-left-style: solid;
border-top-style: solid;
border-left-width: 1px;
border-top-width: 1px;
text-decoration:none;
}

#case_tabs #current a {
border-top-color: #aaaaaa;
border-left-color: #aaaaaa;
border-right-color: #aaaaaa;
border-right-width: 1px;
border-right-style: solid;
border-left-style: solid;
border-top-style: solid;
border-left-width: 1px;
border-top-width: 1px;
background-color: #dddddd;
padding-bottom:5px;
}

#copyright, #copyright a {
padding: 0.0em;
color: #303030;
text-align: center;
}

#warning_link {
padding: 0.0em;
color: #303030;
text-align: center;
}

#warning_list {
padding: 0.0em;
color: #303030;
}

#footer {
	margin: 0em;
	margin-top: 1em;
	width: 59em;
	border-top-color: #3737ca;
	border-top-style: solid;
	border-top-width: 4px;	                   
	background-repeat: repeat-x;
	background-position: top;
	background-image: url(<?php echo $url; ?>/images/drop-shadow.jpg);
}

#header_wrapper {
	width: 59em;
	border-top-color: #3737ca;
	border-top-style: solid;
	border-top-width: 4px;	                   
	padding-bottom: 0.4em;
	padding-top: 0.2em;
	padding-right: 0.2em;
	background-color: #afafaf;
	background-repeat: repeat-x;
	background-position: bottom;
	background-image: url(<?php echo $url; ?>/images/4-gray-high.jpg);
}

#header {
	padding-top: 0.6em;
	padding-bottom: 0.0em;
	padding-left: 0.5em;
	margin: 0em;
	width: 59em;
}

#main {
	width: 59em;
	margin: 0em;
}

#middle-content {
	padding: 0em;
	margin: 0em;
}

#ql {
	color: #303030;
	width: 59em;
	text-align: center;
	padding: .3em;
}

#ql a {
	color: #303030;
}

#quick_links li {
	list-style-type: none;
	display: inline;
	padding: 0em;
	margin: 0em;
	margin-left: 0.4em;
	margin-right: 0.4em;
}

#quick_links {
	padding: 0em;
	margin: 0em;
}

#quick_links a
{
	color: #FFFFFF;
}

#searchbox {
	text-align: right;
	padding-top: 0.1em;
}

#site_name {
	padding: 0.0em;
	margin: 0.0em;
	margin-left: 0.3em;
	font-size: 1.6em;
	font-weight: bold;
}

#site_name a {
	text-decoration: none;
	color: black;
}

#shortcuts {
	width: 59em;
	text-align: center;
	color: #777777;
	padding: 0em;
	margin-top: 0.3em;
	margin-bottom: 0.9em;
}

#shortcuts a {
	color: #2a2a2a;
}

#software_label {
	padding: 0.2em;
	margin: 0.2em;
	padding-left: 0em;
	margin-left: 0.55em;
	font-size: 1.0em;
	color: #222222;
}

#software_label a{
	color: #222222;
}





/* Standardize the size of data entry fields.
*/
.de select {
	width: 14.5em;
}

.de input {
	width: 14.5em;
}

.de textarea {
	width: 14.5em;
}

.de input.plcheck, .de input.plradio {
	width: 1.1em;
}

/* Specialized data entry fields.
*/
.de input.city {
	width: 11.8em;
}

.de input.state {
	width: 1.9em;
}

.de input.zip {
	width: 5em;
}

.de input.county {
	width: 8.7em;
}

.de input.acode {
	width: 3em;
	border-style: none; 
	padding: 0em;
}

.de input.phone {
	width: 8em;
	border-style: none;
	padding: 0em;
}

/* Standardize the size of fields in the sidebar.
*/
.side select {
	width: 11.9em;
}

.side input {
	width: 11.9em;
}

.side input.plcheck, .side input.plradio {
	width: 1.1em;
}

/* Eligibility fields.
*/
.elig input {
	width: 5.5em;
}

.elig select {
	width: 10em;
}

.elig1 input {
	width: 2em;
}

.elig2 input {
	width: 5.5em;
}

/* Settings fields.
*/
.settings input {
	width: 18em;
}

.settings select {
	width: 18em;
}

.settings input.plcheck, .settings input.plradio {
	width: 1.1em;
}

/* Case list fields. */
.clf select {
	width: 10em;
}

.clf input {
	width: 10em;
}

td.side-column {
	width: 13em;
}

td.contact-column table {

	margin-left: 0.6em;
	margin-right: 0.6em;
	width: 12.7em;
}

td.contact-column p { margin-bottom: 0em; }
td.side-column ul { padding: 0 0 0 1.5em; }

/* alternating table rows */
.row1 { background-color: transparent; }
.row2 { background-color: #c4c7a5; }
/* .row2 A:hover {	background-color: #ffffff; } */

/* "masked" form fields */
.maskf { border-style: none;  margin: 3px 0px 3px 0px;}
.maskt { border: inset #d0d0d0 1px; padding: 2px; background-color: #ffffff; white-space: nowrap; }

input.save
{
	border: 2px yellow outset;
	background-color: blue;
	background-image: url(<?php echo $url; ?>/images/button-gradient.jpg);
	background-repeat: repeat;
	font-weight: bold;
	font-size: 1.1em;
}

.thinborder {
	border-color: #bbbbbb;
	border-style: solid;
	border-top-width: 1px;
	border-right-width: 1px;
	border-bottom-width: 1px;
	border-left-width: 1px;
}

.abutt
{
	border: #CCCCCC 2px outset;
	background-color: #CCCCCC;
	color: black;
	/* font-weight: bold; */
	font-size: .99em;
	padding-left: .3em;
	padding-right: .3em;
	padding-top: .0913em;
	padding-bottom: .0913em;
	text-decoration: none;
}

/* calendar rows (w/ gray border) */
.calrow { 
	border: #888888 1px solid; 
	background-color: #ffffff;
}

.mycal { font-size: 0.7em; }
.othercal { font-size: 0.7em; color: #555555; }

/* case notes text formatting styles */
.yh {background-color: #ffff44;}
.ph {background-color: #ff7777;}
.lt {text-decoration: line-through;}
.ul {text-decoration: underline;}


/* date_selector calendar style */

.DSCalHeader td{
	text-align:center;
	vertical-align:center;
	text-decoration:none;
	font-weight:bold;
	font-family:arial;
	font-size:10pt;
}
.DSCalSelectedDate{
	font-weight:bold;
	border: solid;
	border-width: 1px;
}

.DSCalDaysOfWeek td{
	text-align:center;
	vertical-align:center;
	font-weight:bold;
	font-family:arial;
	font-size:8pt;
	border: solid;
	border-width: 0px 0px 1px 0px;
}
.DSCalWeek td{
	vertical-align:center;
	text-align:center;
	font-family:anandale mono, helvetica, arial;
	font-size:8pt;
}
.DSCalFooter td{
	vertical-align:center;
	text-align:center;
	font-family:anandale mono, helvetica, arial;
	font-size:8pt;
	font-weight:bold;
	border: solid;
	border-width: 1px 0px 0px 0px;
}


ul.pika_files {
	line-height: 1.5;
	margin-top: 0;
}
li.directory {
	font-style: normal;
	list-style-image: url(<?php echo $url; ?>/images/folder-shut.gif);
}
li.directory_open {
	font-style: italic;
	list-style-image: url(<?php echo $url; ?>/images/folder-open.gif);
}

.pika_files A:hover {
	color: #666666;
}

.pika_files A.action {
  	font-family: Georgia;
	font-size: 9px;
	color: #666666;
}  	
.pika_files LI.description {
	list-style-image: none; 
	font-family: Georgia;
	font-size: 9px;
	color: #666666;
}

li.file { 
	font-style: normal;
	list-style-image: url(<?php echo $url; ?>/images/file.png); 
}

span.folder_actions {
	font-family: Georgia; 
	font-size: 9px; 
	color: #666666;
}

